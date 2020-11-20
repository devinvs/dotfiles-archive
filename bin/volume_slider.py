#!/usr/bin/python

import sys
import time
import subprocess
import re
from PyQt5 import QtCore
from PyQt5.QtCore import Qt, QThread, pyqtSignal, QTimer
from PyQt5.QtWidgets import QApplication, QSlider, QMainWindow

slider_style = """
QSlider {
    min-width: 25px;
    max-width: 25px;
}

QSlider::groove:vertical {
    border: 0px;
    width: 6px;
    background: #75b2f0;
    border-radius: 10px;
    margin 12px 0;
}

QSlider::sub-page:vertical {
    background: #75b2f0;
    width: 6px;
}

QSlider::add-page:vertical {
    background: #3991ea;
    width: 6px;
    border-radius: 4px;
}

QSlider::handle:vertical {
    height: 16px;
    width: 10px;
    border-radius: 32px;
    background: #3991ea;
    margin: 0 -10px;
}

"""


class Worker(QThread):
    output = pyqtSignal(int)

    def __init__(self, parent=None):
        QThread.__init__(self, parent)
        self.exiting = False
        self.volume = 0
        self.start()

    def run(self):
        while True:
            volume = self.getVolume()

            if self.volume != volume:
                self.volume = volume
                self.output.emit(volume)

            time.sleep(0.1)

    def getVolume(self):
        process = subprocess.run(["amixer", "get", "Master"],
                                 stdout=subprocess.PIPE,
                                 universal_newlines=True)
        vol_str = process.stdout
        volume = re.search("Front Left:(.*)[on]", vol_str)[0]
        volume = volume.split(' ')[4].replace("[", "").replace("]", "").replace("%", "")
        volume = int(volume)
        return volume

    def __del__(self):
        self.exiting = True
        self.wait()


class MainWindow(QMainWindow):

    def __init__(self):
        super().__init__()

        self.thread = Worker()

        self.startTimer()

        self.slider = QSlider(Qt.Vertical, self)
        self.slider.setGeometry(16, 16, 30, 350)
        self.slider.valueChanged[int].connect(self.volumeChanged)
        self.slider.setStyleSheet(slider_style)

        self.thread.output[int].connect(self.slider.setValue)

        self.setGeometry(0, 0, 62, 382)

        self.show()

    def startTimer(self):
        def close_if_inactive():
            if self.inactive:
                self.close()
            else:
                self.startTimer()

        self.inactive = True
        QTimer.singleShot(2000, close_if_inactive)

    def volumeChanged(self, value):
        self.inactive = False
        subprocess.run(["amixer", "sset", "'Master'", f"{value}%"])

    def update(self, vol):
        self.slider.setValue(vol)


if __name__ == "__main__":
    app = QApplication(sys.argv)
    app.setApplicationName("VolumeSlider")
    win = MainWindow()
    sys.exit(app.exec())

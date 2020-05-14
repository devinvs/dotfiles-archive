ls -A | grep -vf .installignore | xargs cp -r -t build

PREFIX="##"
SUFFIX="##"

NUM_KEYS=$(cat colors | sed '/^[[:space:]]*$/d' | wc -l)


echo $NUM_KEYS

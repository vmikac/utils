#!/bin/bash

while [[ $# -gt 0 ]]
do
key="$1"
case $key in
    -a|--after)
    AFTER="$2"
    shift # past argument
    shift # past value
    ;;
    -u|--until)
    UNTIL="$2"
    shift # past argument
    shift # past value
    ;;
    -m|--mail)
    MAIL="$2"
    shift # past argument
    shift # past value
    ;;
esac
done

# todo: finish parameter check
# if [ -z ${AFTER+x} ]; then echo "After is unset"; exit ; fi

echo "After: "$AFTER
echo "Until: "$UNTIL
echo "Mail: "$MAIL
echo "Total committed lines (newly added):"
git log --pretty=format:"%ad - %ae: %s" --after=$AFTER --until=$UNTIL --author=$MAIL --numstat | grep -v $MAIL | awk '{print $1}' | grep -v '^$' | grep -v '-' | paste -s -d '+' | bc 

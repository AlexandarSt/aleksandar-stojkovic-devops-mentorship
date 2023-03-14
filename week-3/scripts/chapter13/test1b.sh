#!/bin/bash
# testing the for variable after looping

for test in Alabama Alaska Arizona Arkansas California Colorado
do
	echo "The next state is $test"
done
echo "The last state we visited is $test"
test=Connecticut
echo "Wait, now we are visiting $test"


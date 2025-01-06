#!/bin/bash

MOVIES=("Puspa", "RRR", "Devera") # index starts from 0, array size 3

echo "First Movie is:: ${MOVIES[0]}"
echo "Second Movie is:: ${MOVIES[1]}"
echo "Third Movie is:: ${MOVIES[2]}"

echo "All Movies are:: ${MOVIES[@]}"
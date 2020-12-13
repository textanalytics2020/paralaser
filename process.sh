#!/bin/bash

poetry run python -m paralaser.paraphrase \
    --token-lang de \
    --margin absolute \
    -i dev/input.txt \
    -p dev/paraphrases.txt \


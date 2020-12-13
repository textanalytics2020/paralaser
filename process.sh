#!/bin/bash

poetry run python -m paralaser.paraphrase \
    --token-lang de \
    --text dev/input.txt \
    --margin absolute \
    -i dev/input.txt \
    -p dev/paraphrases.txt \


#!/bin/bash

poetry run python -m paralaser.paraphrase \
    --token-lang de \
    --margin absolute \
    --nprobe 16 \
    --kmax 8 \
    --margin-k 8 \
    --threshold-margin 0.6 \
    --threshold-faiss 0.6 \
    --threshold-L2 0.05 \
    -i dev/input.txt \
    -p dev/paraphrases.txt \


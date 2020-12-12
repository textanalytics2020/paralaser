#!/bin/bash

export LASER=$PWD

model_dir="${LASER}/models"
encoder="${model_dir}/bilstm.93langs.2018-12-26.pt"
bpe_codes="${model_dir}/93langs.fcodes"
edir="embed"

cp dev/input.txt dev/languagesimplification.de

rm embed/languagesimplification.*

python3 source/similarity_search.py \
    --encoder ${encoder} \
    --bpe-codes ${bpe_codes} \
    --lang de \
    --base-dir . \
    --data dev/languagesimplification \
    --output ${edir}/languagesimplification

cp embed/languagesimplification.index.de dev/input.index

python3 source/binary_offsets.py

python3 source/paraphrase.py \
    --encoder ${encoder} \
    --bpe-codes ${bpe_codes} \
    --token-lang de \
    --index dev/input.index \
    --text dev/input.txt \
    --margin absolute \
    -i dev/input.txt \
    -p dev/paraphrases.txt \


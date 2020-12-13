#!/bin/bash

export LASER="$HOME/.local/share/paralaser"

model_dir="${LASER}/models"
encoder="${model_dir}/bilstm.93langs.2018-12-26.pt"
bpe_codes="${model_dir}/93langs.fcodes"
edir="embed"
ddir="dev"

cp ${ddir}/input.txt ${ddir}/languagesimplification.de

rm -rf ${edir}

poetry run python -m paralaser.similarity_search \
    --encoder ${encoder} \
    --bpe-codes ${bpe_codes} \
    --lang de \
    --base-dir . \
    --data ${ddir}/languagesimplification \
    --output ${edir}/languagesimplification

cp ${edir}/languagesimplification.index.de ${ddir}/input.index

poetry run python -m paralaser.binary_offsets

poetry run python -m paralaser.paraphrase \
    --encoder ${encoder} \
    --bpe-codes ${bpe_codes} \
    --token-lang de \
    --index ${ddir}/input.index \
    --text ${ddir}/input.txt \
    --margin absolute \
    -i ${ddir}/input.txt \
    -p ${ddir}/paraphrases.txt \


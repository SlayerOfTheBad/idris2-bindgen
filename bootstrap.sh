#!/bin/bash

STEPS_WIDTH=2
steps=(
    "bootstrap-1"                        "./output/idris2-bindgen --file /usr/include/clang-c/Index.h"
    "$(git rev-parse --abbrev-ref HEAD)" "./output/idris2-bindgen --file /usr/include/clang-c/Index.h"
)

STEPS=$((${#steps[@]} / $STEPS_WIDTH))

for i in $(seq 0 $(($STEPS-1))); do
    GITTAG=${steps[$((($i*$STEPS_WIDTH)+0))]}
    CODEGEN_CMD=${steps[$((($i*$STEPS_WIDTH)+1))]}

    git checkout $GITTAG && \
        idris2 --build --quiet && \
        $CODEGEN_CMD
done

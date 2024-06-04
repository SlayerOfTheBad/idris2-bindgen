#!/bin/bash
clang -shared sys/clangWrapper.c -o clangWrapper.so -lclang -fPIC


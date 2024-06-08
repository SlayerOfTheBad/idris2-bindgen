#!/bin/bash
clang -shared sys/clangWrapper.c -o clangWrapper.so -lclang -fPIC
clang -shared sys/wrapper.c -o wrapper.so -lclang -fPIC


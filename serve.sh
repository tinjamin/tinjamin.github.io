#!/bin/sh

make clean && make all && cd docs && miniserve --index index.html

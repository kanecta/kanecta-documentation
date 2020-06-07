#!/bin/bash

set -x

rm -rf dist
mkdir dist
asciidoctor docs/*.adoc --destination-dir dist
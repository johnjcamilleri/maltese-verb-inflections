#!/bin/sh

# Convert all treebanks from Maltese RG into "VerbCSV" format, using convert.sh

srcdir='../GF/lib/src/maltese/test/verbs/'
dstdir='data/'

for f in `ls "${srcdir}"`
do
    newfile=`echo "${f}" | sed 's/treebank/txt/'`
    ./convert.sh "${srcdir}${f}" > "${dstdir}${newfile}"
done

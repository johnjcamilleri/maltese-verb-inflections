#!/bin/sh

# Script to convert output of old GF verb table
# into "VerbCSV" format

if [ $# -ne 1 ]
then
  echo "Usage: `basename $0` treebank"
  exit
fi

# Headers
echo aspect,subj,do,io,pol,surface

start=4
count=1152

tail -n+${start} "${1}" | head -n${count} | sed \
-e 's/s . //g' \
-e 's/ => /,/g' \
-e 's/VPerf (\?\([^),]*\))\?/Perf,\1/g' \
-e 's/VImpf (\?\([^),]*\))\?/Impf,\1/g' \
-e 's/VImp \(..\)/Imp,P2 \1/g' \
-e 's/VSuffixNone/-,-/g' \
-e 's/VSuffixDir (\?\([^),]*\))\?/\1,-/g' \
-e 's/VSuffixInd (\?\([^),]*\))\?/-,\1/g' \
-e 's/VSuffixDirInd (GSg \(Fem\|Masc\)) (\?\([^),]*\))\?/P3 Sg \1,\2/g' \
-e 's/VSuffixDirInd GPl (\?\([^),]*\))\?/P3 Pl,\1/g' \
-e 's/Ag\(P[12]\)/\1/g' \
-e 's/Ag\(P3\)/\1 /g' \
-e 's/NOEXIST/-/g' \

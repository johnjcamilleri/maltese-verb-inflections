Maltese verb inflections
========================

Manually checked inflection tables for a few Maltese verbs, for testing morphological generators (or anything else you can think of).


## The VerbCSV format

This is a custom-designed format in which the data files are prepared.
It's nothing special, just a CSV file for what I consider to be the full inflection table of a Maltese verb.
The first line contains the headings. These examples below should be self-explanatory
(I have added spacing so that the columns line up nicely; the actual data files do not have this.)

```
Aspect, Subject, DO,         IO,        Polarity, Surface form
Perf,   P1 Sg,   -,          -,         Pos,      ktibt
Perf,   P1 Sg,   -,          -,         Neg,      ktibtx
Perf,   P1 Sg,   P2 Sg,      -,         Pos,      ktibtek
Perf,   P1 Sg,   P2 Sg,      -,         Neg,      ktibtekx
Perf,   P1 Sg,   -,          P3 Sg Fem, Pos,      ktibtilha
Perf,   P1 Sg,   -,          P3 Sg Fem, Neg,      ktibtilhiex
Perf,   P1 Sg,   P3 Sg Masc, P2 Pl,     Pos,      ktibthulkom
Perf,   P1 Sg,   P3 Sg Masc, P2 Pl,     Neg,      ktibthulkomx
Impf,   P3 Pl,   P1 Pl,      -,         Pos,      jiktbuna
Impf,   P3 Pl,   P1 Pl,      -,         Neg,      jiktbuniex
Impf,   P3 Pl,   -,          P1 Pl,     Pos,      jiktbulna
Impf,   P3 Pl,   -,          P1 Pl,     Neg,      jiktbulniex
Impf,   P3 Pl,   P3 Sg Masc, P1 Sg,     Pos,      jiktbuhuli
Impf,   P3 Pl,   P3 Sg Masc, P1 Sg,     Neg,      jiktbuhulix
Imp,    P2 Sg,   -,          P3 Pl,     Pos,      iktbilhom
Imp,    P2 Sg,   -,          P3 Pl,     Neg,      iktbilhomx
Imp,    P2 Sg,   P3 Sg Masc, P1 Sg,     Pos,      iktibhuli
Imp,    P2 Sg,   P3 Sg Masc, P1 Sg,     Neg,      iktibhulix
```

Note that this is intended as an intermediary format for easy processing.
Also note that we have one file per verb.

## Empty files

Some files are empty, such as `mtela.csv`. I basically have not had time to do them yet. Pull requests are welcome!

## Null entries

Some inflection combinations simply do not make sense, and in these cases a null entry will appear. That is to say that all files have the same number of rows, but not necessarily the same numbers of non-null entries.

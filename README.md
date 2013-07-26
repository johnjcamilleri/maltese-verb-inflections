Maltese verb inflections
========================

Manually checked inflection tables for a few Maltese verbs, for testing automatically generated inflection tables.


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

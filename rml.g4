

eventExp: eventExp ('|' eventExp) # patternEventExp
        | '{' (field (',' field)*)? '}' # objectEventExp
        .
        .
        .
field: fieldKey ':' eventExp ;

eventExp: eventExp ('|' eventExp) # patternEventExp
        | '{' (field (',' field)*)? '}' # objectEventExp
        | listEventExp # listEventExpr // note last 'r' to avoid name clashing with rule
        .
        .
        .
listEventExp: '[' ']' # emptyList
            | '[' ELLIPSIS ']' # ellipsisList
            | '[' eventExp (',' eventExp)* (',' ELLIPSIS)? ']' # nonEmptyList
            ;

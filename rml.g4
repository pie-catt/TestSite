

eventExp: eventExp ('|' eventExp) # patternEventExp
        | '{' (field (',' field)*)? '}' # objectEventExp
        .
        .
        .
field: fieldKey ':' eventExp ;

eventExp: eventExp ('|' eventExp) # patternEventExp
        | '{' (field (',' field)*)? '}' # objectEventExp
        | listEventExp # listEventExpr 
        .
        .
        .
listEventExp: '[' ']' # emptyList
            | '[' ELLIPSIS ']' # ellipsisList
            | '[' eventExp (',' eventExp)* (',' ELLIPSIS)? ']' # nonEmptyList
            ;

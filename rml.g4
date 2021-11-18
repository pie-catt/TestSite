

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


eventExp: eventExp ('|' eventExp) # patternEventExp
        | '{' (field (',' field)*)? '}' # objectEventExp
        | listEventExp # listEventExpr 
        | '(' eventExp ')' # parenEventExp
        | STRING # stringEventExp
        | INT # intEventExp
        | FLOAT # floatEventExp
        | BOOLEAN # boolEventExp
        | evtypeVar # varEventExp
        | '_' # ignoredEventExp
        ;
field: fieldKey ':' eventExp ;
listEventExp: '[' ']' # emptyList
            | '[' ELLIPSIS ']' # ellipsisList
            | '[' eventExp (',' eventExp)* (',' ELLIPSIS)? ']' # nonEmptyList
            ;

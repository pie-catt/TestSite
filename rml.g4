

eventExp: eventExp ('|' eventExp) # patternEventExp
        | '{' (field (',' field)*)? '}' # objectEventExp
        .
        .
        .
field: fieldKey ':' eventExp ;

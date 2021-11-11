

eventExp: '{' (field (',' field)*)? '}' # objectEventExp
        | '(' eventExp ')' # parenEventExp
        | listEventExp: '[' ']' # emptyList
                      | '[' ELLIPSIS ']' # ellipsisList
                      | '[' eventExp (',' eventExp)* (',' ELLIPSIS)? ']' # nonEmptyList
                      ;
        


            
            field: fieldKey ':' eventExp ;



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
            
            
            .....( eventExp ).....
            
            ;
            
            
            
            
exp: exp '*' # starExp
   | exp '+' # plusExp
   | exp '?' # optionalExp
   | exp '!' # closureExp
   | <assoc=right> exp exp # catExp
   | exp '/\\' exp # andExp
   | exp '\\/' exp # orExp
   | exp '|' exp # shufExp
   | evtype '>>' leftBranch=exp (':' rightBranch=exp)? # filterExp
   | EMPTY # emptyExp
   | ALL # allExp
   | '{' DEC evtypeVar (',' evtypeVar)* ';' exp '}' # blockExp
   | IF '(' dataExp ')' exp ELSE exp # ifElseExp
   | expId ('<' dataExp (',' dataExp)* '>')? # varExp
   | evtype # evtypeExp
   | '(' exp ')' # parenExp
   ;

exp:
   .
   | EMPTY # emptyExp
   | ALL # allExp
   .
   | expId ('<' dataExp (',' dataExp)* '>')? # varExp
   | evtype # evtypeExp
   .
   .
   ;

exp: exp '*' # starExp
   | exp '+' # plusExp
   | exp '?' # optionalExp
   | exp '!' # closureExp
   | exp '/\\' exp # andExp
   | exp '\\/' exp # orExp
   | exp '|' exp # shufExp
   | evtype '>>' leftBranch=exp (':' rightBranch=exp)? # filterExp
   .
   .
   | '(' exp ')' # parenExp
   ;

package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]
espacio=[ ,\t,\r,\n]+
%{
    public String lexeme;
%}
%%
break |
case |
chan |
const |
continue |
default |
defer |
else |
fallthrough |
for |
func |
go |
goto |
if |
import |
interface |
map |
package |
range |
return |
select |
struct |
switch |
type |
var|
else {lexeme=yytext(); return Reservadas;}

int | 
uint |
uint8 |
float  |
float32 |
complex64 |
string |
bool |
byte {lexeme=yytext(); return T_dato;}

"==" |
"!=" |
"<" |
"<=" |
">" |
">=" {return Op_Comparacion;}

{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"=" {return Igual;}
"+" {return Suma;}
"-" {return Resta;}
"*" {return Multiplicacion;}
"/" {return Division;}
"%" {return Residuo;}

"&&" |
"||" |
"!" {return Op_Logico;}

"<<" |
">>" |
"&" |
"|" |
"^" |
"&^"  {return Op_Aritmetico;}



"+=" |
":=" {return Op_Asignacion;}

{L}({L}|{D})* {lexeme=yytext(); return Identificador;}

("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}

("(-"{D}*"."{D}*")")|({D}*"."{D}*) {lexeme=yytext(); return Real;}
 . {return ERROR;}
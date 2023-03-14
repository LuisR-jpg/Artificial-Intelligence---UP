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
if |
else |
while {lexeme=yytext(); return Reservadas;}
int | 
double |
float {lexeme=yytext(); return T_dato;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"=" {return Igual;}
"+" {return Suma;}
"-" {return Resta;}
"*" {return Multiplicacion;}
"/" {return Division;}
"&&" |
"||" |
"!" {return Op_Logico;}
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
("(-"{D}*"."{D}*")")|({D}*"."{D}*) {lexeme=yytext(); return Real;}
 . {return ERROR;}

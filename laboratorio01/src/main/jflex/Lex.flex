//Codigo integro
package compiladores.laboratorio01;
import java.io.*;

%%
//Opciones y declaraciones
%public
%class NotacionLexer

digit = [0-9]
sign = [+|-]
letter = [E|e]
whitespace = [\t\r]
newline = [\n]
punto = [.]

%type Token

%eofval{
  return new Token(TokenConstant.EOF,null);
%eofval}

%%
{sign}?{digit}+  {return new Token(TokenConstant.ENTERO,yytext());}
{sign}?{digit}+{punto}{digit}+  {return new Token(TokenConstant.DECIMAL,yytext());}
{sign}?{digit}+({punto}?{digit}+){letter}({sign}?){digit}+  {return new Token(TokenConstant.NOTACION,yytext());}
{whitespace}+  {/*Ignorar*/}
{newline}+  {/*Ignorar*/}
.     { System.err.println("Error: Caracter no reconocido -> " + yytext()); }



# Descripción

Debido a que eres una persona muy amable, te ofreciste a llevar un reporte de la fila de clientes para tu Wal-Mart más cercano. Pero cuando te enteraste que eran muchas personas, preferiste asignarle un identificador entero $h$ a cada uno y mejor harás un programa que se encargue de llevar a cabo $m$ instrucciones, las cuales pueden ser de los siguientes tipos:

- $0$. Significa que empezó a llover y se fueron todas las personas, así que se vació la fila.
- $1$. Quiere decir que se desesperó la última persona, así que se fue.
- $2$ $h$. Llega la persona $h$ y se forma al final de la fila.
- $3$ $h$ $p$. Un abusivo $h$ se formó en la posición $p$ de la fila y sacó a la persona que estaba ahí.

Al final del día, tienes que enseñarle al gerente cómo quedó la fila después de ejecutar la última instrucción.

# Entrada

Un entero $m$ seguido de m líneas de instrucciones.

Está garantizado que los datos de entrada siempre son válidos.

# Salida

Imprime los identificadores de cada persona que queda en la fila después de ejecutar las instrucciones. Sepáralos por un espacio.

Si la fila está vacía, imprime "$:($" sin las comillas.

# Ejemplo

||input
3
2 6 
2 3 
2 8
||output
6 3 8

||input
3
2 1
1
2 3
||output
3

||input
2
2 5
0
||output
:(

||input
3
2 9 
2 8
3 4 0
||output
4 8
||end

# Límites

* Para el 50% de los casos: $0 \leq m \leq 100$
* Para el otro 50% de los casos: $0 \leq m \leq 10^6$

# Class 


###### 27 de Enero


## Deep learning para NLP

Es reconocimiento de patrones o ML para palabras, oraciones y parrafos.

En realidad no emula el cerebro, solo sigue estructuras y dependencias a partir del lenguaje escrito. 

## Que es lenguaje natural? 

Lenguaje natural es el lenguaje que usamos en la vida para comunicarnos: Spanish, English, Portuguese.

A diferencia de los lenguajes artificiales, el natural cambia dependiendo de las generaciones y region. Por lo tanto es muy dificil representar por medio de reglas explicitas y fijas.

### Stages

- Input es documento de texto.

- Se le puede hacer un analisis morfologico. 

    Diccionarios de palabras con caracteristicas; Reglas morfologicas para tratar palabras no conocidas.

- Analisis sintactico para identificar verbos, preposiciones, adverbios.

    Revisar gramatica para formar oraciones validas.

- Analisis semantico para poder entender el significado. 

    Ontologias que capturan el conocimiento del mundo.

### Complicaciones

- Pragmatismo

- Ironia 

- Negacion

## Dos grandes enfoques de NLP en la IA

*Entender* el lenguaje. Llegar al contenido y significado del lenguaje a partir de las palabras.

*Manipular* el lenguaje. Aprovechar las regularidades del lenguaje para tratarlo.

## Enfoque de sistemas expertos

Approach de los 80's para resolver un problema antes de la IA.

Cada problema era atendido por muchos expertos que tenian experiencia en el tema y escribia codigo especifico para resolver un problema.

### Desventajas

Cuello de botella por problemas de comunicacion y la obtencion de datos es barato y complejo.

### Ventajas

El clasificador era interpretable.

---

###### 10 de Febrero

## Raw data

- Online newspapers 

- Social networks

- Email

## Text classification

It's assigning a class to a certain piece of text.

## Approaches

### Bag of words + Support vector machine

It is awesome, its performance it's close to 80% of accuracy.

This is the baseline.

### Term weighting

How can we know how much a word brings to the bag of words.

##### Binary weights

One if the words exists. 

##### Term frequencies

Number of occurrences of a word in the document.

Another approach is registering the percentage that this word takes in the document.

##### TF x IDF weighting scheme

$$w_{i, j} = tf(t_j, d_i) * idf(t_j)$$

#### Its problems

- Bag of words doesn't take semantics into account.

- It fails with polysemy: plant mean different things.

- It suffers of sparse representation.

### Bag of tweets

To have context of each word.

#### DOR - Document Ocurrence Representation

#### TCOR - Term co-ocurrence rerpesentation

How many times did words show up together?

### Neural networks.

If you don't have enough resources to handle nn. It's better to go for the baseline. 

---
My notes have reached this point

---

# Python

## Libraries

**NLTK** Stands for natural language toolkit.

## Package managers

**CONDA**

**PIP**

## Environments

Help magane python and libraries versions.
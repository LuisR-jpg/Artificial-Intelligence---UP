# Guia de segundo parcial

# TCOR?

# Modelos del lenguaje

A model that computes the probability of a sentence or the probability of a new word given a sentence is called a language model.

## How? 

### The chain rule

You can get the probability of a sentence to happen given the following formula:

$$ P(w_1, w_2, ..., w_n) = \prod_i P(w_i|w_1, w_2, ... w_{i - 1}) $$

#### Problem 

There are a lot of sentences that don't exist. Thus, it's not possible to evaluate every single sentence

#### Solution - Markov Assumption

It's not necessary to know a WHOLE sentence to be able to predict what comes next. Thus, we could choose a number k and take a window of k words.

$$ P(w_1, w_2, ..., w_n) = \prod_i P(w_i | w_{i-k}, w{i - k + 1}, ..., w_{i - 1}) $$

## Models

Each model gets a different name depending of the context size

| Window size   | Name      |
|---            |---        |
|k = 1          | Unigram   |
|k = 2          | Bigram    |
|k = 3          | Trigram   |
|k = n          | n-gram    |

In the following, it's represented how to get the probabilities depending on the models

### What can be learned from here

- Common phrases

- Speaking style

- Grammar: $ P(to | want) > P(want | want) $

### Note

These models are good, but most of the times it's not enough because the language has long-distance dependencies $(k \approx 30)$

### Tokens 

- <kbd>\<s>\</s></kbd> Beginning and ending of a sentence.

- <kbd><unk></kbd> Unknown words

    - Open vocabulary. The token is used.

    - Closed vocabulary. All words are already known.

### Unigram models

Makes a random choice, taking as probability the frequency of each word.

$$ P(w_i) = \frac{c(w_i)}{V} $$

Where $c$ is the frequency of the $w_i$ word. 

And $V$ is the size of the vocabulary.

### Bigram models

#### Formula

It's based on a random choice, but the weights are conditional: "probability of $w_i$ given $w_{i - 1}$"

$$ P(w_i | w_{i - 1}) = \frac{c(w_{i - 1}, w_i)}{c(w_i)} $$

#### Representation

##### Raw count

###### Example - (A real matrix has more values and zeros)

||i|want|to|eat|chinese|food|
|---|---|---|---|---|---|---|
|i||827|||||
|want||0|608||||
|to||0||686|||
|eat||0|||||
|chinese||0|||||
|food||0|||||

Where the first term is in the column and the second in the row: 

$$ c("i", "want") = rawCountMatrix["i"]["want"] = 827 $$

##### Raw probabilities

- Comes from the raw count

- It's got after dividing each row by their term incidences

- Tip: Use $log$ to get probabilites because adding is faster than multiplying: 

    $$ log(p_1 \times p_2 ...) = log(p_1) + log(p_2) ... $$

### N-gram models

It usually contains all the previous models.

e.g. A trigram also takes into account bigrams and unigrams

## Evaluation and perplexity

How can we tell whether a phrase is good or not? 

There are two ways:

### Extrinsic evaluation

Best way to compare models. Put them in a specific task, analyse and compute accuracy

#### Problem

Costly in time and money

### Intrinsic evaluation

It uses the principle of perplexity. 

$$ PP(W) = (\prod_{i = 1}^{N}{\frac{1}{P(w_i | w_{i - 1})}})^{\frac{1}{N}} $$

Perplexity is greater with a bad performance

#### Intuition

A good model should give high probabilities to a sentence belonging to the same corpus (test set)

## The Shannon Visualization Method

Should I add this?

## Smoothing 

### Motivation

The probability of a whole sentence, with a single unknown word goes to zero, because the probabilities are a product.

So, we need to give a small probability to unseen words, so zeros are avoided.

### Proposals

#### Add-one estimation aka Laplace Smoothing 

##### Intuition

Suppose you saw every word at least once

##### Formula

$$ P(w_n | w_{n - 1}) = \frac{c(w_{n - 1}, w_n) + 1}{c(w_{n - 1}) + V} $$

##### Problem

- Not used for language models

- Used for text classification

#### Backoff

Use trigram if possible, if not, bigram, else, unigram.

##### Motivation

It's good to use less context

#### Interpolation

Mix all you got

##### Options

- Linear interpolation. Weights depending on what you use: trigram, bigram, unigram.

- Conditional lambdas. Weights depending on each word.

##### Motivation

It's good to use less context

#### Web-scale N-grams

With huge datasets, stupid ideas work.

##### Stupid backoff

#### Good-Turing Smoothing - Advanced

- Unseen words

    - $ P_{GT} = \frac{N_1}{N}$

- Seen words

    - $ c* = \frac{(c + 1)N_{c + 1}}{N_c} $

- Notation

    - $N_c$ - Count of terms we've seen c times.

    - $c(t)$ - # times we saw term $t$.

#### Kneser Ney Smoothing - Advanced

How likely is w to appear as a continuation?





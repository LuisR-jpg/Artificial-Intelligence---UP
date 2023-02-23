# Image Captioning for medical imaging

## Problem

### What's image captioning

[ ] TODO

### Medical imaging

Interpreting and summarizing the insights gained from medical images such as radiology output is a time-consuming task that involves highly trained experts and often represents a bottleneck in clinical diagnosis pipelines.

[ ] MEXICAN STATS: WAIT TIME

### Image captioning for medical imaging

#### Problem statement

The system is intended to compose coherent captions for the entirety of an image. Detecting the interplay of visible elements is crucial for strong performance.

#### Data

Images from the medical literature -> Their captions and associated UMLS terms

Training set: 60,918 radiology images.
Validation set: 10,437 radiology images.
Test set: 10,437 radiology images.

#### Metrics

This year, we will use BERTScore as the primary evaluation metric and ROUGE as the secondary evaluation metric for the caption prediction subtask. Other metrics such as METEOR, CIDEr, and BLEU will also be published.

[ ] LEARN MORE ABOUT THESE

## Architecture

### Transformers

It's an arquitecture that works with data sequences.

First introduced in 2017, transformers come to solve problems with memory.

- Traditional architectures tend to 'forget' data previously analised, making them lose track of context.

It's achieved by using an attention mechanism that allows them to focus on specific parts of the input data.
They're awesome because they're parallelizable.

#### How does it work?

Each token obtains its query vector and calculates a dot product with the key vector of the other tokens.
That product returns a number telling the compatibility; this set of products is called the attention vector, that is, how important are tokens to one another.

[ ] ATTENTION MATRIX

#### What makes transformers so good?

1. Attention. But the key is not here.

2. Positional encoding

    Positional information:

    - Adds indices to data and that's not good, because indices add importance
    
    - If standardized, still the order is different, because of collisions. The second of 3 words is the same as the forth of 6 words.

    - Binary encoding allows to position data, avoiding the previous problems. But... it shouldn't be discrete.

    - Final approach: Indicate it with waves of different frequencies. This makes this architecture parallelizable.

### Visual transformers

## Resources 

4-5 papers

- Attention is all you need
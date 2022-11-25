# Capture the flag
## Types of CTF

- Jeopardy
- Attack/defense

## Encryption

### Encoding

#### ASCII

Is a way to represent characters with numbers.

`4d 61 64 722 69 64` -> Madrid

#### Base64

Another way to encode bits. It uses [A-Za-z0-9+/=].

The `=` character is used for padding.

##### URL encoding

Slight variaton of Base64 so it doesn't accept special characters.

#### ROT13

It consists of moving each letter 13 times to the right. As the alphabet is 26 letters long, the encoding is symmetric.

`A <-> N`

#### Cesar Encryption

Like ROT13 but it rotates x number of times.

#### Vignere rotation

It's a 2D encryption. It uses a matrix and a key to encode each character with a different number of rotations.

##### Break it

This code can be broken by looking at the frequencies of letters and words.

#### XOR

It's a kind of Symmetric encryption. 

It consists of applying a XOR to every character of the original string against the corresponding one of key.




## Exercises

### [Absolute Beginners](https://overthewire.org/wargames/bandit/)

#### Connect through SSH to the bandit number X

```shell 
ssh banditX@bandit.labs.overthewire.org -p 2220
```
#### Flags

- *Bandit0* - NH2SXQwcBdpmTEzi3bvBHMM9H66vVXjL
- *Bandit1* - rRGizSaX8Mk1RTb1CNQoXTcYZWU6lgzi
- *Bandit2* - aBZ0W5EmUfAf7kHTQeOwd8bauFJ2lAiG
- *Bandit3* - 2EW7BBsr6aMMoJ2HjW067dm8EgX26xNe
- *Bandit4* - lrIWWI6bB37kxfiCQZqUdOIYfr6eEeqR
- *Bandit5* - P4L4vucdmLnm8I7Vl7jG1ApGSfjYKqJU

    Found using `find -name "*" -size 1033c`

## Commands

- file - Provides information of the file.
- Strings - Prints out the file.


## Resources 

### Decode and encode stuff

- [CyberChef](cyberchef.org)

- `base64` is linux tool to encode and decode.

- [DCODE](https://www.dcode.fr/)

### Practice

#### CTFs

- PicoCTF

- CTFtime

- Over the wire

#### Cryptography

- Over the wire -> Krypton

- Cryptohack





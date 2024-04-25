# !/usr/bin/env python

# This is a sample Python script.

import sys
from operator import itemgetter


def mapper():
    wordList = dict()
    file_object = open('test-algo.txt')
    for line in file_object:
        line = line.strip()
        words = line.split()
        for word in words:
            charList = list()
            for char in word:
                charList.append(char)
                charList.sort()
            wordList[word] = "".join(charList)
            return wordList


def reducer():
    current_key = None
    current_word = list()
    key = None
    file_object = open('test-algo.txt')
    for line in file_object:
        line = line.strip()
        key, word = line.split('#', 1)
        print('***', key, word)

        if current_key == key:
            current_word.append(word)
        else:
            if current_key:
                print('%s\t%s' % (current_key, current_word))
                del current_word[:]
            current_key = key
            current_word.append(word)
    if current_key == key:
        print('%s\t%s' % (current_key, current_word))


if __name__ == '__main__':
    mapper()
    reducer()

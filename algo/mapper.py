#!/usr/bin/env python

<<<<<<< HEAD
import sys
wordList = dict()
file_object = open('test-algo.txt')
for line in file_object:
    line = line.strip()
    words = line.split(',')


    print(words[1],words[4],1)
=======
wordList = dict()
file_object = open('test-algo.txt')
with open("Result/MapperData.txt", "w") as f:
    for line in file_object:
        line = line.strip()
        words = line.split(',')
        data = "{}\t{}\t{}\n".format(words[1], words[4], 1)
        f.write(data)
f.close()
>>>>>>> origin/algo

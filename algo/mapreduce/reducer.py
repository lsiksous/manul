#!/usr/bin/env python

import math

ecartype = 0
current_age = None
moyenne_salaire = 0
current_counter = 0
sumSalaire = 0
salaireList = list()
age = None


def calculMoyenne(sum, n):
    return sum / n


def ecartType(ValueList, moyList, n, som=0):
    for i in ValueList:  # parcourir la list
        som += (i - moyList) ** 2
    ecartype = som / n
    return math.sqrt(ecartype)


<<<<<<< HEAD
file_object = open('test-algo.txt')
for line in file_object:
    line = line.strip()

    age, salaire, counter = line.split('\t', 3)

    try:
        salaire = int(salaire)
    except ValueError:
        continue
    try:
        counter = int(counter)
    except ValueError:
        continue
    if current_age == age:
        sumSalaire += salaire
        current_counter += counter
        salaireList.append(salaire)
    else:
        if current_age:
            moyenne_salaire = calculMoyenne(sumSalaire, current_counter)
            ecartype = ecartType(salaireList, moyenne_salaire, current_counter)

            del salaireList[:]
            print(current_age, moyenne_salaire, ecartype, current_counter)
        current_age = age
        current_counter = counter
        sumSalaire = salaire
        salaireList.append(salaire)
        ecartype = 0

if current_age == age:
    moyenne_salaire = calculMoyenne(sumSalaire, current_counter)
    ecartype = ecartType(salaireList, moyenne_salaire, current_counter)
    del salaireList[:]
    print(current_age, moyenne_salaire, ecartype, current_counter)
=======
file_object = open('Result/MapperData.txt')
with open("Result/ReducerData.txt", "w") as f:
    for line in file_object:
        line = line.strip()

        age, salaire, counter = line.split('\t', 3)

        try:
            salaire = int(salaire)
        except ValueError:
            continue
        try:
            counter = int(counter)
        except ValueError:
            continue
        if current_age == age:
            sumSalaire += salaire
            current_counter += counter
            salaireList.append(salaire)
        else:
            if current_age:
                moyenne_salaire = calculMoyenne(sumSalaire, current_counter)
                ecartype = ecartType(salaireList, moyenne_salaire, current_counter)

                del salaireList[:]

                data = "{}\t{}\t{}\t{}\n".format(current_age, moyenne_salaire, ecartype, current_counter)
                f.write(data)
            current_age = age
            current_counter = counter
            sumSalaire = salaire
            salaireList.append(salaire)
            ecartype = 0

    if current_age == age:
        moyenne_salaire = calculMoyenne(sumSalaire, current_counter)
        ecartype = ecartType(salaireList, moyenne_salaire, current_counter)
        del salaireList[:]
        data = "{}\t{}\t{}\t{}\n".format(current_age, moyenne_salaire, ecartype, current_counter)
        f.write(data)
f.close()
>>>>>>> origin/algo

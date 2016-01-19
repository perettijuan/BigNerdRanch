//
//  main.m
//  BMICalc
//
//  Created by Juan Pablo Peretti on 19/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#include <stdio.h>


// A typedef defines an alias for a type delcaration (in this case a struct)
typedef struct {
    float heightInMeters;
    int weightInKilos;
} Person;


float bodyMassIndex(Person p) {
    return p.weightInKilos / (p.heightInMeters * p.heightInMeters);
}

int main(int argc, const char * argv[]) {
    Person person;
    person.weightInKilos = 93;
    person.heightInMeters = 1.79;
    printf("person weighs %i kilograms\n", person.weightInKilos);
    printf("person is %.2f meters tall\n", person.heightInMeters);
    
    float bmi = bodyMassIndex(person);
    printf("person has a BMI of %.2f\n", bmi);
    
    return 0;
}

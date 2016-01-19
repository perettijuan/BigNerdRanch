//
//  main.m
//  ClassCertificates
//
//  Created by Juan Pablo Peretti on 18/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#include <stdio.h>

void congratulateStudent(char *student, char *course, int numDays) {
    printf("%s has done as much %s Programming as I could finto into %d days.\n", student, course, numDays);
}

int main(int argc, const char * argv[]) {
    congratulateStudent("Mark", "Cocoa", 5);
    congratulateStudent("Bo", "Android", 3);
    congratulateStudent("Juan", "iOS", 2);
    return 0;
}

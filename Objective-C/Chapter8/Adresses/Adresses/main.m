//
//  main.m
//  Adresses
//
//  Created by Juan Pablo Peretti on 19/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    int i = 17;
    int *addressOfI = &i;
    printf("i stores its value at %p.\n", addressOfI);
    printf("This function starts at %p\n", main);
    printf("The int stored in addressOfI is %d\n", *addressOfI);
    return 0;
}

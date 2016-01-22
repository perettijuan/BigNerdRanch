//
//  main.m
//  BeerSong
//
//  Created by Juan Pablo Peretti on 18/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#include <stdio.h>

void singTheSong(int numberOfBottles) {
    if(numberOfBottles == 0) {
        printf("There are simply no more botles of beer on the wall. \n");
    } else {
        printf("%d bottles of beer on the wall. %d bottles of beer. \n", numberOfBottles,numberOfBottles);
        int oneFewer = numberOfBottles - 1;
        printf("Take one down, pass it around, %d bottles of beer on the wall.\n", oneFewer);
        singTheSong(oneFewer);
        printf("Put the bottle in the recycling, %d empty bottles in the bin.\n", numberOfBottles);
    }
}


int main(int argc, const char * argv[]) {
    singTheSong(99);
    return 0;
}

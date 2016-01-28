//
//  main.m
//  VowelMovement
//
//  Created by Juan Pablo Peretti on 25/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import <Foundation/Foundation.h>


//TO make the code clearer, we declare the block as a typedef
// void -> The return type of the block
// ^ -> Indicator that what follows is a block (Lambda expression)
// devowelizer -> Is the name of the block (as variable)
// (id, NSUInteger, BOOL *) parameters received by the block: an object, an integer and a pointer to a boolean object
typedef void (^ArrayEnumerationBlock)(id, NSUInteger, BOOL *);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Create the array of strings to devowelize and a container for new ones
        NSArray *oldStrings = [NSArray arrayWithObjects:
                               @"Sauerkraut", @"Raygun", @"Big Nerd Ranch", @"Mississippi", nil];
        
        NSLog(@"old strings: %@", oldStrings);
        NSMutableArray *newStrings = [NSMutableArray array];
        
        // Create a list of characters that we'll remove from the string
        NSArray *vowels = [NSArray arrayWithObjects:@"a", @"e", @"i", @"o", @"u", nil];
        
        // declare the block variable
        // void -> The return type of the block
        // ^ -> Indicator that what follows is a block (Lambda expression)
        // devowelizer -> Is the name of the block (as variable)
        // (id, NSUInteger, BOOL *) parameters received by the block: an object, an integer and a pointer to a boolean object
        // void(^devowelizer)(id, NSUInteger, BOOL *);
        ArrayEnumerationBlock devowelizer;
        
        
        // now, assign a block to the variable
        devowelizer = ^(id string, NSUInteger i, BOOL *stop) {
            NSMutableString *newString = [NSMutableString stringWithString:string];
            
            // Iterate over the array of vowels, replacing occurrences of each
            // with an empty string.
            for (NSString *s in vowels) {
                NSRange fullRange = NSMakeRange(0, [newString length]);
                
                [newString replaceOccurrencesOfString:s
                                           withString:@""
                                              options:NSCaseInsensitiveSearch
                                                range:fullRange];
            }
            [newStrings addObject:newString];
        }; // End of block assignment
        
        
        //Iterate over the array with our function
        [oldStrings enumerateObjectsUsingBlock:devowelizer];
        NSLog(@"New Strings %@", newStrings);
    }
    return 0;
}

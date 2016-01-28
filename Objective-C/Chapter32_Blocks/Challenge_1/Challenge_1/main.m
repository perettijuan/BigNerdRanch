//
//  main.m
//  Challenge_1
//
//  Created by Juan Pablo Peretti on 25/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import <Foundation/Foundation.h>


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Create the array of strings to devowelize and a container for new ones
        NSArray *oldStrings = [NSArray arrayWithObjects:
                               @"Sauerkraut", @"Raygun", @"Big Nerd Ranch", @"Mississippi", nil];
        
        NSLog(@"old strings: %@", oldStrings);
        NSMutableArray *newStrings = [NSMutableArray array];
        
        // Create a list of characters that we'll remove from the string
        NSArray *vowels = [NSArray arrayWithObjects:@"a", @"e", @"i", @"o", @"u", nil];
        
        
        
        //Iterate over the array with an anonymous block
        [oldStrings enumerateObjectsUsingBlock:^(id string, NSUInteger i, BOOL *stop) {
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
        } // End of block assignment
         ];
        NSLog(@"New Strings %@", newStrings);
    }
    return 0;
}

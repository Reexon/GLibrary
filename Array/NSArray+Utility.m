//
//  NSArray+Utility.m
//  Library
//
//  Created by Marco Vellutoon 26/05/14.
//  Copyright (c) 2014 Marco Velluto. All rights reserved.
//

#import "NSArray+Utility.h"

@implementation NSArray (Utility)

/**
 @author Marco Velluto .
 
 @brief Shuffle array elements.
 @attention The array must be initialized.
 */
- (void)shuffle {
    NSUInteger count  = [self count];
    for (NSUInteger i = 0; i < count; i++) {
        
        //-- Select a random element between i and end of array to swap with.
        NSUInteger nElements = count - i;
        NSUInteger n = arc4random_uniform(nElements) + i;
        NSLog(@"%lu", (unsigned long)n);
    }

}
@end

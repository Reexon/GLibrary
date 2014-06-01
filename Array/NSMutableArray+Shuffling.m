//
//  NSMutableArray+Shuffling.m
//  Library
//
//  Created by Marco Velluto on 23/05/14.
//  Copyright (c) 2014 Marco Velluto. All rights reserved.
//

#import "NSMutableArray+Shuffling.h"

@implementation NSMutableArray (Shuffling)

/**
 @author Marco.
 
 @brief Shuffle array elements.
 @attention The array must be initialized.
 */
- (void)shuffle {
    NSUInteger count  = [self count];
    for (NSUInteger i = 0; i < count; i++) {
        
        //-- Select a random element between i and end of array to swap with.
        NSUInteger nElements = count - i;
        NSUInteger n = arc4random_uniform(nElements) + i;
        [self exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

/**
 @author Marco.
 
 @brief Insert objects NSNumber of type Int in the Array until it reaches the size determined.
 
 @param capacity size of array.
 @attention The array must be initialized.
 */
- (void)randomIntegerElemntsWithCapacity:(int)capacity {
    
    NSNumber *randomIndex;
    for (NSInteger i; i < capacity; i++) {
        randomIndex =[NSNumber numberWithInt:(arc4random() % [self count])];
        [self addObject:randomIndex];
    }
}

@end

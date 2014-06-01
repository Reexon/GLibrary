//
//  Array.m
//  Array
//
//  Created by Marco Velluto on 01/06/14.
//
//

#import "Array.h"

@implementation Array

/**
 @attention In progess - This doesn't work.
 */
+ (NSArray *)randomIntArrayWithCapacity:(int)capacity {
    
    NSMutableArray *mArray = [[NSMutableArray alloc] initWithCapacity:capacity];
    NSNumber *randomIndex;
    for (NSInteger i; i < capacity; i++) {
        randomIndex =[NSNumber numberWithInt:arc4random() % ([mArray count]+1)];
        [mArray addObject:randomIndex];
    }
    return mArray;
}

@end

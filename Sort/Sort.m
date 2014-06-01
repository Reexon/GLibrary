//
//  Sort.m
//  Sort
//
//  Created by Marco Velluto on 01/06/14.
//
//

#import "Sort.h"

@implementation Sort


/**
 @author Marco Velluto.
 
 @brief This function sorts two NSinteger elements.
 */
NSInteger intSort(id num1, id num2, void *context)
{
    int v1 = [num1 intValue];
    int v2 = [num2 intValue];
    
    if (v1 < v2)
        return NSOrderedAscending;
    else if (v1 > v2)
        return NSOrderedDescending;
    else
        return NSOrderedSame;
}

@end

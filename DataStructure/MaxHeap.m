//
//  MaxHeap.m
//  Library
//
//  Created by Marco Velluto on 20/05/14.
//  Copyright (c) 2014 Marco Velluto. All rights reserved.
//

#import "MaxHeap.h"

@interface MaxHeap ()

@property(nonatomic) int heapSize;
@property(nonatomic, strong) NSMutableArray *heapArray;

@end


@implementation MaxHeap

#pragma mark -
#pragma mark - Init Methods


- (id) init {
    self.heapSize = -1;
    self.heapArray = [[NSMutableArray alloc] init];
    return self;
}

- (id) initWithMutableArray:(NSMutableArray *)array {
    self.heapSize = array.count - 1;
    self.heapArray = array;
    [self buildHeap];
    
    return self;
}

- (id) initWithArray:(NSArray *)array {
    [self.heapArray addObjectsFromArray:array];
    self.heapSize = self.heapArray.count - 1;
    [self buildHeap];
    
    return self;
}

- (void) buildHeap {
    if (self.heapSize > 0) {
        for (int i = (int)(self.heapSize/2); i>= 0; i--) {
            [self MaxHeapifyWithIndex:i];
        }
    }
}

- (void) MaxHeapifyWithIndex:(int)index {
    if (self.heapSize) {
        int l = 2 * index; //Left Son
        int r = 2 * index + 1; //Right Son
        
        int max = 1;
        
        if (l <= self.heapSize) {
            if (([self.heapArray[l] compare:(self.heapArray[max])]) > 0) {
                max = l;
            }
        }
        
        if (r <= self.heapSize) {
            if (([self.heapArray[r] compare:(self.heapArray[max])]) > 0) {
                max = r;
            }
        }
        
        if (max != index) {
            
        }
    }
}


@end

@interface T : NSException


@end

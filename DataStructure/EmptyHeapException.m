//
//  EmptyHeapException.m
//  Library
//
//  Created by Marco Velluto on 20/05/14.
//  Copyright (c) 2014 Marco Velluto. All rights reserved.
//

#import "EmptyHeapException.h"

@implementation EmptyHeapException


- (NSException *)EmptyHeapException {
    
    return [NSException exceptionWithName:@"EmptyHeapException" reason:@"EmptyHeapException" userInfo:nil];
}
@end

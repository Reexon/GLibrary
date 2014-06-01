//
//  TestNSMutableArray+Shuffling.m
//  Library
//
//  Created by Marco Velluto on 23/05/14.
//  Copyright (c) 2014 Marco Velluto. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSMutableArray+Shuffling.h"

@interface TestNSMutableArray_Shuffling : XCTestCase

@end

@implementation TestNSMutableArray_Shuffling

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    
}

- (void)testRandomIntegerElemntsWithCapacity {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [array randomIntegerElemntsWithCapacity:36];
    NSLog(@"");
}

- (void)testShuffle {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [array addObject:@"36"];
    [array addObject:@"32"];
    @try {
        [array shuffle];
    }
    @catch (NSException *exception) {
        NSLog(@"Exception: %@", exception.description);
    }
    @finally {
        NSLog(@"Finaly");
    }
}
@end

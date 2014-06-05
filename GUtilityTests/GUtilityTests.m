//
//  GUtilityTests.m
//  GUtilityTests
//
//  Created by Loris D'antonio on 05/06/14.
//
//

#import <XCTest/XCTest.h>
#import "NSDate+Helper.h"

@interface GUtilityTests : XCTestCase

@end

@implementation GUtilityTests

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

- (void)testDate
{

    NSDate *date = [NSDate date];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    
    //necessario per visualizzate Data e ora corrette
    [df setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    [df setDateFormat:@"dd-MM-yyyy"];
    
    NSDate *startDate = [df dateFromString:@"3-06-2014"];
    NSDate *endDate = [df dateFromString:@"7-06-2014"];
    BOOL isBetween = [date isBetweenDate:startDate andDate:endDate];
    
    if(isBetween)
        NSLog(@"%@ è compreso tra %@ e %@",[df stringFromDate:date],[df stringFromDate:startDate],[df stringFromDate:endDate]);
    else
        NSLog(@"%@ non è compreso tra %@ e %@",[df stringFromDate:date],[df stringFromDate:startDate],[df stringFromDate:endDate]);

    int dayDifference = [date daysDifferenceToDate:startDate];
    NSLog(@"Differenza di giorni : %d",dayDifference);
    NSLog(@"Ora: %d, Min:%d, Yr:%d",[date hour],[date minute],[date year]);
    
}

-(void) testAddDate{
    NSDate *date = [NSDate date];
    
    NSLog(@"====%@ ==== ",date);
    
    NSLog(@"=== +5gg === %@",[date addDay:5]);
    
    NSLog(@"===+2mm === %@",[date addMonth:2]);
    
    NSLog(@"=== +1yy === %@",[date addYear:1]);
}

-(void) testMostActualDate{
    NSDate *date = [NSDate date];
    NSLog(@"%d",[date isMoreActualThen:[date addMonth:-2]]);
    NSLog(@"%d",[date isMoreActualThen:[date addMonth:2]]);

    
}

@end

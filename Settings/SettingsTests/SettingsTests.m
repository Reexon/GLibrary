//
//  SettingsTests.m
//  SettingsTests
//
//  Created by Loris D'antonio on 30/05/14.
//
//

#import <XCTest/XCTest.h>
#import "Settings.h"

@interface SettingsTests : XCTestCase

@end

@implementation SettingsTests

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

- (void)testLoadDefaultOption
{
    NSDictionary *dict = [[NSDictionary alloc]initWithObjects:@[@"Loris",@"D'antonio",@YES]
                                                      forKeys:@[@"Nome",@"Cognome",@"etero"]
                          ];
    
    [Settings loadDefaultSettings:dict];
    
    NSLog(@"Caricamento Settaggi Default");
}

- (void)testGetOptions{
    
    [self testLoadDefaultOption];
    
    NSString *name = [Settings getSettingString:@"Nome"];
    NSString *cognome = [Settings getSettingString:@"Cognome"];
    BOOL etero = [Settings getSettingBool:@"etero"];
    
    XCTAssert([name isEqualToString:@"Loris"], @"Problema Rilevazione Nome");
    XCTAssert([cognome isEqualToString:@"D'antonio"], @"Problema Rilevazione Cognome");
    XCTAssert(etero == YES, @"Problema Rilevazione Bool");
}
@end

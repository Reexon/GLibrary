//
//  ConnectivityTests.m
//  ConnectivityTests
//
//  Created by Loris D'antonio on 31/05/14.
//
//

#import <XCTest/XCTest.h>
#import "Connectivity.h"

@interface ConnectivityTests : XCTestCase

@end

@implementation ConnectivityTests

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

- (void)testConnectivity
{
    Connectivity * conn = [Connectivity new];
    [conn initReachabilityForInternetConnection];
    [conn initReachabilityForHostName:@"google.com"];
    
    struct sockaddr_in address;
    address.sin_len = sizeof(address);
    address.sin_family = AF_INET;
    address.sin_port = htons(8001);
    address.sin_addr.s_addr = inet_addr("172.21.38.120");
    [conn initReachabilityForIP:&address];
    
}

- (void)testGetIpAddress{
    [Connectivity ipByHost:"google.com"];
    [Connectivity ipByHost:"apple.com"];
}
@end

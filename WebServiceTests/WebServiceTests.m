//
//  WebServiceTests.m
//  WebServiceTests
//
//  Created by Loris D'antonio on 01/06/14.
//
//

#import <XCTest/XCTest.h>
#import "WebService.h"
@interface WebServiceTests : XCTestCase

@end

@implementation WebServiceTests

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

- (void)testWebService
{
    NSString *xml = @"<SOAP-ENV:Envelope xmlns:SOAP-ENV=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:xsd=\"http://www.w3.org/1999/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/wsdl/soap/\" xmlns:xsi=\"http://www.w3.org/1999/XMLSchema-instance\" SOAP-ENV:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\"><SOAP-ENV:Body><mns:ProcessSRL xmlns:mns=\"http://www.SoapClient.com/xml/SQLDataSoap.xsd\"><SRLFile xsi:type=\"xsd:string\">/xml/web.sri</SRLFile><RequestName xsi:type=\"xsd:string\">Altavista</RequestName><key xsi:type=\"xsd:string\">SOAP</key></mns:ProcessSRL></SOAP-ENV:Body></SOAP-ENV:Envelope>";
    
    WebService *ws = [[WebService alloc]initWithURL:[NSURL URLWithString:@"http://soapclient.com/xml/SQLDataSoap.WSDL"] andXML:xml];
    NSLog(@"%@",[ws startRequest]);
}

@end

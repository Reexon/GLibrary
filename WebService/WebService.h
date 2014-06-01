//
//  WebService.h
//  WebService
//
//  Created by Loris D'antonio on 01/06/14.
//
//

#import <Foundation/Foundation.h>

@interface WebService : NSObject

@property NSURL *urlEndpoint;
@property NSString *xmlFile;
@property BOOL showLoadingAlert;

- (id)initWithURL:(NSURL *)url andXML:(NSString *)xmlFile;


- (void) start;

@end

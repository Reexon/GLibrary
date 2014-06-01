//
//  WebService.m
//  WebService
//
//  Created by Loris D'antonio on 01/06/14.
//
//

#import "WebService.h"
#import <UIKit/UIKit.h>

@implementation WebService{
    UIAlertView *alert;
    NSData *responseData;
    NSString *responseString;
    NSError *errors;
}

- (id)initWithURL:(NSURL *)url andXML:(NSString *)xmlFile
{
    self = [super init];
    
    if (self) {
        
        _urlEndpoint =  url;
        _xmlFile = [[NSString alloc]initWithString: xmlFile];
        _showLoadingAlert = YES;
        alert = [[UIAlertView alloc]initWithTitle:@"Loading" message:@"Loading..." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    }
    
    return self;
}

- (void)start{
    
    if(_showLoadingAlert){
        [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:YES];
        [NSThread detachNewThreadSelector:@selector(startRequest) toTarget:self withObject:nil];
        [alert dismissWithClickedButtonIndex:0 animated:YES];
    }else
        [self startRequest];
    
    
}

- (void)startRequest{
    //dimensione messaggio (xml)
    NSString *msgLength = [NSString stringWithFormat:@"%d",[_xmlFile length]];
    
    //l'url a cui inviare la richiesta
    NSMutableURLRequest *reqURL = [NSMutableURLRequest requestWithURL:_urlEndpoint];
    
    //informazioni sul tipo di dati da inviare
    [reqURL addValue:@"text/xml" forHTTPHeaderField:@"Content-Type"];
    [reqURL addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [reqURL setHTTPMethod:@"POST"];
    
    //trasformo il file xml da stringa a NSData
    [reqURL setHTTPBody: [_xmlFile dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSHTTPURLResponse *response = nil;
    NSError *error = nil;
    responseData = [[NSData alloc] initWithData:[NSURLConnection sendSynchronousRequest:reqURL returningResponse:&response error:&error]];
    
    //response data non è mai nil, nel caso peggiore, è vuoto
    if(responseData.length == 0){
        
        if(error){//se error è valorizzato lo stampo
            //metto error nella variabile di istanza
            errors = error;
            NSLog(@"Code: %ld\nDomain:%@\nuserInfo:%@",(long)error.code,error.domain,error.userInfo);
        }
    }
    
    //converto la risposta da NSData a NSString
    responseString = [[NSString alloc] initWithData:responseData encoding:NSASCIIStringEncoding];
    
    //visualizzo log con la risposta server in formato stringa
    NSLog(@"%s - Response: %@", __PRETTY_FUNCTION__, responseString);
    
}
@end

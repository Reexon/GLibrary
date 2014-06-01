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
}

- (id)initWithURL:(NSURL *)url andXML:(NSString *)xmlFile
{
    self = [super init];
    
    if (self) {
        
        _urlEndpoint =  url;
        _xmlFile = [[NSString alloc]initWithString: xmlFile];
        _showLoadingAlert = NO;
        alert = [[UIAlertView alloc]initWithTitle:@"Loading" message:@"Loading..." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    }
    
    return self;
}

- (NSString *)startRequest{
    
    if(_showLoadingAlert){//non funge, l'alert non viene visualizzato
        [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:YES];
        //[NSThread detachNewThreadSelector:@selector(startRequest) toTarget:self withObject:[nil];
    }
    //dimensione messaggio (xml)
    NSString *msgLength = [NSString stringWithFormat:@"%d",[_xmlFile length]];
    
    //l'url a cui inviare la richiesta
    NSMutableURLRequest *reqURL = [NSMutableURLRequest requestWithURL:_urlEndpoint];
    
    //informazioni sul tipo di dati da inviare
    [reqURL addValue:@"text/xml" forHTTPHeaderField:@"Content-Type"];
    [reqURL addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [reqURL setHTTPMethod:@"POST"];
    
    //trasformo il file xml da stringa a DATA
    [reqURL setHTTPBody: [_xmlFile dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSHTTPURLResponse *response = nil;
    NSError *error = nil;
    NSData *responseDataXML = [[NSData alloc] initWithData:[NSURLConnection sendSynchronousRequest:reqURL returningResponse:&response error:&error]];
    
    //response data non è mai nil, nel caso peggiore, è vuoto
    if(responseDataXML.length == 0){//problema connessione o download dati
        //controllo problemi
        
        if(error){//se error è valorizzato lo stampo
            NSLog(@"Code: %ld\nDomain:%@\nuserInfo:%@",(long)error.code,error.domain,error.userInfo);
        }
        //ritorno stringa vuota;
        return @"";
    }
    
    NSString *responseString = [[NSString alloc] initWithData:responseDataXML encoding:NSASCIIStringEncoding];
    
    //visualizzo log con la risposta server in formato stringa
    NSLog(@"%s - Response: %@", __PRETTY_FUNCTION__, responseString);
    
    //non funge
    [alert dismissWithClickedButtonIndex:0 animated:YES];
    
    return responseString;
}

@end

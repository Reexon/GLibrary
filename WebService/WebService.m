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
        _xmlFileToSend = [[NSString alloc]initWithString: xmlFile];
        _showLoadingAlert = YES;
        [self setupWaitingAlert:@"Waiting Server" withMessage:@"" andCancelButton:nil];
        
    }
    
    return self;
}
- (void)setupWaitingAlert:(NSString *)title withMessage:(NSString *)message andCancelButton:(NSString *)cancelButtonTitle{
    
    alert = [[UIAlertView alloc]initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil, nil];
    
}

- (void) start{
    
    NSLog(@"%s",__PRETTY_FUNCTION__);
    
    if(_showLoadingAlert){
        
        [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:YES];
        
        [NSThread detachNewThreadSelector:@selector(startRequest) toTarget:self withObject:nil];
        
    }else
        [self startRequest];
    
}

- (void)startRequest{
    
    NSLog(@"%s",__PRETTY_FUNCTION__);
    
    //dimensione messaggio (xml)
    NSString *msgLength = [NSString stringWithFormat:@"%d",[_xmlFileToSend length]];
    
    //l'url a cui inviare la richiesta
    NSMutableURLRequest *reqURL = [NSMutableURLRequest requestWithURL:_urlEndpoint];
    
    //informazioni sul tipo di dati da inviare
    [reqURL addValue:@"text/xml" forHTTPHeaderField:@"Content-Type"];
    [reqURL addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [reqURL setHTTPMethod:@"POST"];
    [reqURL setTimeoutInterval:10.0];
    
    //trasformo il file xml da stringa a NSData
    [reqURL setHTTPBody: [_xmlFileToSend dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSHTTPURLResponse *response = nil;
    NSError *error = nil;
    
    NSData *responseData = [[NSData alloc] initWithData:[NSURLConnection sendSynchronousRequest:reqURL returningResponse:&response error:&error]];
    
    //chiudo l'alert aperta prima di eseguire questo metodo
    [alert dismissWithClickedButtonIndex:0 animated:YES];
    
    //response data non è mai nil, nel caso peggiore, è vuoto
    if(responseData.length == 0){
        
        if(error){//se error è valorizzato lo stampo
            
            if(_showErrorAlert)//se l'utente vuole visualizzare alert di errore
                [[[UIAlertView alloc] initWithTitle:@"Errore WebService"
                                            message:@"Si è verificato un errore"
                                           delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil] show];
            
            NSLog(@"Code: %ld\nDomain:%@\nuserInfo:%@",(long)error.code,error.domain,error.userInfo);
            
            //richiamo il delegate
            if([self delegate] != nil)
                [[self delegate] webServiceRequestError:error];
            else
                NSLog(@"ATTENZIONE: Nessun delegate impostato! <WebServiceDelegate>");
        }
    }
    
    //richiamo il delegate
    if([self delegate] != nil)
        [[self delegate] webServiceRequestSuccesfull:responseData];
    else
        NSLog(@"ATTENZIONE: Nessun delegate impostato! <WebServiceDelegate>");
    
}
@end

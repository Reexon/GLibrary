//
//  WebService.h
//  WebService
//
//  Created by Loris D'antonio on 01/06/14.
//
//

#import <Foundation/Foundation.h>
@protocol WebServiceDelegate <NSObject>

@required
//questo metodo è da implementare nella classe che si vuole gestisca l'evento della ricezione della risposta WS
- (void)webServiceRequestSuccesfull:(NSData *)data;

@optional
//da implementare nella classe per gestire la ricezione di errore da aprte del WS
- (void)webServiceRequestError:(NSError *)error;

@end

@interface WebService : NSObject

//URL al quale verrà inviato il file XML (endpoint del WS)
@property NSURL *urlEndpoint;

//il file xml da inviare al webservice
@property NSString *xmlFileToSend;

//se true , verrà visualizzato alert durante l'invio e ricezione della risposta
@property BOOL showLoadingAlert;

//se true, in caso di errore, verrà visualizzato alert
@property BOOL showErrorAlert;

//tempo di timeout da aspettare (MAX) valore in secondi
@property NSTimeInterval timeoutInterval;

//delegate (obbligatorio per ricevere notifiche di successo/fallimento
@property (nonatomic, assign) id delegate;

- (id)initWithURL:(NSURL *)url andXML:(NSString *)xmlFile;

//avvio vero e proprio della richiesta al WS
- (void) start;

@end

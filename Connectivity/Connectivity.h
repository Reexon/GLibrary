//
//  Connectivity.h
//  Connectivity
//
//  Created by Loris D'antonio on 31/05/14.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Reachability.h"
#include <netdb.h>
#include <arpa/inet.h>
/*!
 @author Loris D'antonio
 
 @discussion se si vuole gestire il cambio della connessione da un'altra classe, 
 basterà creare una NSNotification con il nome kReachabilityChangedNotification.
 
 @code
 [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
 
 [reachability startNotifier];
 @endcode
 
 */
@interface Connectivity : NSObject

/*!
 per prelevare lo stato attuale della connessione
 
 @code
 typedef enum : NSInteger {
 NotReachable = 0,
 ReachableViaWiFi,
 ReachableViaWWAN
 } NetworkStatus;
 @endcode
 
 */
@property (readonly) NetworkStatus netStatus;

/*!
 visualizza un alert al cambiamento dello stato della connessione
 */
@property BOOL showAlertOnChange;

- (void)initReachabilityForInternetConnection;
- (void)initReachabilityForHostName:(NSString *)hostname;
- (void)initReachabilityForIP:(const struct sockaddr_in *)ip;
+ (NSString *)ipByHost:(char *)host;

@end

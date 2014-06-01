//
//  Connectivity.m
//  Connectivity
//
//  Created by Loris D'antonio on 31/05/14.
//
//

#import "Connectivity.h"

@implementation Connectivity{
    Reachability *reachability;
}

- (id)init
{
    self = [super init];
    if (self) {
        _showAlertOnChange = YES;
    }
    return self;
}
- (void)initReachabilityForInternetConnection{

    reachability = [Reachability reachabilityForInternetConnection];
    _netStatus = [reachability currentReachabilityStatus];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    
    [reachability startNotifier];
    
}

- (void)initReachabilityForHostName:(NSString *)hostname{
    reachability = [Reachability reachabilityWithHostName:hostname];
    _netStatus = [reachability currentReachabilityStatus];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    
    [reachability startNotifier];

}

- (void)initReachabilityForIP:(const struct sockaddr_in *)ip{
    reachability = [Reachability reachabilityWithAddress:ip];
    _netStatus = [reachability currentReachabilityStatus];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    
    [reachability startNotifier];

}
- (NSString *)stringFromStatus:(NetworkStatus) status {
    
    NSString *string;
    switch(status) {
        case NotReachable:
            string = @"Not Reachable";
            break;
        case ReachableViaWiFi:
            string = @"Reachable via WiFi";
            break;
        case ReachableViaWWAN:
            string = @"Reachable via WWAN";
            break;
        default:
            string = @"Unknown";
            break;
    }
    return string;
}

/**
 @discussion monitoriamo il cambio della connessione
 */
- (void) reachabilityChanged: (NSNotification *)notification {
    Reachability *reach = [notification object];
    if( [reach isKindOfClass: [Reachability class]]) {
        
        //aggiorno la variabile dell'istanza
        _netStatus = [reach currentReachabilityStatus];
        
        //visualizzo alert (se utente vuole)
        if(_showAlertOnChange){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Connection"
                                                            message:[self stringFromStatus:_netStatus] delegate:nil
                                                  cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        
    }
}

/**
 @discussion trovo l'ip dell'host richiesto
 */
+ (NSString *) ipByHost:(char *)host{
    
   /* struct sockaddr_in address;
    address.sin_len = sizeof(address);
    address.sin_family = AF_INET;
    address.sin_port = htons(8001);
    address.sin_addr.s_addr = inet_addr("172.21.38.120");
    */
    
    // Get host entry info for given host
	struct hostent *remoteHostEnt = gethostbyname(host);
    
	// Get address info from host entry
	struct in_addr *remoteInAddr = (struct in_addr *) remoteHostEnt->h_addr_list[0];
    
	// Convert numeric addr to ASCII string
	char *sRemoteInAddr = inet_ntoa(*remoteInAddr);
    
	NSString *ip = [[NSString alloc]
                   initWithFormat:
                   @"Remote IP: %s\n",
                   sRemoteInAddr];
    return ip;
}
@end

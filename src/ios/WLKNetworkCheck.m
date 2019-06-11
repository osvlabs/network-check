#import "WLKNetworkCheck.h"

@implementation WLKNetworkCheck
-(void)initHostReachWithHostName:(CDVInvokedUrlCommand *)command
{
    NSArray *arguments = command.arguments;
    NSString *hostName = [arguments count] > 0 ? arguments[0] : @"";
    self.hostReach = [Reachability reachabilityWithHostName:hostName];
    [self.hostReach startNotifier];
    CDVPluginResult * result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: @"Init host reach success"];
    [self.commandDelegate sendPluginResult: result callbackId:command.callbackId];
}

- (void)getCurrentNetAvailableWithHostName:(CDVInvokedUrlCommand *)command
{
    [self.commandDelegate runInBackground:^{
      
        NetworkStatus networkStatus = [self.hostReach currentReachabilityStatus];
        BOOL netAvailable = true;
        
        switch (networkStatus) {
            case NotReachable:
            {
                netAvailable = false;
                break;
            }
            default: {
                netAvailable = true;
                break;
            }
        }
        CDVPluginResult * result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: [NSString stringWithFormat:@"%d", netAvailable]];
        [self.commandDelegate sendPluginResult: result callbackId:command.callbackId];
    }];
}

@end

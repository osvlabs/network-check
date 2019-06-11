#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>
#import "WLKReachability.h"

@interface WLKNetworkCheck : CDVPlugin
{
  NSString *_callbackId;
}

@property(copy) NSString *connectionType;
@property(strong) Reachability *internetReach;
@property(nonatomic, strong) Reachability *hostReach;

- (void)getCurrentNetAvailableWithHostName:(CDVInvokedUrlCommand *)command;

- (void)initHostReachWithHostName:(CDVInvokedUrlCommand *)command;

@end

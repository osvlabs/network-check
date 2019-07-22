#import "WLKNetworkCheck.h"

@implementation WLKNetworkCheck
- (void)initHostReachWithHostName:(CDVInvokedUrlCommand *)command {
  NSArray *arguments = command.arguments;
  NSString *hostName = [arguments count] > 0 ? arguments[0] : @"";
  self.hostReach = [Reachability reachabilityWithHostName:hostName];
  [self.hostReach startNotifier];
  CDVPluginResult *result =
      [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
                        messageAsString:@"Init host reach success"];
  [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (void)getCurrentNetAvailableWithHostName:(CDVInvokedUrlCommand *)command {
  [self.commandDelegate runInBackground:^{
    NSArray *arguments = command.arguments;
    NSString *hostName = [arguments count] > 0 ? arguments[0] : @"";
    NSURL *url = [NSURL URLWithString:hostName];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
  
//    NSURLSession *session = [NSURLSession sharedSession];
      NSURLSessionConfiguration * config = [NSURLSessionConfiguration defaultSessionConfiguration];
      config.timeoutIntervalForRequest = 5.0;
      config.allowsCellularAccess = YES;
      NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    NSURLSessionDataTask *dataTask = [session
        dataTaskWithRequest:request
          completionHandler:^(NSData *data, NSURLResponse *response,
                              NSError *error) {
            CDVPluginResult *result;
            if (nil == error) {
              NSDictionary *dict =
                  [NSJSONSerialization JSONObjectWithData:data
                                                  options:kNilOptions
                                                    error:nil];

              NSLog(@"%@", dict);
              result = [CDVPluginResult
                  resultWithStatus:CDVCommandStatus_OK
                   messageAsString:[NSString stringWithFormat:@"%d", YES]];
            } else {
              result = [CDVPluginResult
                  resultWithStatus:CDVCommandStatus_OK
                   messageAsString:[NSString stringWithFormat:@"%d", NO]];
            }
            [self.commandDelegate sendPluginResult:result
                                        callbackId:command.callbackId];
          }];
    [dataTask resume];
  }];
}

//- (void)getCurrentNetAvailableWithHostName:(CDVInvokedUrlCommand *)command
//{
//    [self.commandDelegate runInBackground:^{
//
//        NetworkStatus networkStatus = [self.hostReach
//        currentReachabilityStatus]; BOOL netAvailable = true;
//
//        switch (networkStatus) {
//            case NotReachable:
//            {
//                netAvailable = false;
//                break;
//            }
//            default: {
//                netAvailable = true;
//                break;
//            }
//        }
//        CDVPluginResult * result = [CDVPluginResult
//        resultWithStatus:CDVCommandStatus_OK messageAsString: [NSString
//        stringWithFormat:@"%d", netAvailable]]; [self.commandDelegate
//        sendPluginResult: result callbackId:command.callbackId];
//    }];
//}

@end

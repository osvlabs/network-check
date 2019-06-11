# Install
`ionic cordova plugin add @osvlabs/cordova-plugin-network-check`

# Use
```
declare var networkCheck: any;

export class XXXXX {


networkCheck.initHostReach(successCallBack, errorCallback, url);

// The url is only used in android
networkCheck.getCurrentNetAvailable(successCallBack, errorCallback, url)

}
```
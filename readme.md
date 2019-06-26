# Install

`ionic cordova plugin add @osvlabs/cordova-plugin-network-check@latest`

# Use

```
declare var networkCheck: any;

export class XXXXX {


//networkCheck.initHostReach(successCallBack, errorCallback, url);

networkCheck.getCurrentNetAvailable(successCallBack, errorCallback, url)

}
```

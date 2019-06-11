var exec = require('cordova/exec');

var NetworkCheck = function () {
};

NetworkCheck.prototype.getCurrentNetAvailable = function (successCallback, errorCallback, hostName) {
   return exec(successCallback, errorCallback, 'NetworkCheck', 'getCurrentNetAvailableWithHostName', [hostName]);
};

NetworkCheck.prototype.initHostReach = function (successCallback, errorCallback, hostName) {
   return exec(successCallback, errorCallback, 'NetworkCheck', 'initHostReachWithHostName', [hostName]);
};

module.exports = new NetworkCheck();

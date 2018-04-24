cordova.define("cordova-plugin-cccometchat.CCCometChat", function(require, exports, module) {

var exec = require('cordova/exec');
function CCCometChat() {

}


CCCometChat.prototype.getInstance =function(success, error){
    exec(success, error, "CCCometChat", "getInstance");
}
CCCometChat.prototype.initializeCometChat =function(siteUrl, licenseKey, apiKey, isCod,success, error){
       var arr = [];
           arr[0] = siteUrl;
           arr[1] = licenseKey;
           arr[2] = apiKey;
           arr[3] = isCod;
    exec(success, error, "CCCometChat", "initializeCometChat", arr);
}
CCCometChat.prototype.login =function(userName, password,success, error){
       var arr = [];
           arr[0] = userName;
           arr[1] = password;
    exec(success, error, "CCCometChat", "login", arr);
}
CCCometChat.prototype.logout =function(success, error){
    exec(success, error, "CCCometChat", "logout");
}
CCCometChat.prototype.loginWithId =function(userName, success, error){
       var arr = [];
           arr[0] = userName;
    exec(success, error, "CCCometChat", "loginWithId", arr);
}
CCCometChat.prototype.launchCometChat =function(isFullScreen,success, error){
       var arr = [];
           arr[0] = isFullScreen;
    exec(success, error, "CCCometChat", "launchCometChat", arr);
}
CCCometChat.prototype.launchCometChatWithID =function(isFullScreen,userid,isGroup,setBackButton, success, error){
       var arr = [];
           arr[0] = isFullScreen;
           arr[1] = userid;
           arr[2] = isGroup;
           arr[3] = setBackButton;
    exec(success, error, "CCCometChat", "launchCometChatWithID", arr);
}
CCCometChat.prototype.getAllPushChannels =function(userid,success, error){
       var arr = [];
           arr[0] = userid;
    exec(success, error, "CCCometChat", "getAllPushChannels", arr);
}




 var CCCometChat = new CCCometChat();
 module.exports = CCCometChat;
});

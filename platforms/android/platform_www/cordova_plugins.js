cordova.define('cordova/plugin_list', function(require, exports, module) {
module.exports = [
  {
    "id": "cordova-plugin-statusbar.statusbar",
    "file": "plugins/cordova-plugin-statusbar/www/statusbar.js",
    "pluginId": "cordova-plugin-statusbar",
    "clobbers": [
      "window.StatusBar"
    ]
  },
  {
    "id": "cordova-plugin-cccometchat.CCCometChat",
    "file": "plugins/cordova-plugin-cccometchat/www/CCCometChat.js",
    "pluginId": "cordova-plugin-cccometchat",
    "clobbers": [
      "CCCometChat"
    ]
  }
];
module.exports.metadata = 
// TOP OF METADATA
{
  "cordova-plugin-console": "1.0.7",
  "cordova-plugin-statusbar": "1.0.1",
  "cordova-plugin-whitelist": "1.2.2",
  "cordova-plugin-cccometchat": "7.0.12.4"
};
// BOTTOM OF METADATA
});
/********* CCCometChat.m Cordova Plugin Implementation *******/
#import "CCCometChat.h"
#import <MessageSDKFramework/CometChat.h>
#import <cometchat-ui/readyUIFIle.h>



@implementation CCCometChat{
    CometChat *cometchat;
    readyUIFIle *cometchatui;
}

- (void)initializeCometChat:(CDVInvokedUrlCommand*)command
{
  [self.commandDelegate runInBackground:^{

        CDVPluginResult* pluginResult = nil;
        NSString* siteUrl = [command.arguments objectAtIndex:0];
        NSString* licenseKey = [command.arguments objectAtIndex:1];
        NSString* apiKey = [command.arguments objectAtIndex:2];
        NSString*  tempCod = [command.arguments objectAtIndex:3];
        BOOL isCod=NO;

        cometchat =  [[CometChat alloc] init];

        if ([tempCod isEqualToString:@"YES"])
        {
          isCod= YES;
                      [cometchat initializeCometChat:siteUrl licenseKey:licenseKey apikey:apiKey isCometOnDemand:isCod
                                   success:^(NSDictionary *response) {
                                       NSLog(@"initialize has done");
                      NSDictionary *successDict = @{@"success":response};
                    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:successDict] callbackId:command.callbackId];

                                   } failure:^(NSError *error) {
                                       NSLog(@"initialize not done here");
                                              NSDictionary *errorDict = @{@"error":error};
                        [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsDictionary:errorDict] callbackId:command.callbackId];
                                   }];
        }
        else{
                  [cometchat checkCometChatUrl:siteUrl success:^(NSDictionary *response) {
            NSLog(@"checkCometChatUrl Success");

            [cometchat initializeCometChat:siteUrl licenseKey:licenseKey apikey:apiKey isCometOnDemand:isCod
                                   success:^(NSDictionary *response) {
                                       NSLog(@"initialize has done");
                      NSDictionary *successDict = @{@"success":response};
                    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:successDict] callbackId:command.callbackId];

                                   } failure:^(NSError *error) {
                                       NSLog(@"initialize not done here");
                                              NSDictionary *errorDict = @{@"error":error};
                        [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsDictionary:errorDict] callbackId:command.callbackId];
                                   }];

        } failure:^(NSError *error) {
            NSLog(@"checkCometChatUrl Failure");
            NSDictionary *errorDict = @{@"error":error};
          [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsDictionary:errorDict] callbackId:command.callbackId];
        }];

        }

        NSLog(@"initializeCometChat Called");

    }];



}



- (void)login:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{

        NSString* username = [command.arguments objectAtIndex:0];
        NSString* password = [command.arguments objectAtIndex:1];
        cometchat =  [[CometChat alloc] init];

 NSLog(@"login Called");

        [cometchat login:username password:password success:^(NSDictionary *response) {
               NSLog(@"login success");
            NSDictionary *successDict = @{@"success":response};
      [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:successDict] callbackId:command.callbackId];

        } failure:^(NSError *error) {
            NSLog(@"login error");
            NSDictionary *errorDict = @{@"error":error};
          [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsDictionary:errorDict] callbackId:command.callbackId];


        }];

    }];

}

- (void)logout:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        cometchat =  [[CometChat alloc] init];

 NSLog(@"logout Called");

        [cometchat logout:^(NSDictionary *response) {
               NSLog(@"login success");
            NSDictionary *successDict = @{@"success":response};
      [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:successDict] callbackId:command.callbackId];

        } failure:^(NSError *error) {
            NSLog(@"login error");
            NSDictionary *errorDict = @{@"error":error};
          [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsDictionary:errorDict] callbackId:command.callbackId];


        }];

    }];



}

- (void)loginWithId:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{

        NSString* username = [command.arguments objectAtIndex:0];
        cometchat =  [[CometChat alloc] init];

    NSLog(@"loginWithId Called");

        [cometchat login:username  success:^(NSDictionary *response) {
               NSLog(@"loginWithId success");
            NSDictionary *successDict = @{@"success":response};
      [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:successDict] callbackId:command.callbackId];

        } failure:^(NSError *error) {
            NSLog(@"loginWithId error");
            NSDictionary *errorDict = @{@"error":error};
          [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsDictionary:errorDict] callbackId:command.callbackId];


        }];

    }];

}

- (void)getAllPushChannels:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{

        NSString* userid = [command.arguments objectAtIndex:0];
        cometchat =  [[CometChat alloc] init];

    NSLog(@"loginWithId Called");

        [cometchat getAllPushChannels:userid  success:^(NSDictionary *response) {
               NSLog(@"getAllPushChannels success");
            NSDictionary *successDict = @{@"success":response};
      [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:successDict] callbackId:command.callbackId];

        } failure:^(NSError *error) {
            NSLog(@"getAllPushChannels error");
            NSDictionary *errorDict = @{@"error":error};
          [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsDictionary:errorDict] callbackId:command.callbackId];


        }];

    }];

}

- (void)launchCometChat:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{


        NSString* isFullScreen = [command.arguments objectAtIndex:0];

        cometchat =  [[CometChat alloc] init];
        cometchatui =  [[readyUIFIle alloc] init];
        BOOL iFS=NO;

        if ([isFullScreen isEqualToString:@"YES"])
        {
            iFS= YES;
        }

        [cometchatui launchCometChat:iFS observer:self.viewController userInfo:^(NSDictionary *response) {

            NSLog(@"userInfo ");
            NSDictionary *successDict = @{@"userInfo":response};
            [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:successDict] callbackId:command.callbackId];

        } groupInfo:^(NSDictionary *response) {

            NSLog(@"groupInfo");
            NSDictionary *successDict = @{@"groupInfo":response};
            [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:successDict] callbackId:command.callbackId];

        } onMessageReceive:^(NSDictionary *response) {

            NSLog(@"onMessageReceive");
            NSDictionary *successDict = @{@"onMessageReceive":response};
            [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:successDict] callbackId:command.callbackId];

        } success:^(NSDictionary *response) {

            NSLog(@"success");
            NSDictionary *successDict = @{@"success":response};
            [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:successDict] callbackId:command.callbackId];

        } failure:^(NSError *error) {

            NSLog(@"failure");
            NSDictionary *errorDict = @{@"failure":error};
            [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsDictionary:errorDict] callbackId:command.callbackId];

        } onLogout:^(NSDictionary *response) {

            NSLog(@"onLogout");
            NSDictionary *successDict = @{@"onLogout":response};
            [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:successDict] callbackId:command.callbackId];

        }];

    }];


}


- (void)launchCometChatWithID:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{

        NSLog(@"launchCometChat ");

        NSString* tempFullScreen    = [command.arguments objectAtIndex:0];
        NSString* username   =  [command.arguments objectAtIndex:1];
        NSString* tempIsGroup         = [command.arguments objectAtIndex:2];
        NSString* tempSetBackButton   = [command.arguments objectAtIndex:3];

        BOOL isFullScreen=NO;
        BOOL isGroup=NO;
        BOOL setBackButton=NO;

        if ([tempFullScreen isEqualToString:@"YES"])
        {
            isFullScreen= YES;
        }
        if ([tempIsGroup isEqualToString:@"YES"])
        {
            isGroup= YES;
        }
        if ([tempSetBackButton isEqualToString:@"YES"])
        {
            setBackButton= YES;
        }

        cometchat =  [[CometChat alloc] init];
        cometchatui =  [[readyUIFIle alloc] init];
        [cometchatui launchCometChat:username isGroup:isGroup isFullScreen:isFullScreen observer:self.viewController setBackButton:setBackButton userInfo:^(NSDictionary *response) {
              NSLog(@"userInfo ");
              NSDictionary *successDict = @{@"userInfo":response};
              [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:successDict] callbackId:command.callbackId];

          } groupInfo:^(NSDictionary *response) {
              NSLog(@"groupInfo");
              NSDictionary *successDict = @{@"groupInfo":response};
              [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:successDict] callbackId:command.callbackId];

          } onMessageReceive:^(NSDictionary *response) {
              NSLog(@"onMessageReceive");
              NSDictionary *successDict = @{@"onMessageReceive":response};
              [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:successDict] callbackId:command.callbackId];


          } success:^(NSDictionary *response) {

              NSLog(@"success");
              NSDictionary *successDict = @{@"success":response};
              [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:successDict] callbackId:command.callbackId];


          } failure:^(NSError *error) {

              NSLog(@"failure");
              NSDictionary *errorDict = @{@"failure":error};
              [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsDictionary:errorDict] callbackId:command.callbackId];


          } onLogout:^(NSDictionary *response) {
              NSLog(@"onLogout");
              NSDictionary *successDict = @{@"onLogout":response};
              [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:successDict] callbackId:command.callbackId];

          }];


    }];


}



@end

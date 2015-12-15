/*
 Copyright 2009-2011 Urban Airship Inc. All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 1. Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 
 2. Redistributions in binaryform must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided withthe distribution.
 
 THIS SOFTWARE IS PROVIDED BY THE URBAN AIRSHIP INC``AS IS'' AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
 EVENT SHALL URBAN AIRSHIP INC OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
 
 
 ADAPTED for experteer, example push
 
 {"aps":{"alert":"Hello from APNs Tester.","badge":1,"sound":"default","category" : "actions"},"p":"/career/profile"}
 
 */

#import "PushPlugin.h"
#import "Constants.h"

@implementation PushPlugin

@synthesize notificationMessage;
@synthesize isInline;

@synthesize callbackId;
@synthesize notificationCallbackId;
@synthesize callback;


- (void)unregister:(CDVInvokedUrlCommand*)command;
{
	self.callbackId = command.callbackId;
  
  [[UIApplication sharedApplication] unregisterForRemoteNotifications];
  [self successWithMessage:@"unregistered"];
}


- (NSString*)getButtonTitleWithLanguage:(NSString*)language AndActionIdentifier:(NSString*)identifier{
    
    if(language==nil){
        return NSLocalizedString(@"NILKEY", "nullvalue");
    }
    
    if([language caseInsensitiveCompare:@"it"]== NSOrderedSame){
        
        if([identifier isEqualToString:savedSearch_action0]){
            return NSLocalizedString(@"VIEW_IT", "view");
        }else if([identifier isEqualToString:savedSearch_action1]){
            return NSLocalizedString(@"LATER_IT", "later");
        }else if([identifier isEqualToString:contactRequest_action0]){
            return NSLocalizedString(@"ACCEPT_IT", "accept");
        }else if([identifier isEqualToString:contactRequest_action1]){
            return NSLocalizedString(@"REJECT_IT", "reject");
        }else if([identifier isEqualToString:profileView_action0]){
            return NSLocalizedString(@"VIEW_IT", "view");
        }else if([identifier isEqualToString:profileView_action1]){
            return NSLocalizedString(@"LATER_IT", "later");
        }
        
        
    }else if([language caseInsensitiveCompare:@"nl"]== NSOrderedSame){
        
        if([identifier isEqualToString:savedSearch_action0]){
            return NSLocalizedString(@"VIEW_NL", "view");
        }else if([identifier isEqualToString:savedSearch_action1]){
            return NSLocalizedString(@"LATER_NL", "later");
        }else if([identifier isEqualToString:contactRequest_action0]){
            return NSLocalizedString(@"ACCEPT_NL", "accept");
        }else if([identifier isEqualToString:contactRequest_action1]){
            return NSLocalizedString(@"REJECT_NL", "reject");
        }else if([identifier isEqualToString:profileView_action0]){
            return NSLocalizedString(@"VIEW_NL", "view");
        }else if([identifier isEqualToString:profileView_action1]){
            return NSLocalizedString(@"LATER_NL", "later");
        }
        
    }else if([language caseInsensitiveCompare:@"es"]== NSOrderedSame){
        
        if([identifier isEqualToString:savedSearch_action0]){
            return NSLocalizedString(@"VIEW_ES", "view");
        }else if([identifier isEqualToString:savedSearch_action1]){
            return NSLocalizedString(@"LATER_ES", "later");
        }else if([identifier isEqualToString:contactRequest_action0]){
            return NSLocalizedString(@"ACCEPT_ES", "accept");
        }else if([identifier isEqualToString:contactRequest_action1]){
            return NSLocalizedString(@"REJECT_ES", "reject");
        }else if([identifier isEqualToString:profileView_action0]){
            return NSLocalizedString(@"VIEW_ES", "view");
        }else if([identifier isEqualToString:profileView_action1]){
            return NSLocalizedString(@"LATER_ES", "later");
        }
        
        
    }else if([language caseInsensitiveCompare:@"en_gb"]== NSOrderedSame){
        
        if([identifier isEqualToString:savedSearch_action0]){
            return NSLocalizedString(@"VIEW_EN_GB", "view");
        }else if([identifier isEqualToString:savedSearch_action1]){
             return NSLocalizedString(@"LATER_EN_GB", "later");
        }else if([identifier isEqualToString:contactRequest_action0]){
             return NSLocalizedString(@"ACCEPT_EN_GB", "accept");
        }else if([identifier isEqualToString:contactRequest_action1]){
             return NSLocalizedString(@"REJECT_EN_GB", "reject");
        }else if([identifier isEqualToString:profileView_action0]){
             return NSLocalizedString(@"VIEW_EN_GB", "view");
        }else if([identifier isEqualToString:profileView_action1]){
             return NSLocalizedString(@"LATER_EN_GB", "later");
        }
        
        
    }else if([language caseInsensitiveCompare:@"en_us"]== NSOrderedSame){
        
        
        if([identifier isEqualToString:savedSearch_action0]){
             return NSLocalizedString(@"VIEW_EN_US", "view");
        }else if([identifier isEqualToString:savedSearch_action1]){
             return NSLocalizedString(@"LATER_EN_US", "later");
        }else if([identifier isEqualToString:contactRequest_action0]){
             return NSLocalizedString(@"ACCEPT_EN_US", "accept");
        }else if([identifier isEqualToString:contactRequest_action1]){
             return NSLocalizedString(@"REJECT_EN_US", "reject");
        }else if([identifier isEqualToString:profileView_action0]){
             return NSLocalizedString(@"VIEW_EN_US", "view");
        }else if([identifier isEqualToString:profileView_action1]){
             return NSLocalizedString(@"LATER_EN_US", "later");
        }

        
        
    }else if([language caseInsensitiveCompare:@"de"]== NSOrderedSame){
        
        if([identifier isEqualToString:savedSearch_action0]){
            return NSLocalizedString(@"VIEW_DE", "view");
        }else if([identifier isEqualToString:savedSearch_action1]){
            return NSLocalizedString(@"LATER_DE", "later");
        }else if([identifier isEqualToString:contactRequest_action0]){
            return NSLocalizedString(@"ACCEPT_DE", "accept");
        }else if([identifier isEqualToString:contactRequest_action1]){
            return NSLocalizedString(@"REJECT_DE", "reject");
        }else if([identifier isEqualToString:profileView_action0]){
            return NSLocalizedString(@"VIEW_DE", "view");
        }else if([identifier isEqualToString:profileView_action1]){
            return NSLocalizedString(@"LATER_DE", "later");
        }
        
        
    }else if([language caseInsensitiveCompare:@"fr"]== NSOrderedSame){
        
        if([identifier isEqualToString:savedSearch_action0]){
            return NSLocalizedString(@"VIEW_FR", "view");
        }else if([identifier isEqualToString:savedSearch_action1]){
            return NSLocalizedString(@"LATER_FR", "later");
        }else if([identifier isEqualToString:contactRequest_action0]){
            return NSLocalizedString(@"ACCEPT_FR", "accept");
        }else if([identifier isEqualToString:contactRequest_action1]){
            return NSLocalizedString(@"REJECT_FR", "reject");
        }else if([identifier isEqualToString:profileView_action0]){
            return NSLocalizedString(@"VIEW_FR", "view");
        }else if([identifier isEqualToString:profileView_action1]){
            return NSLocalizedString(@"LATER_FR", "later");
        }
        
        
    }else if([language caseInsensitiveCompare:@"xx"]== NSOrderedSame){
        
        if([identifier isEqualToString:savedSearch_action0]){
            return NSLocalizedString(@"VIEW_DE", "view");
        }else if([identifier isEqualToString:savedSearch_action1]){
            return NSLocalizedString(@"LATER_DE", "later");
        }else if([identifier isEqualToString:contactRequest_action0]){
            return NSLocalizedString(@"ACCEPT_DE", "accept");
        }else if([identifier isEqualToString:contactRequest_action1]){
            return NSLocalizedString(@"REJECT_DE", "reject");
        }else if([identifier isEqualToString:profileView_action0]){
            return NSLocalizedString(@"VIEW_DE", "view");
        }else if([identifier isEqualToString:profileView_action1]){
            return NSLocalizedString(@"LATER_DE", "later");
        }

        
    }else if([language caseInsensitiveCompare:@"yy"]== NSOrderedSame){
        
        if([identifier isEqualToString:savedSearch_action0]){
            return NSLocalizedString(@"VIEW_DE", "view");
        }else if([identifier isEqualToString:savedSearch_action1]){
            return NSLocalizedString(@"LATER_DE", "later");
        }else if([identifier isEqualToString:contactRequest_action0]){
            return NSLocalizedString(@"ACCEPT_DE", "accept");
        }else if([identifier isEqualToString:contactRequest_action1]){
            return NSLocalizedString(@"REJECT_DE", "reject");
        }else if([identifier isEqualToString:profileView_action0]){
            return NSLocalizedString(@"VIEW_DE", "view");
        }else if([identifier isEqualToString:profileView_action1]){
            return NSLocalizedString(@"LATER_DE", "later");
        }
        
    }
    
    return NSLocalizedString(@"GO", "go");        
}



- (void)register:(CDVInvokedUrlCommand*)command;
{
	self.callbackId = command.callbackId;

    NSMutableDictionary* options = [command.arguments objectAtIndex:0];

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
		UIUserNotificationType UserNotificationTypes = UIUserNotificationTypeNone;
#endif
    UIRemoteNotificationType notificationTypes = UIRemoteNotificationTypeNone;

    id badgeArg = [options objectForKey:@"badge"];
    id soundArg = [options objectForKey:@"sound"];
    id alertArg = [options objectForKey:@"alert"];

    if ([badgeArg isKindOfClass:[NSString class]])
    {
        if ([badgeArg isEqualToString:@"true"]) {
            notificationTypes |= UIRemoteNotificationTypeBadge;
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
            UserNotificationTypes |= UIUserNotificationTypeBadge;
#endif
        }
    }
    else if ([badgeArg boolValue]) {
        notificationTypes |= UIRemoteNotificationTypeBadge;
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
        UserNotificationTypes |= UIUserNotificationTypeBadge;
#endif
    }

    if ([soundArg isKindOfClass:[NSString class]])
    {
        if ([soundArg isEqualToString:@"true"]) {
            notificationTypes |= UIRemoteNotificationTypeSound;
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
            UserNotificationTypes |= UIUserNotificationTypeSound;
#endif
    }
    }
    else if ([soundArg boolValue]) {
        notificationTypes |= UIRemoteNotificationTypeSound;
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
        UserNotificationTypes |= UIUserNotificationTypeSound;
#endif
    }

    if ([alertArg isKindOfClass:[NSString class]])
    {
        if ([alertArg isEqualToString:@"true"]) {
            notificationTypes |= UIRemoteNotificationTypeAlert;
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
            UserNotificationTypes |= UIUserNotificationTypeAlert;
#endif
    }
    }
    else if ([alertArg boolValue]) {
        notificationTypes |= UIRemoteNotificationTypeAlert;
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
        UserNotificationTypes |= UIUserNotificationTypeAlert;
#endif
    }

    notificationTypes |= UIRemoteNotificationTypeNewsstandContentAvailability;
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
    UserNotificationTypes |= UIUserNotificationActivationModeBackground;
#endif

    self.callback = [options objectForKey:@"ecb"];

    if (notificationTypes == UIRemoteNotificationTypeNone)
        NSLog(@"PushPlugin.register: Push notification type is set to none");

    isInline = NO;
    
    /**
    // Interactive Notifications
    NSString *leftPushButtonTitle = [[NSUserDefaults standardUserDefaults] stringForKey:@"i18n.leftpushbutton"];
    NSString *rightPushButtonTitle = [[NSUserDefaults standardUserDefaults] stringForKey:@"i18n.rightpushbutton"];
    if (leftPushButtonTitle!=NULL){
        leftPushButtonTitle=@"";
    }
    if (rightPushButtonTitle!=NULL){
        rightPushButtonTitle=@"";
    }
     **/
    CVMapper *mapper = [[CVMapper alloc] init];
    NSString *languageFromWebApp = [mapper getLanguage];
    EXLog(@"LANGUAGE: %@",languageFromWebApp);
    
    // SAVED_SEARCH
    
    UIMutableUserNotificationAction *SAVED_SEARCH_action0;
    SAVED_SEARCH_action0 = [[UIMutableUserNotificationAction alloc] init];
    [SAVED_SEARCH_action0 setActivationMode:UIUserNotificationActivationModeForeground];
    [SAVED_SEARCH_action0 setTitle:[self getButtonTitleWithLanguage:languageFromWebApp AndActionIdentifier:savedSearch_action0]];
    [SAVED_SEARCH_action0 setIdentifier:savedSearch_action0];
    [SAVED_SEARCH_action0 setDestructive:NO];
    [SAVED_SEARCH_action0 setAuthenticationRequired:NO];
    
    UIMutableUserNotificationAction *SAVED_SEARCH_action1;
    SAVED_SEARCH_action1 = [[UIMutableUserNotificationAction alloc] init];
    [SAVED_SEARCH_action1 setActivationMode:UIUserNotificationActivationModeBackground];
    [SAVED_SEARCH_action1 setTitle:[self getButtonTitleWithLanguage:languageFromWebApp AndActionIdentifier:savedSearch_action1]];
    [SAVED_SEARCH_action1 setIdentifier:savedSearch_action1];
    [SAVED_SEARCH_action1 setDestructive:NO];
    [SAVED_SEARCH_action1 setAuthenticationRequired:NO];
    
    UIMutableUserNotificationCategory *SAVED_SEARCH;
    SAVED_SEARCH = [[UIMutableUserNotificationCategory alloc] init];
    [SAVED_SEARCH setIdentifier:categorySAVED_SEARCH];
    [SAVED_SEARCH setActions:@[SAVED_SEARCH_action0, SAVED_SEARCH_action1]forContext:UIUserNotificationActionContextDefault];
    
    
    // CONTACT_REQUEST
    UIMutableUserNotificationAction *CONTACT_REQUEST_action0;
    CONTACT_REQUEST_action0 = [[UIMutableUserNotificationAction alloc] init];
    [CONTACT_REQUEST_action0 setActivationMode:UIUserNotificationActivationModeForeground];
    [CONTACT_REQUEST_action0 setTitle:[self getButtonTitleWithLanguage:languageFromWebApp AndActionIdentifier:contactRequest_action0]];
    [CONTACT_REQUEST_action0 setIdentifier:contactRequest_action0];
    [CONTACT_REQUEST_action0 setDestructive:NO];
    [CONTACT_REQUEST_action0 setAuthenticationRequired:NO];
    
    UIMutableUserNotificationAction *CONTACT_REQUEST_action1;
    CONTACT_REQUEST_action1 = [[UIMutableUserNotificationAction alloc] init];
    [CONTACT_REQUEST_action1 setActivationMode:UIUserNotificationActivationModeForeground];
    [CONTACT_REQUEST_action1 setTitle:[self getButtonTitleWithLanguage:languageFromWebApp AndActionIdentifier:contactRequest_action1]];
    [CONTACT_REQUEST_action1 setIdentifier:contactRequest_action1];
    [CONTACT_REQUEST_action1 setDestructive:NO];
    [CONTACT_REQUEST_action1 setAuthenticationRequired:NO];
    
    UIMutableUserNotificationCategory *CONTACT_REQUEST;
    CONTACT_REQUEST = [[UIMutableUserNotificationCategory alloc] init];
    [CONTACT_REQUEST setIdentifier:categoryCONTACT_REQUEST];
    [CONTACT_REQUEST setActions:@[CONTACT_REQUEST_action0, CONTACT_REQUEST_action1]forContext:UIUserNotificationActionContextDefault];
    
    
    //PROFILE_VIEW
    UIMutableUserNotificationAction *PROFILE_VIEW_action0;
    PROFILE_VIEW_action0 = [[UIMutableUserNotificationAction alloc] init];
    [PROFILE_VIEW_action0 setActivationMode:UIUserNotificationActivationModeForeground];
    [PROFILE_VIEW_action0 setTitle:[self getButtonTitleWithLanguage:languageFromWebApp AndActionIdentifier:profileView_action0]];
    [PROFILE_VIEW_action0 setIdentifier:profileView_action0];
    [PROFILE_VIEW_action0 setDestructive:NO];
    [PROFILE_VIEW_action0 setAuthenticationRequired:NO];
    
    UIMutableUserNotificationAction *PROFILE_VIEW_action1;
    PROFILE_VIEW_action1 = [[UIMutableUserNotificationAction alloc] init];
    [PROFILE_VIEW_action1 setActivationMode:UIUserNotificationActivationModeBackground];
    [PROFILE_VIEW_action1 setTitle:[self getButtonTitleWithLanguage:languageFromWebApp AndActionIdentifier:profileView_action1]];
    [PROFILE_VIEW_action1 setIdentifier:profileView_action1];
    [PROFILE_VIEW_action1 setDestructive:NO];
    [PROFILE_VIEW_action1 setAuthenticationRequired:NO];
    
    
    UIMutableUserNotificationCategory *PROFILE_VIEW;
    PROFILE_VIEW = [[UIMutableUserNotificationCategory alloc] init];
    [PROFILE_VIEW setIdentifier:categoryPROFILE_VIEW];
    [PROFILE_VIEW setActions:@[PROFILE_VIEW_action0, PROFILE_VIEW_action1]forContext:UIUserNotificationActionContextDefault];
    
    NSSet *categories = [NSSet setWithObjects:SAVED_SEARCH,CONTACT_REQUEST,PROFILE_VIEW,nil];
    
    
    // *******

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
    EXLog(@"Registering for Push OS_MAX>=80000");
    if ([[UIApplication sharedApplication]respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UserNotificationTypes categories:categories];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    } else {
    		[[UIApplication sharedApplication] registerForRemoteNotificationTypes:notificationTypes];
    }
#else
        EXLog(@"Registering for Push OS_MAX<80000");
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:notificationTypes];
#endif

	if (notificationMessage)			// if there is a pending startup notification
		[self notificationReceived];	// go ahead and process it
}

/*
 - (void)isEnabled:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options {
 UIRemoteNotificationType type = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
 NSString *jsStatement = [NSString stringWithFormat:@"navigator.PushPlugin.isEnabled = %d;", type != UIRemoteNotificationTypeNone];
 NSLog(@"JSStatement %@",jsStatement);
 }
 */

- (void)didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
  
  NSMutableDictionary *results = [NSMutableDictionary dictionary];
  NSString *token = [[[[deviceToken description] stringByReplacingOccurrencesOfString:@"<"withString:@""]
                      stringByReplacingOccurrencesOfString:@">" withString:@""]
                     stringByReplacingOccurrencesOfString: @" " withString: @""];
  [results setValue:token forKey:@"deviceToken"];
  
#if !TARGET_IPHONE_SIMULATOR
  // Get Bundle Info for Remote Registration (handy if you have more than one app)
  [results setValue:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"] forKey:@"appName"];
  [results setValue:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"] forKey:@"appVersion"];
  
  // Check what Notifications the user has turned on.  We registered for all three, but they may have manually disabled some or all of them.
  NSUInteger rntypes = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
  
  // Set the defaults to disabled unless we find otherwise...
  NSString *pushBadge = @"disabled";
  NSString *pushAlert = @"disabled";
  NSString *pushSound = @"disabled";
  
  // Check what Registered Types are turned on. This is a bit tricky since if two are enabled, and one is off, it will return a number 2... not telling you which
  // one is actually disabled. So we are literally checking to see if rnTypes matches what is turned on, instead of by number. The "tricky" part is that the
  // single notification types will only match if they are the ONLY one enabled.  Likewise, when we are checking for a pair of notifications, it will only be
  // true if those two notifications are on.  This is why the code is written this way
  if(rntypes & UIRemoteNotificationTypeBadge){
    pushBadge = @"enabled";
  }
  if(rntypes & UIRemoteNotificationTypeAlert) {
    pushAlert = @"enabled";
  }
  if(rntypes & UIRemoteNotificationTypeSound) {
    pushSound = @"enabled";
  }
  
  [results setValue:pushBadge forKey:@"pushBadge"];
  [results setValue:pushAlert forKey:@"pushAlert"];
  [results setValue:pushSound forKey:@"pushSound"];
  
  // Get the users Device Model, Display Name, Token & Version Number
  UIDevice *dev = [UIDevice currentDevice];
  [results setValue:dev.name forKey:@"deviceName"];
  [results setValue:dev.model forKey:@"deviceModel"];
  [results setValue:dev.systemVersion forKey:@"deviceSystemVersion"];
  
  [self successWithMessage:[NSString stringWithFormat:@"%@", token]];
#endif
}

- (void)didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
	[self failWithMessage:@"" withError:error];
}

- (void)notificationReceived {
  NSLog(@"Notification received");
  
  if (notificationMessage && self.callback)
  {
    NSMutableString *jsonStr = [NSMutableString stringWithString:@"{"];
    
    [self parseDictionary:notificationMessage intoJSON:jsonStr];
    
    if (isInline)
    {
      [jsonStr appendFormat:@"foreground:\"%d\"", 1];
      isInline = NO;
    }
		else
      [jsonStr appendFormat:@"foreground:\"%d\"", 0];
    
    [jsonStr appendString:@"}"];
    
    NSLog(@"Msg: %@", jsonStr);
    
    
    //JAVASCRIPT HANDLING OF PUSHMESSAGES
    NSString * jsCallBack = [NSString stringWithFormat:@"%@(%@);", self.callback, jsonStr];
    [self.webView stringByEvaluatingJavaScriptFromString:jsCallBack];
    
    //NATIVE HANDLING OF PUSHMESSAGES
    // TBD.
    
    self.notificationMessage = nil;
  }
}

// reentrant method to drill down and surface all sub-dictionaries' key/value pairs into the top level json
-(void)parseDictionary:(NSDictionary *)inDictionary intoJSON:(NSMutableString *)jsonString
{
  NSArray         *keys = [inDictionary allKeys];
  NSString        *key;
  
  for (key in keys)
  {
    id thisObject = [inDictionary objectForKey:key];
    
    if ([thisObject isKindOfClass:[NSDictionary class]])
      [self parseDictionary:thisObject intoJSON:jsonString];
    else if ([thisObject isKindOfClass:[NSString class]])
      [jsonString appendFormat:@"\"%@\":\"%@\",",
       key,
       [[[[inDictionary objectForKey:key]
          stringByReplacingOccurrencesOfString:@"\\" withString:@"\\\\"]
         stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""]
        stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"]];
    else {
      [jsonString appendFormat:@"\"%@\":\"%@\",", key, [inDictionary objectForKey:key]];
    }
  }
}

- (void)setApplicationIconBadgeNumber:(CDVInvokedUrlCommand *)command {
  NSLog(@"Setting badge");
  
  self.callbackId = command.callbackId;
  
  NSMutableDictionary* options = [command.arguments objectAtIndex:0];
  int badge = [[options objectForKey:@"badge"] intValue] ?: 0;
  
  [[UIApplication sharedApplication] setApplicationIconBadgeNumber:badge];
  
  [self successWithMessage:[NSString stringWithFormat:@"app badge count set to %d", badge]];
}
-(void)successWithMessage:(NSString *)message
{
  CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:message];
  
  [self.commandDelegate sendPluginResult:commandResult callbackId:self.callbackId];
}

-(void)failWithMessage:(NSString *)message withError:(NSError *)error
{
  NSString        *errorMessage = (error) ? [NSString stringWithFormat:@"%@ - %@", message, [error localizedDescription]] : message;
  CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
  
  [self.commandDelegate sendPluginResult:commandResult callbackId:self.callbackId];
}

@end

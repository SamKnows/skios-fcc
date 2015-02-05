//
//  FCCAppDelegate.m
//  FCC
//
//  Copyright (c) 2011-2014 SamKnows Limited. All rights reserved.
//

#import "FCCAppDelegate.h"

@implementation FCCAppBehaviourDelegate

// Configuration - must be overriden by child class!
- (instancetype)init
{
  self = [super init];
  if (self) {
  }
  return self;
}

// Configuration - must be overriden by child class!

-(NSString *) getEnterpriseId {
  //return @"GiancarloTest";
  return @"FCC_Public";
  //return @"SK_Test";
}

-(NSString *) getBaseUrlString {
  return @"http://dcs-mobile-fcc.samknows.com/mobile/dcs";
}

-(BOOL) getIsJitterSupported {
  return NO;
}

-(BOOL) alwaysRunAllTests {
  return NO;
}

-(BOOL) supportContinuousTesting {
  return NO;
}

-(BOOL) supportOneDayResultView {
  return NO;
}

// User interface special behaviours - you can override if you want!
-(UIFont*) getSpecialFontOfSize:(CGFloat)theSize {
  // We use AmericanTypewriter in some cases in this app!
  return [UIFont fontWithName:@"AmericanTypewriter" size:theSize];
}

// Return the device 'unique id' via the app_id value in the upload data *only* for some app variants;
// the default is NO.
-(BOOL) getShouldUploadDeviceId {
  return NO;
}

// By default, throttle query is not supported - we could enable this here, however.
-(BOOL) isThrottleQuerySupported {
  return YES;
}

-(BOOL) isSocialMediaExportSupported {
  return YES;
}

-(BOOL) isSocialMediaImageExportSupported {
  return YES;
}

-(BOOL) supportExportMenuItem {
  return YES;
}


@end

@implementation FCCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  // Initialize crash reporting!
  // Do this ONLY if NOT a debug build...
  
#ifdef DEBUG
  //  NSLog(@"DEBUG: this is a debug build, so NOT initializing crash reporting");
#else // DEBUG
  NSLog(@"DEBUG: this is NOT a debug build, so initializing crash reporting");
  [[BITHockeyManager sharedHockeyManager] setDebugLogEnabled: YES];
  
  [[BITHockeyManager sharedHockeyManager] configureWithIdentifier:@"5a987d025b3fadc9d6a3f8d7b8ba9080"  delegate:self];
  [BITHockeyManager sharedHockeyManager].crashManager.crashManagerStatus = BITCrashManagerStatusAutoSend;
  
  [[BITHockeyManager sharedHockeyManager] startManager];
  //[[BITHockeyManager sharedHockeyManager].authenticator authenticateInstallation];
#endif // DEBUG
  
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (void)crashManagerWillSendCrashReport:(BITCrashManager *)crashManager {
#ifdef _DEBUG
  NSLog(@"DEBUG: crashManager:crashManagerWillSendCrashReport");
#endif // _DEBUG
}

- (void)crashManager:(BITCrashManager *)crashManager didFailWithError:(NSError *)error {
#ifdef _DEBUG
  NSLog(@"DEBUG: crashManager:didFailWithError");
#endif // _DEBUG
}

- (void)crashManagerDidFinishSendingCrashReport:(BITCrashManager *)crashManager {
#ifdef _DEBUG
  NSLog(@"DEBUG: crashManager:crashManagerDidFinishSendingCrashReport");
#endif // _DEBUG
}
@end

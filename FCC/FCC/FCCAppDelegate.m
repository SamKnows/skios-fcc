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
  return @"FCC_Open_Source";
  //return @"SK_Test";
}

-(NSString *) getUrlForServerQuery {
  // Should never be required, as this app variant doesn't use Activation.
  SK_ASSERT(false);
  return @"http://dcs-mobile-fcc.samknows.com/mobile/dcs";
}

-(NSString*)getBaseUrlForUpload {
  return @"http://dcs-mobile-fcc.samknows.com";
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

//
// No need for activation!
//

// We're always activated
- (BOOL)isActivated
{
  return YES;
}

// By default, all app variants support activation.
// Newer apps don't require this...
- (BOOL)isActivationSupported {
  return NO;
}

// We have a built-in schedule!
- (NSString *)schedulePath
{
  NSString *schedulePath = skGetResourcePathFromBundleUsingClass(FCCAppDelegate.class, @"Schedule_FCC.xml");
#ifdef DEBUG
  NSFileManager *fm = [NSFileManager defaultManager];
  SK_ASSERT([fm fileExistsAtPath:schedulePath]);
#endif // DEBUG
  return schedulePath;
}

@end

@implementation FCCAppDelegate

@end

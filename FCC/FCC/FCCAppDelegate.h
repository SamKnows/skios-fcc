//
//  FCCAppDelegate.h
//  FCC
//
//  Copyright (c) 2011-2014 SamKnows Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <HockeySDK/HockeySDK.h>


@interface FCCAppBehaviourDelegate : SKAppBehaviourDelegate

@end

@interface FCCAppDelegate : SKAAppDelegate<BITHockeyManagerDelegate>

@end

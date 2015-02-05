//
//  main.m
//  FCC
//
//  Copyright (c) 2011-2014 SamKnows Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FCCAppDelegate.h"

FCCAppBehaviourDelegate *sAppBehaviour = nil;

int main(int argc, char *argv[])
{
  @autoreleasepool {
    // http://stackoverflow.com/questions/108183/how-to-prevent-sigpipes-or-handle-them-properly
    // Generally you'd set the SIGPIPE handler to SIG_IGN if you think your app will ever write to a
    // broken socket/pipe. It's usually much easier to handle the error on write, than to do
    // anything intelligent in a SIGPIPE handler.
    signal(SIGPIPE, SIG_IGN);
    
    sAppBehaviour = [[FCCAppBehaviourDelegate alloc] init];
    
    return UIApplicationMain(argc, argv, nil, NSStringFromClass([FCCAppDelegate class]));
  }
}
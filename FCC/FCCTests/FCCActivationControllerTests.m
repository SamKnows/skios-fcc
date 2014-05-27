//
//  FCCActivationControllerTests.m
//  SamKnows
//

#import <XCTest/XCTest.h>
#import "OCMock/OCMock.h"

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "SKAAppDelegate.h"
#import "SKAActivationController.h"


@interface FCCActivationControllerTests : XCTestCase

@property(nonatomic,strong) SKAActivationController *viewController;

@end

@interface FCCActivationControllerTests (TheTest)

@end

@implementation SKAActivationController (TheTest)

@end


@implementation FCCActivationControllerTests

@synthesize viewController;

+(UIStoryboard*) getStoryboard {
      // http://stackoverflow.com/questions/8025248/uistoryboard-get-first-view-controller-from-applicationdelegate
      NSString *storyBoardName = [[NSBundle mainBundle].infoDictionary objectForKey:@"UIMainStoryboardFile"];
          UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyBoardName bundle:[NSBundle mainBundle]];
              return storyboard;
}

- (void)setUp {
    UIStoryboard *storyBoard = [FCCActivationControllerTests getStoryboard];
    self.viewController = [storyBoard instantiateViewControllerWithIdentifier: @"SKAActivationController"];
}

- (void)testOutletsConnected {
    // force view to load
    [self.viewController loadView];
    
  XCTAssertNotNil(viewController.lblMain, @"outlet not set");
  XCTAssertNotNil(viewController.viewBG, @"outlet not set");
  XCTAssertNotNil(viewController.lblActivating, @"outlet not set");
  XCTAssertNotNil(viewController.spinnerActivating, @"outlet not set");
  XCTAssertNotNil(viewController.imgviewActivate, @"outlet not set");
  XCTAssertNotNil(viewController.lblDownloading, @"outlet not set");
  XCTAssertNotNil(viewController.spinnerDownloading, @"outlet not set");
  XCTAssertNotNil(viewController.imgviewDownload, @"outlet not set");
  XCTAssertNotNil(viewController.spinnerMain, @"outlet not set");
}

@end

//
//  FCCSettingsControllerTests.m
//  SamKnows
//

#import <XCTest/XCTest.h>
#import "OCMock/OCMock.h"

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "SKAAppDelegate.h"
#import "SKASettingsController.h"


@interface FCCSettingsControllerTests : XCTestCase

@property(nonatomic,strong) SKASettingsController *viewController;

@end

@interface FCCSettingsControllerTests (TheTest)

@end

@implementation SKASettingsController (TheTest)

@end


@implementation FCCSettingsControllerTests

@synthesize viewController;

+(UIStoryboard*) getStoryboard {
      // http://stackoverflow.com/questions/8025248/uistoryboard-get-first-view-controller-from-applicationdelegate
      NSString *storyBoardName = [[NSBundle mainBundle].infoDictionary objectForKey:@"UIMainStoryboardFile"];
          UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyBoardName bundle:[NSBundle mainBundle]];
              return storyboard;
}

- (void)setUp {
    UIStoryboard *storyBoard = [FCCSettingsControllerTests getStoryboard];
    self.viewController = [storyBoard instantiateViewControllerWithIdentifier: @"SKASettingsController"];
}

- (void)testOutletsConnected {
    // force view to load
    [self.viewController loadView];
    
  XCTAssertNotNil(viewController.lblConfig, @"outlet not set");
  XCTAssertNotNil(viewController.lblVersion, @"outlet not set");
  XCTAssertNotNil(viewController.lblDataCap, @"outlet not set");
  XCTAssertNotNil(viewController.txtDataCap, @"outlet not set");
  XCTAssertNotNil(viewController.lblDataUsage, @"outlet not set");
  XCTAssertNotNil(viewController.lblDataMB, @"outlet not set");
}

@end

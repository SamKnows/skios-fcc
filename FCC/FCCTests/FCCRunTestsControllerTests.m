//
//  FCCRunTestsControllerTests.m
//  SamKnows
//

#import <XCTest/XCTest.h>
#import "OCMock/OCMock.h"

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "SKAAppDelegate.h"
#import "SKARunTestsController.h"


@interface FCCRunTestsControllerTests : XCTestCase

@property(nonatomic,strong) SKARunTestsController *viewController;

@end

@interface FCCRunTestsControllerTests (TheTest)

@end

@implementation SKARunTestsController (TheTest)

@end


@implementation FCCRunTestsControllerTests

@synthesize viewController;

+(UIStoryboard*) getStoryboard {
      // http://stackoverflow.com/questions/8025248/uistoryboard-get-first-view-controller-from-applicationdelegate
      NSString *storyBoardName = [[NSBundle mainBundle].infoDictionary objectForKey:@"UIMainStoryboardFile"];
          UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyBoardName bundle:[NSBundle mainBundle]];
              return storyboard;
}

- (void)setUp {
    UIStoryboard *storyBoard = [FCCRunTestsControllerTests getStoryboard];
    self.viewController = [storyBoard instantiateViewControllerWithIdentifier: @"SKARunTestsController"];
}

- (void)testOutletsConnected {
    // force view to load
    [self.viewController loadView];
    
  XCTAssertNotNil(viewController.tableView, @"outlet not set");
  XCTAssertNotNil(viewController.viewBG, @"outlet not set");
  XCTAssertNotNil(viewController.lblClosest, @"outlet not set");
  XCTAssertNotNil(viewController.lblMain, @"outlet not set");
  XCTAssertNotNil(viewController.spinnerMain, @"outlet not set");
}

@end

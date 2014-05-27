//
//  FCCMainResultsControllerTests.m
//  SamKnows
//

#import <XCTest/XCTest.h>
#import "OCMock/OCMock.h"

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "SKAAppDelegate.h"
#import "SKAMainResultsController.h"


@interface FCCMainResultsControllerTests : XCTestCase

@property(nonatomic,strong) SKAMainResultsController *viewController;

@end

@interface FCCMainResultsControllerTests (TheTest)

@end

@implementation SKAMainResultsController (TheTest)

@end


@implementation FCCMainResultsControllerTests

@synthesize viewController;

+(UIStoryboard*) getStoryboard {
      // http://stackoverflow.com/questions/8025248/uistoryboard-get-first-view-controller-from-applicationdelegate
      NSString *storyBoardName = [[NSBundle mainBundle].infoDictionary objectForKey:@"UIMainStoryboardFile"];
          UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyBoardName bundle:[NSBundle mainBundle]];
              return storyboard;
}

- (void)setUp {
    UIStoryboard *storyBoard = [FCCMainResultsControllerTests getStoryboard];
    self.viewController = [storyBoard instantiateViewControllerWithIdentifier: @"SKAMainResultsController"];
}

- (void)testOutletsConnected {
    // force view to load
    [self.viewController loadView];
    
  XCTAssertNotNil(viewController.viewBG, @"outlet not set");
  XCTAssertNotNil(viewController.lblMain, @"outlet not set");
  XCTAssertNotNil(viewController.tableView, @"outlet not set");
  XCTAssertNotNil(viewController.lblAlert, @"outlet not set");
  XCTAssertNotNil(viewController.lblLastDate, @"outlet not set");
  XCTAssertNotNil(viewController.imgviewAlert, @"outlet not set");
}

@end

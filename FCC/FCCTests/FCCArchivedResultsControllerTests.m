//
//  FCCArchivedResultsControllerTests.m
//  SamKnows
//

#import <XCTest/XCTest.h>
#import "OCMock/OCMock.h"

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "SKAAppDelegate.h"
#import "SKAArchivedResultsController.h"


@interface FCCArchivedResultsControllerTests : XCTestCase

@property(nonatomic,strong) SKAArchivedResultsController *viewController;

@end

@interface FCCArchivedResultsControllerTests (TheTest)

@end

@implementation SKAArchivedResultsController (TheTest)

@end


@implementation FCCArchivedResultsControllerTests

@synthesize viewController;

+(UIStoryboard*) getStoryboard {
      // http://stackoverflow.com/questions/8025248/uistoryboard-get-first-view-controller-from-applicationdelegate
      NSString *storyBoardName = [[NSBundle mainBundle].infoDictionary objectForKey:@"UIMainStoryboardFile"];
          UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyBoardName bundle:[NSBundle mainBundle]];
              return storyboard;
}

- (void)setUp {
    UIStoryboard *storyBoard = [FCCArchivedResultsControllerTests getStoryboard];
    self.viewController = [storyBoard instantiateViewControllerWithIdentifier: @"SKAArchivedResultsController"];
}

- (void)testOutletsConnected {
    // force view to load
    [self.viewController loadView];
    
  XCTAssertNotNil(viewController.viewBG, @"outlet not set");
  XCTAssertNotNil(viewController.lblMain, @"outlet not set");
  XCTAssertNotNil(viewController.lblCount, @"outlet not set");
  XCTAssertNotNil(viewController.tableView, @"outlet not set");
  XCTAssertNotNil(viewController.lblClosest, @"outlet not set");
  XCTAssertNotNil(viewController.lblDate, @"outlet not set");
}

@end

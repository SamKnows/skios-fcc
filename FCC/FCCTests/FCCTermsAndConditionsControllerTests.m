//
//  FCCTermsAndConditionsControllerTests.m
//  SamKnows
//

#import <XCTest/XCTest.h>
#import "OCMock/OCMock.h"

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "SKAAppDelegate.h"
#import "SKATermsAndConditionsController.h"


@interface FCCTermsAndConditionsControllerTests : XCTestCase

@property(nonatomic,strong) SKATermsAndConditionsController *viewController;

@end

@interface FCCTermsAndConditionsControllerTests (TheTest)

@end

@implementation SKATermsAndConditionsController (TheTest)

@end


@implementation FCCTermsAndConditionsControllerTests

@synthesize viewController;

+(UIStoryboard*) getStoryboard {
      // http://stackoverflow.com/questions/8025248/uistoryboard-get-first-view-controller-from-applicationdelegate
      NSString *storyBoardName = [[NSBundle mainBundle].infoDictionary objectForKey:@"UIMainStoryboardFile"];
          UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyBoardName bundle:[NSBundle mainBundle]];
              return storyboard;
}

- (void)setUp {
    UIStoryboard *storyBoard = [FCCTermsAndConditionsControllerTests getStoryboard];
    self.viewController = [storyBoard instantiateViewControllerWithIdentifier: @"SKATermsAndConditionsController"];
}

- (void)testOutletsConnected {
    // force view to load
    [self.viewController loadView];
    
  XCTAssertNotNil(viewController.lblMain, @"outlet not set");
  XCTAssertNotNil(viewController.webView, @"outlet not set");
  XCTAssertNotNil(viewController.viewDataCollector, @"outlet not set");
  XCTAssertNotNil(viewController.txtData, @"outlet not set");
}

@end

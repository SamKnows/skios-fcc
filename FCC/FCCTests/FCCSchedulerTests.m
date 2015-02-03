//
//  FCCSchedulerTests.m
//  FCCSchedulerTests
//
//  Copyright (c) 2011-2014 SamKnows Limited. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OCMock/OCMock.h"

@interface FCCSchedulerTests : XCTestCase

@end

@implementation FCCSchedulerTests

- (void)setUp
{
  [super setUp];
  
  // Set-up code here.
}

- (void)tearDown
{
  // Tear-down code here.
  
  [super tearDown];
}

- (void)testSKSchedulerOverrides
{
  SKScheduler *scheduler = [[SKScheduler alloc] init];
  
  XCTAssertFalse([scheduler shouldSortTests], @"");
  XCTAssertTrue([scheduler shouldStoreScheduleVersion], @"");
  
  NSLog(@"Done!");
  [NSThread sleepForTimeInterval:1.0];
}

// TODO - test that the schedule has not been sorted?

@end

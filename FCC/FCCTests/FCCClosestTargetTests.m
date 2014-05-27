//
//  EAQTests.m
//  EAQTests
//
//  Copyright (c) 2011-2014 SamKnows Limited. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OCMock/OCMock.h"

#import "SKAHttpTest.h"
#import "SKALatencyTest.h"
#import "SKALatencyOperation.h"
#import "SKAClosestTargetTest.h"

@interface FCCClosestTargetTests : XCTestCase<SKClosestTargetDelegate>

@end

@implementation FCCClosestTargetTests

- (void)setUp
{
  [super setUp];
}

- (void)tearDown
{
  [super tearDown];
}

- (void)ctdDidCompleteClosestTargetTest:(NSString*)target latency:(double)latency {
}
  
- (void)ctdTestDidFail {
}

- (void)ctdDidSendPacket:(NSUInteger)bytes {
}
  

-(void) testStartTestMethod {
  
  NSArray *targetArray = @[@"localhost"];
  
  SKAClosestTargetTest *closestTarget =
  [[SKAClosestTargetTest alloc] initWithTargets:targetArray ClosestTargetDelegate:self NumDatagrams:4];
  
  // There are various behaviours that now happen!
  [closestTarget startTest];
  NSArray *operationsInQueue = [closestTarget.queue operations];
  
  XCTAssertTrue(operationsInQueue.count == 1, @"");
  
  for (SKLatencyOperation *latencyOperation in operationsInQueue)
  {
    XCTAssertTrue([latencyOperation class] == [SKALatencyOperation class], @"");
    XCTAssertTrue([latencyOperation.target isEqualToString:targetArray[0]], @"");
  }
}

@end

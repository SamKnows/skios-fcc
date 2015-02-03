//
//  EAQTests.m
//  EAQTests
//
//  Copyright (c) 2011-2014 SamKnows Limited. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OCMock/OCMock.h"


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

- (void)ctdDidStartTargetTesting {}
- (void)ctdDidFinishAnotherTarget:(int)targetId withLatency:(double)latency withBest:(int)bestId {}
  

-(void) testStartTestMethod {
  
  NSArray *targetArray = @[@"localhost"];
  
  SKClosestTargetTest *closestTarget =
  [[SKClosestTargetTest alloc] initWithTargets:targetArray ClosestTargetDelegate:self NumDatagrams:0];
  
  // There are various behaviours that now happen!
  [closestTarget startTest];
  NSArray *operationsInQueue = [closestTarget.queue operations];
  
  XCTAssertTrue(operationsInQueue.count == 1, @"");
  
  for (SKLatencyOperation *latencyOperation in operationsInQueue)
  {
    XCTAssertTrue([latencyOperation class] == [SKLatencyOperation class], @"");
    XCTAssertTrue([latencyOperation.target isEqualToString:targetArray[0]], @"");
  }
}

@end

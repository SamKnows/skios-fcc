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

#import "../../skios-core/libcore/SKCoreTests/SKTestCommon.h"

@interface FCCLatencyOperationTests : XCTestCase<SKLatencyOperationDelegate>

@end

@implementation FCCLatencyOperationTests

- (void)setUp
{
  [super setUp];
}

- (void)tearDown
{
  [super tearDown];
}

- (void)lodTestDidSendPacket:(NSUInteger)bytes {
}

- (void)lodTestDidFail:(NSUInteger)threadId {
}


- (void)lodTestDidSucceed:(double)latency_
               packetLoss:(int)packetLoss_
                   jitter:(double)jitter_
             stdDeviation:(double)stdDeviation_
                 threadId:(NSUInteger)threadId_ {
}
  

- (void)lodTestWasCancelled:(NSUInteger)threadId {
}
  

- (void)lodUpdateProgress:(float)progress_ threadId:(NSUInteger)threadId {
}
  
- (void)lodUpdateStatus:(LatencyStatus)status_ threadId:(NSUInteger)threadId {
}
  

-(void) testLatencyOperationFactoryMethod {
  
  DummyLatencyTest *theDummyTest = [[DummyLatencyTest alloc] init];
  
  SKLatencyOperation *latencyOperation = [SKALatencyTest createLatencyOperationWithTarget:@"localhost" port:1 numDatagrams:2 interPacketTime:3.0 delayTimeout:4.0 percentile:5 maxExecutionTime:6.0 threadId:7 TheTest:theDummyTest LatencyOperationDelegate:self];
  
  XCTAssertTrue([latencyOperation class] == [SKALatencyOperation class], @"");
  XCTAssertTrue([latencyOperation.target isEqualToString:@"localhost"], @"");
  XCTAssertTrue((latencyOperation.port == 1), @"");
  XCTAssertTrue((latencyOperation.numDatagrams == 2), @"");
  XCTAssertTrue((latencyOperation.interPacketTime == 3), @"");
  XCTAssertTrue((latencyOperation.delayTimeout == 4), @"");
  XCTAssertTrue((latencyOperation.percentile == 5), @"");
  XCTAssertTrue((latencyOperation.maxExecutionTime == 6), @"");
  XCTAssertTrue((latencyOperation.threadId == 7), @"");
  XCTAssertTrue((latencyOperation.latencyOperationDelegate == self), @"");
}

@end

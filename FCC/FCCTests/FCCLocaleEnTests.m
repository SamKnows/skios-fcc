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

@interface FCCLocaleEnTests : XCTestCase

@end

@implementation FCCLocaleEnTests

- (void)setUp
{
  [super setUp];
  
  // These tests are designed to verify that the English language strings are used properly!
  
  [[NSUserDefaults standardUserDefaults] setObject: [NSArray arrayWithObjects:@"en", nil] forKey:@"AppleLanguages"];
  [[NSUserDefaults standardUserDefaults] synchronize]; //to make the change immediate
}

- (void)tearDown
{
  // Tear-down code here.
  
  [super tearDown];
}

- (void)doVerifyTheStringId:(NSString*)stringId theActualValue:(NSString*)theActualValue theExpectedValue:(NSString*)theExpectedValue {
  NSString *expected = NSLocalizedString(stringId,nil);
  XCTAssertNotNil(expected, @"stringId not nil");
  XCTAssertTrue(expected.length > 0, @"stringId.length > 0");
  XCTAssertNotNil(theActualValue, @"theActualValue not nil");
  XCTAssertTrue(theActualValue.length > 0, @"theActualValue.length > 0");
  XCTAssertTrue([theActualValue isEqualToString:expected], @"stringId matches theActualValue");
  XCTAssertTrue([theActualValue isEqualToString:theExpectedValue], @"stringId matches theExpectedValue");
  
  //NSLog(@"StringId=%@, NSLocalizedString=%@", stringId, theActualValue);
}

// http://stackoverflow.com/questions/1669645/how-to-force-nslocalizedstring-to-use-a-specific-language

- (void)testSKTransferOperationValues
{
  [[NSUserDefaults standardUserDefaults] setObject: [NSArray arrayWithObjects:@"en", nil] forKey:@"AppleLanguages"];
  
  [self doVerifyTheStringId:@"to_UpStream" theActualValue:[SKTransferOperation getUpStream] theExpectedValue:@"upstream"];
  [self doVerifyTheStringId:@"to_DownStream" theActualValue:[SKTransferOperation getDownStream] theExpectedValue:@"downstream"];
  [self doVerifyTheStringId:@"to_StatusInitializing" theActualValue:[SKTransferOperation getStatusInitializing] theExpectedValue:@"Initializing"];
  [self doVerifyTheStringId:@"to_StatusWarming" theActualValue:[SKTransferOperation getStatusWarming] theExpectedValue:@"Warming"];
  [self doVerifyTheStringId:@"to_StatusTransferring" theActualValue:[SKTransferOperation getStatusTransferring] theExpectedValue:@"Transferring"];
  [self doVerifyTheStringId:@"to_StatusComplete" theActualValue:[SKTransferOperation getStatusComplete] theExpectedValue:@"Complete"];
  [self doVerifyTheStringId:@"to_StatusCancelled" theActualValue:[SKTransferOperation getStatusCancelled] theExpectedValue:@"Cancelled"];
  [self doVerifyTheStringId:@"to_StatusFailed" theActualValue:[SKTransferOperation getStatusFailed] theExpectedValue:@"Failed"];
  [self doVerifyTheStringId:@"to_StatusFinished" theActualValue:[SKTransferOperation getStatusFinished] theExpectedValue:@"Finished"];
  [self doVerifyTheStringId:@"to_StatusIdle" theActualValue:[SKTransferOperation getStatusIdle] theExpectedValue:@"Idle"];
  
  // http://stackoverflow.com/questions/12308297/some-of-my-unit-tests-tests-are-not-finishing-in-xcode-4-4
  // Required for tests to be detected as completing!
  [NSThread sleepForTimeInterval:1.0];
}

- (void)testSKLatencyOperationValues
{
  [[NSUserDefaults standardUserDefaults] setObject: [NSArray arrayWithObjects:@"en", nil] forKey:@"AppleLanguages"];
  
  [self doVerifyTheStringId:@"lo_Idle" theActualValue:[SKLatencyOperation getIdleStatus] theExpectedValue:@"Idle"];
  [self doVerifyTheStringId:@"lo_Initializing" theActualValue:[SKLatencyOperation getInitializingStatus] theExpectedValue:@"Initializing"];
  [self doVerifyTheStringId:@"lo_Running" theActualValue:[SKLatencyOperation getRunningStatus] theExpectedValue:@"Running"];
  [self doVerifyTheStringId:@"lo_Complete" theActualValue:[SKLatencyOperation getCompleteStatus] theExpectedValue:@"Complete"];
  [self doVerifyTheStringId:@"lo_Finished" theActualValue:[SKLatencyOperation getFinishedStatus] theExpectedValue:@"Finished"];
  [self doVerifyTheStringId:@"lo_Cancelled" theActualValue:[SKLatencyOperation getCancelledStatus] theExpectedValue:@"Cancelled"];
  [self doVerifyTheStringId:@"lo_Timeout" theActualValue:[SKLatencyOperation getTimeoutStatus] theExpectedValue:@"Timeout"];
  [self doVerifyTheStringId:@"lo_Searching" theActualValue:[SKLatencyOperation getSearchingStatus] theExpectedValue:@"Searching..."];
  [self doVerifyTheStringId:@"lo_Failed" theActualValue:[SKLatencyOperation getFailedStatus] theExpectedValue:@"Failed"];
  XCTAssertTrue([[SKLatencyOperation getStringSpace] isEqualToString:@"SKTESTSPACE"], @"[SKLatencyOperation getStringSpace] returns SKTESTSPACE");
  
  // http://stackoverflow.com/questions/12308297/some-of-my-unit-tests-tests-are-not-finishing-in-xcode-4-4
  // Required for tests to be detected as completing!
  [NSThread sleepForTimeInterval:1.0];
}

-(void) testHttpTestValues {
  //  NOTE: This seems to work only on a device/simulator that has previously had the specified language selected manually *at least once*!
  [[NSUserDefaults standardUserDefaults] setObject: [NSArray arrayWithObjects:@"en", nil] forKey:@"AppleLanguages"];
  
  
  SKAHttpTest *httpTest = [[SKAHttpTest alloc] initWithTarget:nil
                                                         port:0
                                                         file:nil
                                                 isDownstream:NO
                                                warmupMaxTime:15000000
                                               warmupMaxBytes:0
                                              TransferMaxTimeMicroseconds:15000000
                                             transferMaxBytes:0                                                    nThreads:1
                                                     HttpTestDelegate:nil];
  
  XCTAssertFalse([httpTest isSuccessful], @"");
  httpTest.testOK = NO;
  XCTAssertFalse([httpTest isSuccessful], @"");
  httpTest.isDownstream = YES;
  
  httpTest.isDownstream = NO;
  
  httpTest.testOK = YES;
  XCTAssertTrue([httpTest isSuccessful], @"");
  httpTest.isDownstream = YES;
  
  httpTest.isDownstream = NO;
}

- (void)testSKLatencyValues
{
  //  NOTE: This seems to work only on a device/simulator that has previously had the specified language selected manually *at least once*!
  [[NSUserDefaults standardUserDefaults] setObject: [NSArray arrayWithObjects:@"en", nil] forKey:@"AppleLanguages"];
  
  
  SKLatencyTest *latencyTest = [[SKALatencyTest alloc] initWithTarget:@"localhost"
                                                                port:99
                                                        numDatagrams:1
                                                     interPacketTime:100
                                                        delayTimeout:1000
                                                          percentile:50
                                                    maxExecutionTime:2000
                                                            LatencyTestDelegate:nil];
  
  XCTAssertFalse(latencyTest.testOK, @"");
  
  latencyTest.testOK = NO;
  
  latencyTest.testOK = YES;
  latencyTest.latency = 44;
  latencyTest.packetLoss = 55;
  latencyTest.jitter = 66;
  
  // http://stackoverflow.com/questions/12308297/some-of-my-unit-tests-tests-are-not-finishing-in-xcode-4-4
  // Required for tests to be detected as completing!
  [NSThread sleepForTimeInterval:1.0];
}

@end

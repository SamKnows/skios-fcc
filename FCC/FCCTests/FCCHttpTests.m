//
//  EAQTests.m
//  EAQTests
//
//  Copyright (c) 2011-2014 SamKnows Limited. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OCMock/OCMock.h"

@interface SKHttpTest()
- (void)storeOutputResults:(double)aValue;
@end

@interface FCCHttpTests : XCTestCase<SKHttpTestDelegate>

@end

@implementation FCCHttpTests

- (void)setUp
{
  [super setUp];
}

- (void)tearDown
{
  [super tearDown];
}

- (void)htdUpdateStatus:(TransferStatus)status
               threadId:(NSUInteger)threadId {}

- (void)htdDidTransferData:(NSUInteger)totalBytes
                     bytes:(NSUInteger)bytes
                  progress:(float)progress
                  threadId:(NSUInteger)threadId {}

- (void)htdDidUpdateTotalProgress:(float)progress currentBitrate:(double)currentBitrate {}

- (void)htdDidCompleteHttpTest:(double)bitrateMpbs1024Based
            ResultIsFromServer:(BOOL)resultIsFromServer {}

- (SKHttpTest *)createHttpTestInstance {
  SKHttpTest *httpTest = [[SKHttpTest alloc] initWithTarget:@"localhost"
                                                         port:0
                                                         file:nil
                                                 isDownstream:NO
                                                warmupMaxTime:15000000
                                               warmupMaxBytes:0
                                              TransferMaxTimeMicroseconds:15000000
                                             transferMaxBytes:0                                                     nThreads:1
                                                     HttpTestDelegate:self];
  return httpTest;
}

-(void) testHttpIsAsync {
  
  SKHttpTest *httpTest = [self createHttpTestInstance];
  
  XCTAssertFalse([httpTest getTestIsAsyncFlag], @"SKA - httpTest must be async == NO");
}

-(void) testHttpStoreOutputResult {
  
  SKHttpTest *httpTest = [self createHttpTestInstance];
  XCTAssertNotNil(httpTest.outputResultsDictionary, @"");
 
    [httpTest storeOutputResults:42];
  
  XCTAssertNotNil(httpTest.outputResultsDictionary, @"");
}

@end

//
//  EAQTests.m
//  EAQTests
//
//  Copyright (c) 2011-2014 SamKnows Limited. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OCMock/OCMock.h"

#import "SKAHttpTest.h"

@interface SKAHttpTest()
- (void)storeOutputResults;
@end

@interface FCCHttpTests : XCTestCase

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

- (SKAHttpTest *)createHttpTestInstance {
  SKAHttpTest *httpTest = [[SKAHttpTest alloc] initWithTarget:@"localhost"
                                                         port:0
                                                         file:nil
                                                 isDownstream:NO
                                                warmupMaxTime:15000000
                                               warmupMaxBytes:0
                                              TransferMaxTimeMicroseconds:15000000
                                             transferMaxBytes:0                                                     nThreads:1
                                                     HttpTestDelegate:nil];
  return httpTest;
}

-(void) testHttpIsAsync {
  
  SKAHttpTest *httpTest = [self createHttpTestInstance];
  
  XCTAssertFalse([httpTest getTestIsAsyncFlag], @"SKA - httpTest must be async == NO");
}

-(void) testHttpStoreOutputResult {
  
  SKAHttpTest *httpTest = [self createHttpTestInstance];
  XCTAssertNil(httpTest.outputResultsDictionary, @"");
 
  [httpTest storeOutputResults];
  
  XCTAssertNotNil(httpTest.outputResultsDictionary, @"");
}

@end

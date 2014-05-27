//
//  GlobalMethodsTestCase.m
//  FCC
//
//  Created by Pete Cole on 14/08/2013.
//  Copyright (c) 2013 SamKnows. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface GlobalMethodsTestCase : XCTestCase

@end

@implementation GlobalMethodsTestCase

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end

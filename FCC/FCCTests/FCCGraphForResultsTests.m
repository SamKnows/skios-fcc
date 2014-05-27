//
//  FCCGraphForResultsTests.m
//
//  Copyright (c) 2011-2014 SamKnows Limited. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OCMock/OCMock.h"

#import "../../libcore/SKGraphForResults.h"

@interface FCCGraphForResultsTests : XCTestCase

@property UIView *hostView;
@property SKGraphForResults *graph;

@end

@implementation FCCGraphForResultsTests

- (void)setUp {
  [super setUp];
  
  self.hostView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
  self.graph = [[SKGraphForResults alloc] init];
}

- (void)tearDown {
  // Tear-down code here.
  
  [super tearDown];
}
                   
-(void) prepareGraphFromJsonString:(NSString*)jsonString {
  
  NSData *stringAsData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
 
  [self.graph updateGraphWithTheseResults:stringAsData OnParentView:self.hostView InFrame:CGRectMake(0,0,10,10) StartHidden:NO WithDateFilter:DATERANGE_1w1m3m1y_ONE_WEEK];
}

- (void)testOne {
 
  NSString *jsonString = @"{"
  "  \"results\" : {"
  "    \"downstream_mt\" : {"
  "      \"2013-10-23\" : \"8.33\""
  "    }"
  "  },"
  "  \"request\" : {"
  "    \"test_type\" : \"downstream_mt\","
  "    \"unit_id\" : \"210148\","
  "    \"start_date\" : \"2013-10-18\","
  "    \"tests\" : ["
  "      \"downstream_mt\""
  "    ],"
  "    \"end_date\" : \"2013-10-23\""
  "  }"
  "}";
  
  [self prepareGraphFromJsonString:jsonString];
  
  XCTAssertTrue((self.graph.corePlotMinValue == 0), @"");
  XCTAssertTrue((self.graph.corePlotMaxValue == 8.33), @"");
  XCTAssertNotNil(self.graph.mpCorePlotDataPoints, @"");
  XCTAssertNotNil(self.graph.mpCorePlotDates, @"");
 
  XCTAssertTrue((self.graph.mpCorePlotDataPoints.count == 7), @"");
  XCTAssertTrue((self.graph.mpCorePlotDates.count == 7), @"");
  
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateFormat:@"yyyy-MM-dd"];
  
  int dateIndex = 0;
  for (NSDate *date in self.graph.mpCorePlotDates)
  {
    NSString *dateString = [dateFormatter stringFromDate:date];
    NSLog(@"date[%d]=%@", dateIndex, dateString);
    
    if (dateIndex == 0) {
      XCTAssertTrue([dateString isEqualToString:@"2013-10-18"], @"");
    } else if (dateIndex == 6) {
      XCTAssertTrue([dateString isEqualToString:@"2013-10-24"], @"");
    }
    
    dateIndex++;
  }
  
  int valueIndex = 0;
  for (NSString *value in self.graph.mpCorePlotDataPoints)
  {
    if (valueIndex == 5) {
         XCTAssertTrue(([value doubleValue] == 8.33), @"");
    } else if (valueIndex == 6) {
      XCTAssertTrue(([value doubleValue] == 8.33), @"");
    } else {
      XCTAssertTrue([self.graph.mpCorePlotDataPoints[0] isEqualToString:@""], @"");
    }
    valueIndex++;
  }
  
  NSLog(@"Done!");
  [NSThread sleepForTimeInterval:1.0];
}

- (void)testTwo {
  
  NSString *jsonString = @"{"
"    \"results\" : {"
"      \"downstream_mt\" : {"
"        \"2013-10-29\" : \"17.603488\""
"      }"
"    },"
"    \"request\" : {"
  "    \"test_type\" : \"downstream_mt\","
"      \"start_date\" : \"2013-10-22\","
"      \"tests\" : ["
"                 \"downstream_mt\""
"                 ],"
"      \"results\" : ["
""
"      ],"
"      \"end_date\" : \"2013-10-29\""
"    }"
"  }";
  
  [self prepareGraphFromJsonString:jsonString];
  
  XCTAssertTrue((self.graph.corePlotMinValue == 0), @"");
  XCTAssertTrue((self.graph.corePlotMaxValue == 17.603488), @"");
  XCTAssertNotNil(self.graph.mpCorePlotDataPoints, @"");
  XCTAssertNotNil(self.graph.mpCorePlotDates, @"");
  XCTAssertTrue((self.graph.mpCorePlotDataPoints.count == 9), @"");
  XCTAssertTrue((self.graph.mpCorePlotDates.count == 9), @"");
  
  NSLog(@"self.graph.mpCorePlotDataPoints= %@", self.graph.mpCorePlotDataPoints);
  NSLog(@"self.graph.mpCorePlotDates = %@", self.graph.mpCorePlotDates);
  
  
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateFormat:@"yyyy-MM-dd"];
  
  int dateIndex = 0;
  for (NSDate *date in self.graph.mpCorePlotDates)
  {
    NSString *dateString = [dateFormatter stringFromDate:date];
    NSLog(@"date[%d]=%@", dateIndex, dateString);
    
    if (dateIndex == 0) {
      XCTAssertTrue([dateString isEqualToString:@"2013-10-22"], @"");
    } else if (dateIndex == 8) {
      XCTAssertTrue([dateString isEqualToString:@"2013-10-29"], @"");
    }
    
    dateIndex++;
  }
  
  int valueIndex = 0;
  for (NSString *value in self.graph.mpCorePlotDataPoints)
  {
    if (valueIndex == 8) {
      XCTAssertTrue(([value doubleValue] == 17.603488), @"");
    } else {
      XCTAssertTrue([self.graph.mpCorePlotDataPoints[0] isEqualToString:@""], @"");
    }
    valueIndex++;
  }
  
  NSLog(@"Done!");
  [NSThread sleepForTimeInterval:1.0];
}

@end

//
//  ToolsDemoNetworkSpec.m
//  ToolsDemo
//
//  Created by huin on 6/24/13.
//  Copyright (c) 2013 www.huin-lab.com. All rights reserved.
//

#import "Kiwi.h"

SPEC_BEGIN(ToolsDemoNetworkSpec)

describe(@"Network", ^{
  __block NSHTTPURLResponse *actualResponse = nil;
  __block NSData *actualData = nil;
  __block NSError *actualError = nil;
  
  beforeEach(^{
    actualResponse = nil;
    actualData = nil;
    actualError = nil;
  });
  
  it(@"tatus code should be 200.", ^{
    NSURL *url = [NSURL URLWithString:@"http://genesix.co.jp/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[[NSOperationQueue alloc] init]
                           completionHandler:
     ^(NSURLResponse *response, NSData *data, NSError *error) {
       actualResponse = (NSHTTPURLResponse *)response;
       actualData = data;
       actualError = error;
     }];
    
    [[expectFutureValue(actualError) shouldEventually] beNil];
    [[expectFutureValue(actualData) shouldEventuallyBeforeTimingOutAfter(5.0f)] beNonNil];
    [[theValue(actualResponse.statusCode) should] equal:200 withDelta:.01];
  });
});

SPEC_END

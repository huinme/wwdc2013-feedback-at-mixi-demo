//
//  ToolsDemoNetworkStubSpec.m
//  ToolsDemo
//
//  Created by huin on 6/24/13.
//  Copyright (c) 2013 www.huin-lab.com. All rights reserved.
//

#import "Kiwi.h"

#import "Nocilla.h"

SPEC_BEGIN(ToolsDemoNetworkStubSpec)

describe(@"The network", ^{
  __block NSHTTPURLResponse *actualResponse = nil;
  __block NSData *actualData = nil;
  __block NSError *actualError = nil;

  beforeAll(^{ [[LSNocilla sharedInstance] start]; });
  afterAll(^{ [[LSNocilla sharedInstance] stop]; });
  afterEach(^{ [[LSNocilla sharedInstance] clearStubs]; });

  it(@"return 404.", ^{
    NSURL *url = [NSURL URLWithString:@"http://mixi.jp"];
    stubRequest(@"GET", url.absoluteString).andReturn(404);
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[[NSOperationQueue alloc] init]
                           completionHandler:
     ^(NSURLResponse *response, NSData *data, NSError *error) {
       actualResponse = (NSHTTPURLResponse *)response;
       actualData = data;
       actualError = error;
     }];
    
    [[expectFutureValue(actualResponse) shouldEventuallyBeforeTimingOutAfter(2.0f)] beNonNil];
    [[theValue(actualResponse.statusCode) shouldEventuallyBeforeTimingOutAfter(2.0f)] equal:404 withDelta:.01f];
  });
  
  it(@"return JSON data.", ^{
    __block NSString *messageBody = nil;
    
    NSURL *url = [NSURL URLWithString:@"http://mixi.jp"];
    NSBundle *testBundle = [NSBundle bundleForClass:[ToolsDemoNetworkStubSpec class]];
    NSString *filePath = [testBundle pathForResource:@"test_data"
                                              ofType:@"json"];
    stubRequest(@"GET", url.absoluteString).andReturnRawResponse([NSData dataWithContentsOfFile:filePath]);
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[[NSOperationQueue alloc] init]
                           completionHandler:
     ^(NSURLResponse *response, NSData *data, NSError *error) {
       actualResponse = (NSHTTPURLResponse *)response;
       actualData = data;
       actualError = error;
       
       NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                            options:0
                                                              error:nil];
       messageBody = [dict valueForKey:@"message"];
       NSLog(@"\nMESSAGE BODY : %@\n", messageBody);
     }];
    
    [[expectFutureValue(actualResponse) shouldEventuallyBeforeTimingOutAfter(2.0f)] beNonNil];
    [[theValue(actualResponse.statusCode) shouldEventuallyBeforeTimingOutAfter(2.0f)] equal:200 withDelta:.01f];
    [[theValue([messageBody isEqualToString:@"Hellow, World"]) shouldEventually] beTrue];
  });
});

SPEC_END






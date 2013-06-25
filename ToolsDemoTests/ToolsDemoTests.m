//
//  ToolsDemoTests.m
//  ToolsDemoTests
//
//  Created by huin on 6/24/13.
//  Copyright (c) 2013 www.huin-lab.com. All rights reserved.
//

#import "ToolsDemoTests.h"

#import "TDAppDelegate.h"

@interface TDAppDelegate(ToolsDemoTests)

@property (nonatomic, strong) TDNavigationController *navigationController;

@end

@interface ToolsDemoTests()
{
  TDAppDelegate *_appDelegate;
}

@end

@implementation ToolsDemoTests

- (void)setUp
{
  [super setUp];
  
  _appDelegate = [UIApplication sharedApplication].delegate;
}

- (void)tearDown
{
  [super tearDown];
  
  _appDelegate = nil;
}

- (void)testAppDelegateIsAKindOfTDAppDelegateClass
{ 
  STAssertNotNil(_appDelegate, @"App Delegate must not be nil.");
  STAssertTrue([_appDelegate isKindOfClass:[TDAppDelegate class]], @"should be a kind of TDAppDelegate class.");
}

- (void)testAppDelegateHasAInstanceOfTDNavigationController
{
  STAssertNotNil(_appDelegate.navigationController, @"should not be nil.");
}


@end

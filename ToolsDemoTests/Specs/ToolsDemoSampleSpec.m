//
//  ToolsDemoSampleSpec.m
//  ToolsDemo
//
//  Created by huin on 6/24/13.
//  Copyright (c) 2013 www.huin-lab.com. All rights reserved.
//

#import "Kiwi.h"

#import "TDAppDelegate.h"
#import "TDNavigationController.h"

@interface TDAppDelegate(ToolsDemoSampleSpec)

@property (nonatomic, strong) TDNavigationController *navigationController;

@end

SPEC_BEGIN(ToolsDemoSampleSpec)

describe(@"TDAppDelegate", ^{
  context(@"when app was launched", ^{
    __block TDAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;

    it(@"app delegate of shared application is a instance of TDAppDelegate class", ^{
      [[appDelegate should] beKindOfClass:[TDAppDelegate class]];
    });
    
    it(@"has a instance of TDNavigationController.", ^{
      [appDelegate.navigationController shouldNotBeNil];
    });
    
    pending(@"未実装なテスト", ^{
      
    });
  });
});

SPEC_END
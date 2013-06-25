//
//  TDInitialViewController.m
//  ToolsDemo
//
//  Created by huin on 6/24/13.
//  Copyright (c) 2013 www.huin-lab.com. All rights reserved.
//

#import "TDInitialViewController.h"

@interface TDInitialViewController ()

@end

@implementation TDInitialViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
	
  self.view.backgroundColor = [UIColor underPageBackgroundColor];
  
  UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
  label.frame = CGRectMake(15.0f, 15.0f, 290.0f, 50.0f);
  label.text = @"Hello, World!";
  label.font = [UIFont boldSystemFontOfSize:24.0f];
  label.backgroundColor = self.view.backgroundColor;
  label.textColor = [UIColor colorWithWhite:0.25f alpha:1.0f];
  label.textAlignment = NSTextAlignmentCenter;
  [self.view addSubview:label];
  
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end

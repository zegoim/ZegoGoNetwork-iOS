//
//  ZEGOViewController.m
//  ZegoNetwork
//
//  Created by vicwan1992@163.com on 01/17/2022.
//  Copyright (c) 2022 vicwan1992@163.com. All rights reserved.
//

#import "ZEGOViewController.h"
#import "ZegoAdGetAdAPI.h"

@interface ZEGOViewController ()

@end

@implementation ZEGOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  
  self.view.backgroundColor = UIColor.redColor;
  
  [self networkingTest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)networkingTest {
  
  ZegoAdGetAdAPI *api = [[ZegoAdGetAdAPI alloc] init];
  api.app = 1;
  
  [api zego_startWithComplete:^(ZegoNetworkRespModel * _Nullable rsp) {
    
    NSLog(@"...");
    
  } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
    
    NSLog(@"...");

  }];
  
}

@end

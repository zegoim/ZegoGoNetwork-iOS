//
//  ZegoAdGetAdAPI.m
//  Pods
//
//  Created by Vic on 2022/1/11.
//

#import "ZegoAdGetAdAPI.h"

@implementation ZegoAdGetAdAPI

- (NSString *)subPath {
  return @"alpha/go_call/misc/get_advertisement";
}

- (NSDictionary *)parameters {
  return @{
    @"platform": @(2),
    @"app": @(_app),
  };
}

@end

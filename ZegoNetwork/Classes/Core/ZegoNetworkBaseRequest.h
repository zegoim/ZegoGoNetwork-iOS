//
//  ZegoNetworkBaseRequest.h
//
//  Created by Vic on 2022/1/11.
//

#import <YTKNetwork/YTKNetwork.h>
#import "ZegoNetworkRespModel.h"

@interface ZegoNetworkBaseRequest : YTKBaseRequest

/// 是否打印调试 log
@property (nonatomic, assign) BOOL debugLog;


/// For re-write
- (NSString * _Nullable)subPath;

/// For re-write
- (NSDictionary * _Nullable)parameters;

/// Calling this method to request.
- (void)zego_startWithComplete:(void(^_Nullable)(ZegoNetworkRespModel * _Nullable rsp))complete
                       failure:(void(^_Nullable)(__kindof YTKBaseRequest * _Nonnull request))failure;

@end

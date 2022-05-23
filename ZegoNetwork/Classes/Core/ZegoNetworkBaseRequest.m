//
//  ZegoNetworkBaseRequest.m
//
//  Created by Vic on 2022/1/11.
//

#import "ZegoNetworkBaseRequest.h"

@implementation ZegoNetworkBaseRequest

- (void)zego_startWithComplete:(void (^)(ZegoNetworkRespModel * _Nullable))complete
                       failure:(void (^)(__kindof YTKBaseRequest * _Nonnull))failure {
  
  [self startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
    
    if (!self.debugLog) {
      NSLog(@"[ZEGO_NETWORK_DEBUG] Request URL: %@", [NSString stringWithFormat:@"%@%@", request.baseUrl, request.requestUrl]);
      NSLog(@"[ZEGO_NETWORK_DEBUG] Request Args: %@", [self jsonStringEncoded:request.requestArgument]);
      NSLog(@"[ZEGO_NETWORK_DEBUG] Response JSON: %@", request.responseString);
    }
    
    NSDictionary *rspDict = request.responseJSONObject;
    if (!rspDict) {
      if (complete) {
        complete(nil);
      }
      return;
    }
    
    NSDictionary *retDict = rspDict[@"ret"];
    ZegoNetworkRespResultModel *resultModel;
    if (retDict) {
      resultModel = [[ZegoNetworkRespResultModel alloc] init];
      resultModel.code = retDict[@"code"] ? [retDict[@"code"] integerValue] : -1;
      resultModel.message = retDict[@"message"];
    }
    
    ZegoNetworkRespModel *rsp = [[ZegoNetworkRespModel alloc] init];
    rsp.resultModel = resultModel;
    rsp.data = rspDict[@"data"];
    
    if (complete) {
      complete(rsp);
    }
    
  } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
    if (!self.debugLog) {
      NSLog(@"[ZEGO_NETWORK_WARN] Request URL: %@", [NSString stringWithFormat:@"%@%@", request.baseUrl, request.requestUrl]);
      NSLog(@"[ZEGO_NETWORK_WARN] Request Args: %@", request.requestArgument);
      NSLog(@"[ZEGO_NETWORK_WARN] Response JSON: %@", request.responseString);
    }
    if (failure) {
      failure(request);
    }
  }];
}

- (NSString *)requestUrl {
  return [NSString stringWithFormat:@"%@", [self subPath]];
}

- (NSString *)subPath {
  return nil;
}

- (NSDictionary *)parameters {
  return nil;
}

#pragma mark - Override
- (NSString *)baseUrl {
  return @"https://demo-server-sh.zego.im";
}

- (NSTimeInterval)requestTimeoutInterval {
  return 15.f;
}

- (YTKRequestMethod)requestMethod {
  return YTKRequestMethodPOST;
}

- (YTKRequestSerializerType)requestSerializerType {
  return YTKRequestSerializerTypeJSON;
}

- (id)requestArgument {
  return self.parameters;
}


- (NSString *)jsonStringEncoded:(id)obj {
  if (!obj) return nil;
    
  if ([NSJSONSerialization isValidJSONObject:obj]) {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:obj options:0 error:&error];
    NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    if (!error) return json;
  }
  return nil;
}

@end

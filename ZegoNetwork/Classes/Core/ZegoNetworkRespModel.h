//
//  ZegoAdRspObject.h
//
//  Created by Vic on 2022/1/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZegoNetworkRespResultModel : NSObject

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, copy) NSString *message;

@end


@interface ZegoNetworkRespModel : NSObject

@property (nonatomic, strong) ZegoNetworkRespResultModel *resultModel;
@property (nonatomic, copy) NSDictionary *data;

@end


NS_ASSUME_NONNULL_END

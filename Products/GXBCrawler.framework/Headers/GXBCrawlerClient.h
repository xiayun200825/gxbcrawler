//
//  GXBCrawlerClient.h
//  GXBCrawlerClient
//
//  Created by xiayun on 16/9/14.
//  Copyright © 2016年 xiayun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, GXBAuthErrorCode) {
    GXBAuthErrorCodeCancelled = -999,
    GXBAuthErrorCodeSetupFailed,
    GXBAuthErrorCodeFetchTokenFailed,
    GXBAuthErrorCodeFetchAuthArgumentsFailed,
    GXBAuthErrorCodeProcessFailed
};

@interface GXBCrawlerClient : NSObject

+ (void)registerGXBCrawlerWithAppId:(NSString *)appId appSecret:(NSString *)appSecret;

/**
 * userInfo[@"sequenceNo"] 外部系统用户授权唯一性标志
 * userInfo[@"phone"] 手机号码
 * userInfo[@"authItem"] 授权项 {jd,xuexin,operator,credit,security,resume,develop}
 * userInfo[@"name"] 姓名
 * userInfo[@"idcard"] 身份证号
 */
+ (void)presentGXBViewControllerIn:(UIViewController *)presentingViewController
                          userInfo:(NSDictionary *)userInfo
                        completion:(void(^)(BOOL succeed, NSError *error))completion;

@end

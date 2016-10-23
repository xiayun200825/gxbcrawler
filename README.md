# gxbcrawler

## Installation
#### via cocoapods
```
pod 'GXBCrawler', :git => 'https://github.com/xiayun200825/gxbcrawler.git', :tag => '0.1.0'
```

## Usage
#### step 1. register in AppDelegate
```
[GXBCrawlerClient registerGXBCrawlerWithAppId:@"Your app id" appSecret:@"Your app secret"];
```

#### step 2. present GXB Auth View
```
[GXBCrawlerClient presentGXBViewControllerIn:self
                                    userInfo:@{@"sequenceNo":{sequenceNo},
                                               @"phone":{phone},
                                               @"name":{name},
                                               @"idcard":{idcard},
                                               @"authItem":{authItem}}
                                  completion:^(BOOL succeed, NSError *error) {
                                      NSLog(@"授权状态：%@,%@",@(succeed), error);
                                  }];
```

## UserInfo
 * userInfo[@"sequenceNo"] 外部系统用户授权唯一性标志
 * userInfo[@"phone"] 手机号码
 * userInfo[@"authItem"] 授权项 {jd,xuexin,operator,credit,security,resume}
 * userInfo[@"name"] 姓名
 * userInfo[@"idcard"] 身份证号

#### AuthItem
 * jd - 京东
 * xuexin - 学信
 * operator - 运营商
 * credit - 人行征信
 * security - 社保
 * resume - 简历

## GXBAuthErrorCode
 * GXBAuthErrorCodeCancelled = -999 // 用户取消
 * GXBAuthErrorCodeSetupFailed = -998 // 初始化失败
 * GXBAuthErrorCodeFetchTokenFailed = -997 // 获取令牌失败
 * GXBAuthErrorCodeFetchAuthArgumentsFailed = -996 // 获取授权参数失败
 * GXBAuthErrorCodeProcessFailed = -995 // 处理失败

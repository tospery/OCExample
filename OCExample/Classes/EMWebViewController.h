//
//  EMWebViewController.h
//  MyJLRoutes
//
//  Created by 杨建祥 on 2019/12/29.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import "EMBaseViewController.h"
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EMWebViewController : EMBaseViewController <WKNavigationDelegate, WKUIDelegate>
@property (nonatomic, copy) NSString *urlString;
@property (nonatomic, strong, readonly) WKWebView *webView;

@end

NS_ASSUME_NONNULL_END

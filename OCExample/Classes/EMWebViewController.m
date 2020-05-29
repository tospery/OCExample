//
//  EMWebViewController.m
//  MyJLRoutes
//
//  Created by 杨建祥 on 2019/12/29.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import "EMWebViewController.h"
#import "EMWebViewProgressView.h"
#import "UIView+OCExample.h"
#import "NSURL+OCExample.h"

#define kEMEstimatedProgress          (@"estimatedProgress")

@interface EMWebViewController ()
@property (nonatomic, strong, readwrite) WKWebView *webView;
@property (nonatomic, strong) EMWebViewProgressView *progressView;

@end

@implementation EMWebViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.webView];
    [self.view addSubview:self.progressView];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL jxd_urlWithString:self.urlString] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
    [self.webView loadRequest:request];
}

- (void)dealloc {
    if (_webView) {
        [_webView removeObserver:self forKeyPath:kEMEstimatedProgress];
        _webView.navigationDelegate = nil;
        _webView.UIDelegate = nil;
    }
    _webView = nil;
}

- (WKWebView *)webView {
    if (!_webView) {
        WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
        WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:configuration];
        webView.navigationDelegate = self;
        webView.UIDelegate = self;
        [webView addObserver:self forKeyPath:kEMEstimatedProgress options:NSKeyValueObservingOptionNew context:nil];
        _webView = webView;
    }
    return _webView;
}

- (EMWebViewProgressView *)progressView {
    if (!_progressView) {
        EMWebViewProgressView *progressView = [[EMWebViewProgressView alloc] initWithFrame:CGRectMake(0, 0, self.view.jxd_width, 1.5f)];
        progressView.progressBarView.backgroundColor = [UIColor greenColor];
        progressView.progress = 0.0f;
        _progressView = progressView;
    }
    return _progressView;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:kEMEstimatedProgress]) {
        float progress = self.webView.estimatedProgress;
        if (progress > 0) {
            self.progressView.hidden = NO;
        }
        [self.progressView setProgress:progress animated:YES];
        
        if (self.progressView.progress == 1) {
            __weak typeof(self) weakSelf = self;
            [UIView animateWithDuration:0.25f delay:0.3f options:UIViewAnimationOptionCurveEaseOut animations:^{
                __strong typeof(weakSelf) strongSelf = weakSelf;
                strongSelf.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.4f);
            } completion:^(BOOL finished) {
                __strong typeof(weakSelf) strongSelf = weakSelf;
                strongSelf.progressView.hidden = YES;
            }];
        }
        
        if (self.navigationItem.title.length == 0) {
            __weak typeof(self) weakSelf = self;
            [self.webView evaluateJavaScript:@"document.title" completionHandler:^(NSString *title, NSError *error) {
                __strong typeof(weakSelf) strongSelf = weakSelf;
                strongSelf.navigationItem.title = title;
            }];
        }
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)updateProgress:(CGFloat)progress {
    [self.progressView setProgress:progress animated:YES];
    if (self.navigationItem.title.length == 0) {
        __weak typeof(self) weakSelf = self;
        [self.webView evaluateJavaScript:@"document.title" completionHandler:^(NSString *title, NSError *error) {
            __strong typeof(weakSelf) strongSelf = weakSelf;
            strongSelf.navigationItem.title = title;
        }];
    }
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    decisionHandler(WKNavigationActionPolicyAllow);
}

@end

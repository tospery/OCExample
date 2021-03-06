//
//  EMBaseViewController.h
//  MyJLRoutes
//
//  Created by 杨建祥 on 2019/12/29.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EMBaseViewController : UIViewController
@property (nonatomic, strong, readonly) NSDictionary *params;

- (instancetype)initWithParams:(NSDictionary *)params;

- (void)backItemPressed:(id)sender;

@end

NS_ASSUME_NONNULL_END

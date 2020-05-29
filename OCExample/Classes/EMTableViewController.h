//
//  EMTableViewController.h
//  MyJLRoutes
//
//  Created by 杨建祥 on 2019/12/29.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import "EMBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface EMTableViewController : EMBaseViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *items;

- (Class)cellClass;

@end

NS_ASSUME_NONNULL_END

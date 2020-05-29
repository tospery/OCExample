//
//  HomeViewController.m
//  OCExample_Example
//
//  Created by 杨建祥 on 2019/12/30.
//  Copyright © 2019 tospery. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = [UIApplication sharedApplication].jxd_displayName;
}

- (void)print:(NSDictionary *)params {
    NSLog(@"params: %@", params);
}

@end

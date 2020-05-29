//
//  EMCaseViewController.m
//  MyJLRoutes
//
//  Created by 杨建祥 on 2019/12/29.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import "EMCaseViewController.h"
#import <Mantle/Mantle.h>
#import "EMCase.h"
#import "EMCaseCell.h"
#import "EMWebViewController.h"

@interface EMCaseViewController ()

@end

@implementation EMCaseViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *name = NSStringFromClass([self class]);
    name = [name substringToIndex:name.length - @"ViewController".length];
    if (name.length != 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:path];
        id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        self.items = [MTLJSONAdapter modelsOfClass:EMCase.class fromJSONArray:json error:nil];
    }
}

- (Class)cellClass {
    return [EMCaseCell class];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    EMCase *item = self.items[indexPath.row];
    Class cls = NSClassFromString(item.forward);
    if (cls) {
        EMBaseViewController *vc = [(EMBaseViewController *)[cls alloc] initWithParams:item.params];
        vc.navigationItem.title = item.name;
        [self.navigationController pushViewController:vc animated:YES];
    }else {
        SEL sel = NSSelectorFromString([NSString stringWithFormat:@"%@:", item.forward]);
        if ([self respondsToSelector:sel]) {
            ((void (*)(id, SEL, NSDictionary *))[self methodForSelector:sel])(self, sel, item.params);
        }
    }
}

@end

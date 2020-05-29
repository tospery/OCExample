//
//  UIApplication+OCExample.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/1.
//

#import "UIApplication+OCExample.h"

@implementation UIApplication (OCExample)
- (NSString *)jxd_displayName {
    return [NSBundle.mainBundle.infoDictionary objectForKey:@"CFBundleDisplayName"];
}

@end

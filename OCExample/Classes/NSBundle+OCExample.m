//
//  NSBundle+OCExample.m
//  OCExample
//
//  Created by 杨建祥 on 2019/12/29.
//

#import "NSBundle+OCExample.h"

@implementation NSBundle (OCExample)
+ (NSBundle *)jxd_bundleWithModule:(NSString *)module {
    if (module.length == 0) {
        return [NSBundle mainBundle];
    }
    
    NSString *identifier = [NSString stringWithFormat:@"org.cocoapods.%@", module];
    NSBundle *bundle = [NSBundle bundleWithIdentifier:identifier];
    if (!bundle) {
        return [NSBundle mainBundle];
    }
    
    return bundle;
}

@end

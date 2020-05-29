//
//  UIImage+OCExample.m
//  OCExample
//
//  Created by 杨建祥 on 2019/12/29.
//

#import "UIImage+OCExample.h"
#import "NSBundle+OCExample.h"

@implementation UIImage (OCExample)
+ (UIImage *)jxd_imageInBundle:(NSString *)name {
    if (name.length == 0) {
        return nil;
    }
    
    NSArray *arr = [name componentsSeparatedByString:@"/"];
    if (arr.count != 2) {
        return nil;
    }
    
    NSString *module = arr[0];
    NSString *file = arr[1];
    
    NSBundle *bundle = [NSBundle jxd_bundleWithModule:module];
    bundle = [NSBundle bundleWithPath:[bundle pathForResource:module ofType:@"bundle"]];
    
    return [UIImage imageNamed:file inBundle:bundle compatibleWithTraitCollection:nil];
}

@end

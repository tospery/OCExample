//
//  NSURL+OCExample.m
//  MyJLRoutes
//
//  Created by 杨建祥 on 2019/12/29.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import "NSURL+OCExample.h"
#import "NSString+OCExample.h"

@implementation NSURL (OCExample)
+ (NSURL *)jxd_urlWithString:(NSString *)urlString {
    if (!urlString || ![urlString isKindOfClass:[NSString class]] || !urlString.length) {
        return nil;
    }
    return [NSURL URLWithString:[urlString jxd_urlEncoded]];
}

@end

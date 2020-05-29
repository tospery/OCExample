//
//  EMBaseObject.m
//  MyJLRoutes
//
//  Created by 杨建祥 on 2019/12/29.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import "EMBaseObject.h"

@implementation EMBaseObject
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return [NSDictionary mtl_identityPropertyMapWithModel:self];
}

@end

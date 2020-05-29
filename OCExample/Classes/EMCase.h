//
//  EMCase.h
//  MyJLRoutes
//
//  Created by 杨建祥 on 2019/12/29.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import "EMBaseObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface EMCase : EMBaseObject
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *forward;
@property (nonatomic, copy, readonly) NSDictionary *params;

@end

NS_ASSUME_NONNULL_END

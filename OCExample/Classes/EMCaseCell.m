//
//  EMCaseCell.m
//  MyJLRoutes
//
//  Created by 杨建祥 on 2019/12/29.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import "EMCaseCell.h"
#import "EMCase.h"

@implementation EMCaseCell
- (void)setItem:(EMCase *)item {
    [super setItem:item];
    self.textLabel.text = item.name;
}

@end

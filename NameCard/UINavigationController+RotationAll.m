//
//  UINavigationController+RotationAll.m
//  NameCard
//
//  Created by 巩 鹏军 on 13-12-9.
//  Copyright (c) 2013年 www.GongPengjun.com. All rights reserved.
//

#import "UINavigationController+RotationAll.h"

@implementation UINavigationController (RotationAll)

- (NSUInteger)supportedInterfaceOrientations
{
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"landscape_only_preference"])
        return UIInterfaceOrientationMaskLandscape;
    else
        return UIInterfaceOrientationMaskAll;
}

@end

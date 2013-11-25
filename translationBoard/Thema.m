//
//  Thema.m
//  translationBoard
//
//  Created by Lzt on 13-10-20.
//  Copyright (c) 2013年 Lzt. All rights reserved.
//

#import "Thema.h"

@implementation Thema

+(double)getColumWidth
{
    return [[UIScreen mainScreen] bounds].size.width / 9;
}
+(double)getSeperation
{
    return 5;
}
+(double)getColumHeight
{
    return [[UIScreen mainScreen] bounds].size.height / 5;
}


@end

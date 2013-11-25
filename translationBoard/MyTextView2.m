//
//  MyTextView.m
//  translationBoard
//
//  Created by Lzt on 13-10-11.
//  Copyright (c) 2013年 Lzt. All rights reserved.
//

#import "MyTextView.h"

@implementation MyTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        [self setContentVerticalAlignment:UIControlContentVerticalAlignmentTop];
        [self setBackgroundColor:[UIColor whiteColor]];
        [self setTextAlignment:NSTextAlignmentNatural];
//        [self setBorderStyle:UITextBorderStyleRoundedRect];
        [self setTextColor:[UIColor blackColor]];
        [self setKeyboardType:UIKeyboardTypeASCIICapable];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

//
//  MyTextView.h
//  translationBoard
//
//  Created by Lzt on 13-10-20.
//  Copyright (c) 2013年 Lzt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTextView : UITextView

@property(nonatomic)BOOL isUpOrLeft;
@property(nonatomic,copy)NSString *currentTextName;

@end

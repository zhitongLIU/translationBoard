//
//  SaveNewFileViewController.h
//  translationBoard
//
//  Created by Lzt on 13-11-21.
//  Copyright (c) 2013年 Lzt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTextView.h"
@interface SaveNewFileViewController : UIViewController
{
    NSString * fileName;
    UITextField *textName;
}

@property (nonatomic,retain) MyTextView *textView;

@end

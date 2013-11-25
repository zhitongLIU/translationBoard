//
//  MainViewController.h
//  translationBoard
//
//  Created by Lzt on 13-10-11.
//  Copyright (c) 2013年 Lzt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTextView.h"

@interface MainViewController : UIViewController
{
    MyTextView * textFieldLeft;
    MyTextView * textFieldRight;
    MyTextView * absTextView;
    NSMutableArray * listDeleted;
}
@end

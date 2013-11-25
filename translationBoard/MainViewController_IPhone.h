//
//  MainViewController_IPhone.h
//  translationBoard
//
//  Created by Lzt on 13-10-20.
//  Copyright (c) 2013年 Lzt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTextView.h"
#import "MainViewController.h"
#import "filesTableViewController.h"
#import "SaveNewFileViewController.h"

@interface MainViewController_IPhone : MainViewController<UIActionSheetDelegate>
{
    filesTableViewController *filesTableView;
    UILabel *nameLabelLeft;
    UILabel *nameLabelRight;
    UIView *previousView;
    int nbButton;
}
@end

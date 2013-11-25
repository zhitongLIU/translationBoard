//
//  MainViewController_iPad.h
//  translationBoard
//
//  Created by Lzt on 13-11-21.
//  Copyright (c) 2013年 Lzt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "Thema.h"
#import "filesTableViewController.h"
#import "SaveNewFileViewController.h"
@interface MainViewController_iPad : MainViewController<UIActionSheetDelegate>
{
    filesTableViewController *filesTableView;
    UILabel *nameLabelLeft;
    UILabel *nameLabelRight;
    UIView *previousView;
    int nbButton;
}
@end

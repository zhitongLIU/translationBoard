//
//  filesTableViewController.h
//  translationBoard
//
//  Created by Lzt on 13-11-21.
//  Copyright (c) 2013年 Lzt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTextView.h"
enum useMode
{
    SAVE,
    LOAD,
    DELETE
};

@interface filesTableViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *fileTable;
    BOOL canEdit;
}

@property (nonatomic,retain) NSMutableArray *fileList;
@property (nonatomic,retain) NSString *seletedFileName;
@property (nonatomic,retain) MyTextView *textView;
@property (nonatomic) enum useMode mode;
@property (nonatomic,retain) NSMutableArray * listDeleted;
@end

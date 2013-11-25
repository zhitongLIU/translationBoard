//
//  filesView.m
//  translationBoard
//
//  Created by Lzt on 13-11-21.
//  Copyright (c) 2013年 Lzt. All rights reserved.
//

#import "filesView.h"

@implementation filesView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDir = [documentPaths objectAtIndex:0];
    NSError *error = nil;
    NSArray *fileList = [[NSArray alloc] init];
    fileList = [fileManager contentsOfDirectoryAtPath:documentDir error:&error];
    NSLog(@"%@",fileList);
    
    UITableView * filesTable = [[UITableView alloc] initWithFrame:self.frame style:UITableViewStylePlain];
    

    
    
}


@end

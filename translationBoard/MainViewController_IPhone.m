//
//  MainViewController_IPhone.m
//  translationBoard
//
//  Created by Lzt on 13-10-20.
//  Copyright (c) 2013年 Lzt. All rights reserved.
//

#import "MainViewController_IPhone.h"
#import "Thema.h"
#import "filesTableViewController.h"
@interface MainViewController_IPhone ()

@end

@implementation MainViewController_IPhone

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
    
    // delete which have been deleted
    if ([listDeleted containsObject:textFieldLeft.currentTextName])
    {
        textFieldLeft.currentTextName = @"";
        textFieldLeft.text = @"";
    }
    if ([listDeleted containsObject:textFieldRight.currentTextName])
    {
        textFieldRight.currentTextName = @"";
        textFieldRight.text = @"";
    }
    [listDeleted removeAllObjects];
    
    nameLabelLeft.text = textFieldLeft.currentTextName;
    nameLabelRight.text = textFieldRight.currentTextName;
    [nameLabelLeft setNeedsDisplay];
    [nameLabelRight setNeedsDisplay];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentDir = [documentPaths objectAtIndex:0];
//    NSError *error = nil;
//    NSArray *fileList = [[NSArray alloc] init];
//    fileList = [fileManager contentsOfDirectoryAtPath:documentDir error:&error];
//    NSMutableArray *dirArray = [[NSMutableArray alloc] init];
//    BOOL isDir = NO;
//    for (NSString *file in fileList) {
//        NSString *path = [documentDir stringByAppendingPathComponent:file];
//        [fileManager fileExistsAtPath:path isDirectory:(&isDir)];
//        if (isDir) {
//            [dirArray addObject:file];
//        }
//        isDir = NO;
//    }
//    NSLog(@"%@",fileList);
//    NSLog(@"%@",dirArray);
    
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    listDeleted = [[NSMutableArray alloc] init];
    
    
//    filePath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/file2.txt"];
    
    
    textFieldLeft = [[MyTextView alloc] initWithFrame:CGRectMake([Thema getSeperation],
                                                                 [Thema getColumWidth],
                                                                 [[UIScreen mainScreen] bounds].size.width - 2 *[Thema getSeperation],
                                                                 [Thema getColumHeight])];
//    textFieldLeft.isUpOrLeft = true;
    
    previousView = textFieldLeft;
    
    textFieldRight = [[MyTextView alloc] initWithFrame:CGRectMake([Thema getSeperation],
                                                                  previousView.frame.origin.y + previousView.frame.size.height + [Thema getSeperation],
                                                                  [[UIScreen mainScreen] bounds].size.width - 2 * [Thema getSeperation],
                                                                  [Thema getColumHeight])];
//    textFieldLeft.isUpOrLeft = false;
    
    [self.view addSubview:textFieldLeft];
    [self.view addSubview:textFieldRight];
     //------------------
    nameLabelLeft = [[UILabel alloc] initWithFrame:CGRectMake(textFieldLeft.frame.origin.x,
                                                                       textFieldLeft.frame.origin.y -  0.5 * [Thema getColumWidth],
                                                                       textFieldLeft.frame.size.width,
                                                                       [Thema getColumWidth])];
    nameLabelLeft.textAlignment = NSTextAlignmentRight;
    [nameLabelLeft setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:nameLabelLeft];
    
    nameLabelRight = [[UILabel alloc] initWithFrame:CGRectMake(textFieldRight.frame.origin.x,
                                                                       textFieldRight.frame.origin.y -  0.5 * [Thema getColumWidth],
                                                                       textFieldRight.frame.size.width,
                                                                       [Thema getColumWidth])];
    nameLabelRight.textAlignment = NSTextAlignmentRight;
    [nameLabelRight setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:nameLabelRight];
    
     //------------------
//    UIButton *tmpButton;
    
    UIButton *buttonNew = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonNew setTitle:@"New" forState:UIControlStateNormal];
    [buttonNew.titleLabel setFont:[UIFont systemFontOfSize:10]];
    buttonNew.frame = CGRectMake(textFieldRight.frame.origin.x + 0.5 * [Thema getSeperation],
                                  textFieldRight.frame.origin.y + textFieldRight.bounds.size.height + 3 * [Thema getSeperation],
                                  [Thema getColumHeight] / 2,
                                  [Thema getColumHeight] / 2);
    buttonNew.backgroundColor = [UIColor whiteColor];
    [buttonNew addTarget:self action:@selector(newFile) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonNew];
    previousView = buttonNew;
    
    UIButton *buttonSave = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonSave setTitle:@"Save" forState:UIControlStateNormal];
    [self chaineButton:buttonSave];
    [buttonSave addTarget:self action:@selector(saveFile) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonSaveAs = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonSaveAs setTitle:@"Save as" forState:UIControlStateNormal];
    [self chaineButton:buttonSaveAs];
    [buttonSaveAs addTarget:self action:@selector(saveAsFile) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonLoad = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonLoad.tag = 201;
    [buttonLoad setTitle:@"Load" forState:UIControlStateNormal];
    [self chaineButton:buttonLoad];
    [buttonLoad addTarget:self action:@selector(loadFile) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonSwitch = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonSwitch setTitle:@"Switch" forState:UIControlStateNormal];
    [self chaineButton:buttonSwitch];
    [buttonSwitch addTarget:self action:@selector(swithchText) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonZoomIn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonZoomIn.titleLabel setFont:[UIFont systemFontOfSize:20]];
    buttonZoomIn.backgroundColor = [UIColor whiteColor];
    [buttonZoomIn setTitle:@"+" forState:UIControlStateNormal];
    buttonZoomIn.frame = CGRectMake(textFieldRight.frame.origin.x ,
                                    previousView.frame.origin.y + previousView.frame.size.height + [Thema getSeperation] ,
                                    [[UIScreen mainScreen] bounds].size.width / 2 - 1.5 * [Thema getSeperation],
                                    [Thema getColumHeight] / 2);
    [buttonZoomIn addTarget:self action:@selector(zoomIn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonZoomIn];
    previousView = buttonZoomIn;
    
    
    UIButton *buttonZoomOut = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonZoomOut.titleLabel setFont:[UIFont systemFontOfSize:20]];
    buttonZoomOut.backgroundColor = [UIColor whiteColor];
    [buttonZoomOut setTitle:@"-" forState:UIControlStateNormal];
    buttonZoomOut.frame = CGRectMake(previousView.frame.origin.x + previousView.frame.size.width + [Thema getSeperation],
                                    previousView.frame.origin.y,
                                    [[UIScreen mainScreen] bounds].size.width / 2 - 1.5 * [Thema getSeperation],
                                    [Thema getColumHeight] / 2);
    [buttonZoomOut addTarget:self action:@selector(zoomOut) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonZoomOut];
    previousView = buttonZoomOut;
    
    
    UIButton *buttonDelete = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonDelete.titleLabel setFont:[UIFont systemFontOfSize:10]];
    buttonDelete.backgroundColor = [UIColor whiteColor];
    buttonDelete.frame = CGRectMake(textFieldRight.frame.origin.x,
                                    previousView.frame.origin.y + previousView.frame.size.height + [Thema getSeperation] ,
                                    [[UIScreen mainScreen] bounds].size.width - 2 * [Thema getSeperation],
                                    [Thema getColumHeight] / 2);
    [buttonDelete setTitle:@"Delete" forState:UIControlStateNormal];
    [buttonDelete addTarget:self action:@selector(deleteFile) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonDelete];
}

-(void)zoomIn
{
    [textFieldLeft resignFirstResponder];
    [textFieldRight resignFirstResponder];
    
    if (textFieldLeft.font.pointSize <= 10)
    {
        [textFieldLeft setFont:[UIFont systemFontOfSize:10]];
    }
    if (textFieldRight.font.pointSize <= 10)
    {
        [textFieldRight setFont:[UIFont systemFontOfSize:10]];
    }
    
   
    if (textFieldLeft.font.pointSize < 30 )
    {
        [textFieldLeft setFont:[UIFont systemFontOfSize:textFieldLeft.font.pointSize + 1]];
    }
    if (textFieldRight.font.pointSize < 30 )
    {
        [textFieldRight setFont:[UIFont systemFontOfSize:textFieldLeft.font.pointSize + 1]];
    }
//    [textFieldLeft setFont:[UIFont systemFontOfSize:]];

}

-(void)zoomOut
{
    [textFieldLeft resignFirstResponder];
    [textFieldRight resignFirstResponder];
    
    if (textFieldLeft.font.pointSize <= 10)
    {
        [textFieldLeft setFont:[UIFont systemFontOfSize:10]];
    }
    if (textFieldRight.font.pointSize <= 10)
    {
        [textFieldRight setFont:[UIFont systemFontOfSize:10]];
    }
    
    if (textFieldLeft.font.pointSize <= 30 && textFieldLeft.font.pointSize > 10)
    {
        [textFieldLeft setFont:[UIFont systemFontOfSize:textFieldLeft.font.pointSize - 1]];
    }
    if (textFieldRight.font.pointSize <= 30 && textFieldRight.font.pointSize > 10)
    {
        [textFieldRight setFont:[UIFont systemFontOfSize:textFieldLeft.font.pointSize - 1]];
    }
    
}

-(void)deleteFile
{
//    UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle:@"You want to save as a?" delegate:self cancelButtonTitle:@"cancel" destructiveButtonTitle:Nil otherButtonTitles:@"New file",@"File exited", nil] ;
//    actionSheet.tag = 802;
//    [actionSheet showInView:self.view];
    filesTableView = [[filesTableViewController alloc] init];
    filesTableView.mode = DELETE;
    filesTableView.listDeleted = listDeleted;
    [self.navigationController pushViewController:filesTableView animated:YES];
}

-(void)chaineButton:(UIButton *)btn
{
    [btn.titleLabel setFont:[UIFont systemFontOfSize:10]];
    btn.frame = CGRectMake(previousView.frame.origin.x + previousView.frame.size.width + [Thema getSeperation],
                           previousView.frame.origin.y,
                           [Thema getColumHeight] / 2,
                           [Thema getColumHeight] / 2);
    btn.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:btn];
    previousView =  btn;
}

-(void)pleaseSelectAText
{
    UIAlertView * alert=[[UIAlertView alloc] initWithTitle:@"Attention" message:@"You have to selete one of the text field!" delegate:self cancelButtonTitle:@"Cancle" otherButtonTitles:@"Ok", nil] ;
    //    alert.delegate=self;
    [alert show];
}

-(void)newFile
{
    if ([textFieldLeft isFirstResponder] || [textFieldRight isFirstResponder])
    {
        NSString *absFileName;
        if ([textFieldLeft isFirstResponder])
        {
            absTextView = textFieldLeft;
            absFileName = textFieldLeft.currentTextName;
        }
        if ([textFieldRight isFirstResponder])
        {
            absTextView = textFieldRight;
            absFileName = textFieldRight.currentTextName;
        }
        
        if (![absFileName isEqualToString:@""] || ![absTextView.text isEqualToString:@""])
        {
            UIAlertView * alert=[[UIAlertView alloc] initWithTitle:@"Attention New file" message:@"If you do this you will destory the text now!" delegate:self cancelButtonTitle:@"Cancle" otherButtonTitles:@"Continue", nil] ;
            alert.tag = 901;
            //    alert.delegate=self;
            [alert show];
        }
    }
}


-(void)saveFile
{
    if ([textFieldLeft isFirstResponder] || [textFieldRight isFirstResponder])
    {
        NSString *absFileName;
        if ([textFieldLeft isFirstResponder])
        {
            absTextView = textFieldLeft;
            absFileName = textFieldLeft.currentTextName;
        }
        if ([textFieldRight isFirstResponder])
        {
            absTextView = textFieldRight;
            absFileName = textFieldRight.currentTextName;
        }
        [textFieldLeft resignFirstResponder];
        [textFieldRight resignFirstResponder];
        
        if ([absFileName  isEqual: @""])
        {
            [self showSaveAsActionSheet];
        }
        else
        {
            NSString *filePath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@.txt",absFileName];
            [absTextView.text writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:NULL];
            absTextView.currentTextName = absFileName;
            UIAlertView * alertSucceed=[[UIAlertView alloc] initWithTitle:@"Succeed" message:@"You have saved your text!" delegate:self cancelButtonTitle:Nil otherButtonTitles:@"Ok", nil] ;
            alertSucceed.tag = 902;
            //    alert.delegate=self;
            [alertSucceed show];
        }
    }
    else
    {
        [self pleaseSelectAText];
    }
}


-(void)showSaveAsActionSheet
{
    UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle:@"You want to save as a?" delegate:self cancelButtonTitle:@"cancel" destructiveButtonTitle:Nil otherButtonTitles:@"New file",@"File exited", nil] ;
    [actionSheet showInView:self.view];
    actionSheet.tag = 801;
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"actionSheet click %ld",(long)buttonIndex);
    if (actionSheet.tag == 801)
    {
        if (buttonIndex == 0)
        {
            SaveNewFileViewController *saveVC = [[SaveNewFileViewController alloc] init];
            saveVC.textView = absTextView;
            [self.navigationController pushViewController:saveVC animated:YES];
        }
        if (buttonIndex == 1)
        {
            filesTableView = [[filesTableViewController alloc] init];
            filesTableView.mode = SAVE;
            filesTableView.textView = absTextView;
            [self.navigationController pushViewController:filesTableView animated:YES];
        }
    }
}

-(void)saveAsFile
{
    if ([textFieldLeft isFirstResponder] || [textFieldRight isFirstResponder])
    {
        if ([textFieldLeft isFirstResponder])
        {
            absTextView = textFieldLeft;
        }
        if ([textFieldRight isFirstResponder])
        {
            absTextView = textFieldRight;
        }
        [textFieldLeft resignFirstResponder];
        [textFieldRight resignFirstResponder];
        [self showSaveAsActionSheet];
    }
    else
    {
        [self pleaseSelectAText];
    }
}

-(void)loadFile
{
    if ([textFieldLeft isFirstResponder] || [textFieldRight isFirstResponder])
    {
        
        if ([textFieldLeft isFirstResponder])
        {
            absTextView = textFieldLeft;
        }
        if ([textFieldRight isFirstResponder])
        {
            absTextView = textFieldRight;
        }
        [textFieldLeft resignFirstResponder];
        [textFieldRight resignFirstResponder];
        filesTableView = [[filesTableViewController alloc] init];
        filesTableView.mode = LOAD;
        filesTableView.textView = absTextView;
        
        if (![absTextView.text  isEqual: @""])
        {
            UIAlertView * alert=[[UIAlertView alloc] initWithTitle:@"Attention" message:@"If you do this you will destory the text now!" delegate:self cancelButtonTitle:@"Cancle" otherButtonTitles:@"Continue", nil] ;
            alert.tag = 903;
            //    alert.delegate=self;
            [alert show];
        }
        else
        {
            [self.navigationController pushViewController:filesTableView animated:YES];
        }
    }
    else
    {
        [self pleaseSelectAText];
    }
    //    [self.navigationController pushViewController:filesTableView animated:YES];
//    textFieldLeft.text = [NSString stringWithContentsOfFile:filesTableView.seletedFileName encoding:NSUTF8StringEncoding error:NULL];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
//    NSLog(@"alertView %ld",(long)buttonIndex);
    if (alertView.tag == 901)//new
    {
        if (buttonIndex == 1)
        {
            if ([textFieldLeft isFirstResponder])
            {
                textFieldLeft.currentTextName = @"";
                textFieldLeft.text = @"";
                [textFieldLeft resignFirstResponder];
                nameLabelLeft.text = textFieldLeft.currentTextName;
                [nameLabelLeft setNeedsDisplay];
            }
            if ([textFieldRight isFirstResponder])
            {
                textFieldRight.currentTextName = @"";
                textFieldRight.text = @"";
                [textFieldRight resignFirstResponder];
                nameLabelRight.text = textFieldRight.currentTextName;
                [nameLabelRight setNeedsDisplay];
            }
        }
    }
    
    if (alertView.tag == 903) // load
    {
        if (buttonIndex == 1)
        {
            [self.navigationController pushViewController:filesTableView animated:YES];
        }
    }
}

-(void)swithchText
{
    [textFieldLeft resignFirstResponder];
    [textFieldRight resignFirstResponder];
    
    
    NSString *tempoString = textFieldLeft.text;
    textFieldLeft.text = textFieldRight.text;
    textFieldRight.text = tempoString;
    
    tempoString = nameLabelLeft.text;
    nameLabelLeft.text = nameLabelRight.text;
    nameLabelRight.text = tempoString;
    
    tempoString = textFieldLeft.currentTextName;
    textFieldLeft.currentTextName = textFieldRight.currentTextName;
    textFieldRight.currentTextName = tempoString;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

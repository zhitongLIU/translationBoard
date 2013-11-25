//
//  SaveNewFileViewController.m
//  translationBoard
//
//  Created by Lzt on 13-11-21.
//  Copyright (c) 2013年 Lzt. All rights reserved.
//

#import "SaveNewFileViewController.h"
#import "Thema.h"
@interface SaveNewFileViewController ()

@end

@implementation SaveNewFileViewController
@synthesize textView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Naming";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.navigationController.navigationBar setHidden:NO];
    
    
    [self.view setBackgroundColor:[UIColor grayColor]];
    UILabel *textNameLable = [[UILabel alloc] initWithFrame:CGRectMake(self.view.center.x - 2.5 * [Thema getColumWidth],
                                                                       self.view.center.y - 3 * [Thema getColumWidth],
                                                                       5 * [Thema getColumWidth], [Thema getColumWidth])];
    textNameLable.text = @"Save as";
    textNameLable.textAlignment = NSTextAlignmentCenter;
    textNameLable.textColor = [UIColor cyanColor];
    [self.view addSubview:textNameLable];
    
    textName = [[UITextField alloc] initWithFrame:CGRectMake(self.view.center.x - 2.5 * [Thema getColumWidth],
                                                                          self.view.center.y - 2 * [Thema getColumWidth],
                                                                          5 * [Thema getColumWidth], [Thema getColumWidth])];
    [textName setBackgroundColor:[UIColor whiteColor]];
//    textName.center = self.view.center;
    [self.view addSubview:textName];
    
    UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    saveButton.frame = CGRectMake(textName.frame.origin.x + 1 * [Thema getColumWidth],
                                  textName.frame.origin.y + textName.bounds.size.height + [Thema getSeperation],
                                  3 * [Thema getColumWidth],
                                  [Thema getColumWidth]);
    
    saveButton.backgroundColor = [UIColor whiteColor];
    [saveButton setTitle:@"SAVE" forState:UIControlStateNormal];
    [saveButton addTarget:self action:@selector(saveAs) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveButton];
}

-(void)saveAs
{
    fileName = textName.text;
    if ([fileName isEqualToString:@""])
    {
        UIAlertView * alertNoName = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"You haven't given a name to this file!" delegate:self cancelButtonTitle:Nil otherButtonTitles:@"Ok", nil] ;
        [alertNoName show];
    }
    else
    {
        NSString *filePath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@.txt",fileName];
        [textView.text writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:NULL];
        textView.currentTextName = fileName;
        
        UIAlertView * alertSucceed=[[UIAlertView alloc] initWithTitle:@"Succeed" message:@"You have saved your text!" delegate:self cancelButtonTitle:Nil otherButtonTitles:@"Ok", nil] ;
        alertSucceed.tag = 901;
        //    alert.delegate=self;
        [alertSucceed show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //    NSLog(@"alertView %ld",(long)buttonIndex);
    if (buttonIndex == 0 && alertView.tag == 901)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

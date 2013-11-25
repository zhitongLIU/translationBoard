//
//  MainViewController.m
//  translationBoard
//
//  Created by Lzt on 13-10-11.
//  Copyright (c) 2013年 Lzt. All rights reserved.
//

#import "MainViewController.h"

#import "Thema.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [textFieldLeft resignFirstResponder];
    [textFieldRight resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

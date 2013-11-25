//
//  filesTableViewController.m
//  translationBoard
//
//  Created by Lzt on 13-11-21.
//  Copyright (c) 2013年 Lzt. All rights reserved.
//

#import "filesTableViewController.h"
@interface filesTableViewController ()

@end

@implementation filesTableViewController
@synthesize fileList;
@synthesize seletedFileName;
@synthesize textView;
@synthesize listDeleted;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.title = @"Selete file";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.navigationController.navigationBar setHidden:NO];
    
    //读取有那些文件
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDir = [documentPaths objectAtIndex:0];
    NSError *error = nil;
    fileList = [[NSMutableArray alloc] init];
    fileList = (NSMutableArray *)[fileManager contentsOfDirectoryAtPath:documentDir error:&error];
    
    fileTable = [[UITableView alloc] initWithFrame:[self.view bounds] style:UITableViewStyleGrouped];
    fileTable.dataSource = self;
    fileTable.delegate = self;
    [self.view addSubview:fileTable];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [fileList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSString * filesName = [fileList objectAtIndex:indexPath.row];
    cell.textLabel.text = filesName;
    cell.textLabel.font = [UIFont fontWithName:filesName size:14];
    //    cell.textLabel.text = self.listArray[indexPath.row];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    seletedFileName = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@",(NSString*)[fileList objectAtIndex:indexPath.row]];
    
    if (self.mode == LOAD)
    {
        canEdit = NO;
        textView.text = [NSString stringWithContentsOfFile:seletedFileName encoding:NSUTF8StringEncoding error:NULL];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    if (self.mode == SAVE)
    {
        canEdit = NO;
        [textView.text writeToFile:seletedFileName atomically:YES encoding:NSUTF8StringEncoding error:NULL];
        UIAlertView * alertSucceed=[[UIAlertView alloc] initWithTitle:@"Succeed" message:@"You have saved your text!" delegate:self cancelButtonTitle:Nil otherButtonTitles:@"Ok", nil] ;
        alertSucceed.tag = 901;
        //    alert.delegate=self;
        [alertSucceed show];
    }
    if (self.mode == DELETE)
    {

        canEdit = YES;
        
    }
    
    textView.currentTextName = [(NSString*)[fileList objectAtIndex:indexPath.row] stringByDeletingPathExtension];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"alertView %ld",(long)buttonIndex);
    if (buttonIndex == 0 && alertView.tag == 901)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
//    if (buttonIndex == 1 && alertView.tag == 902)
//    {
//        UIAlertView * alertSucceed=[[UIAlertView alloc] initWithTitle:@"Deleted" message:@"You have Deleted the text!" delegate:self cancelButtonTitle:Nil otherButtonTitles:@"Ok", nil] ;
//        alertSucceed.tag = 901;
//        //    alert.delegate=self;
//        [alertSucceed show];
//    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return canEdit;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
//        UIAlertView * alertSure=[[UIAlertView alloc] initWithTitle:@"Attention" message:[NSString stringWithFormat:@"Are you sure to delete %@?",(NSString*)[fileList objectAtIndex:indexPath.row]] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil] ;
//        alertSure.tag = 902;
//        //    alert.delegate=self;
//        [alertSure show];
        seletedFileName = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@",(NSString*)[fileList objectAtIndex:indexPath.row]];
        NSLog(@"seletedFileName %@",seletedFileName);
        [listDeleted addObject:[(NSString*)[fileList objectAtIndex:indexPath.row] stringByDeletingPathExtension]];
        NSLog(@"%@",listDeleted);
        if (textView.currentTextName == [(NSString*)[fileList objectAtIndex:indexPath.row] stringByDeletingPathExtension])
        {
            textView.currentTextName = @"";
            textView.text = @"";
        }
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSError *error = nil;
        [fileManager removeItemAtPath:seletedFileName error:&error];
        
        [fileList removeObjectAtIndex:indexPath.row];
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        NSLog(@"%@",listDeleted);
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return @"left slipe to delete";
//}

@end

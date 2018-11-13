//
//  TableViewController.m
//  movielist
//
//  Created by Omer Cohen on 11/11/18.
//  Copyright © 2018 Omer Cohen. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "AppDelegate.h"
#import "UIImageView+WebCache.h"
#import "SDImageCache.h"
#import "PreViewController.h"

@interface TableViewController (){
    AppDelegate *appDelegateTable;
    NSManagedObjectContext *contextTable;
}

@end

UIImageView *imageView;
NSString *image;
NSArray *moviesJSONN;

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //get context
    appDelegateTable = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    contextTable = appDelegateTable.persistentContainer.viewContext;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

}

- (void)viewDidAppear:(BOOL)animated{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Data"];
    moviesJSONN = [[contextTable executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    
    [self.tableView reloadData];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [moviesJSONN count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customCell" forIndexPath:indexPath];
    
    
    cell.textLabel.text = moviesJSONN.description;
    
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"UpdateDevice"])
    {
        NSManagedObject *selectedDevice = [moviesJSONN objectAtIndex:[[self.tableView indexPathForSelectedRow]row]];
        PreViewController *destViewController = segue.destinationViewController;
        NSLog(selectedDevice.description);
        
        destViewController.device = selectedDevice;
    }
}


@end

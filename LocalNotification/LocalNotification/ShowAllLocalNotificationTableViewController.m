//
//  ShowAllLocalNotificationTableViewController.m
//  LocalNotification
//
//  Created by 蘇健豪1 on 2014/11/25.
//  Copyright (c) 2014年 蘇健豪. All rights reserved.
//

#import "ShowAllLocalNotificationTableViewController.h"

@interface ShowAllLocalNotificationTableViewController ()

@property (strong, nonatomic) NSArray *allOfTheLocalNotification;

@end

@implementation ShowAllLocalNotificationTableViewController

@synthesize allOfTheLocalNotification;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIApplication *application = [UIApplication sharedApplication];
    allOfTheLocalNotification = [application scheduledLocalNotifications];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [allOfTheLocalNotification count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    UILocalNotification *localNotification = allOfTheLocalNotification[indexPath.row];
    cell.textLabel.text = localNotification.alertBody;
    

    if (indexPath.row % 2) {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", localNotification.fireDate];
    } else {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"HH:mm"];
        cell.detailTextLabel.text = [formatter stringFromDate:localNotification.fireDate];
    }
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        for (NSInteger i = 0 ; i < [allOfTheLocalNotification count] ; i++ )
        {
            UILocalNotification *localNotification = allOfTheLocalNotification[i];
            
            if (i == indexPath.row) {
                UIApplication *application = [UIApplication sharedApplication];
                [application cancelLocalNotification:localNotification];
                allOfTheLocalNotification = [application scheduledLocalNotifications];  //重新載入資料
                break;
            }
        }
        
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


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

@end

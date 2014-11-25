//
//  SetLocalNotificationViewController.m
//  LocalNotification
//
//  Created by 蘇健豪1 on 2014/11/25.
//  Copyright (c) 2014年 蘇健豪. All rights reserved.
//

#import "SetLocalNotificationViewController.h"

#import "SetLocalNotification.h"

@interface SetLocalNotificationViewController ()

@property (nonatomic, strong) SetLocalNotification *localNotification;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UISwitch *switchControl;

@end

@implementation SetLocalNotificationViewController

- (SetLocalNotification *)localNotification
{
    if (!_localNotification) {
        _localNotification = [[SetLocalNotification alloc] init];
    }
    return _localNotification;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    [self.localNotification setLocalNotificationWithMessage:self.textField.text
                                                   fireDate:self.datePicker.date
                                                repeatOrNot:self.switchControl.on
                                                      Sound:UILocalNotificationDefaultSoundName
                                                        key:nil forValue:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

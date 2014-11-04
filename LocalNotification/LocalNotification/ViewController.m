//
//  ViewController.m
//  LocalNotification
//
//  Created by 蘇健豪1 on 2014/11/4.
//  Copyright (c) 2014年 蘇健豪. All rights reserved.
//

#import "ViewController.h"

#import "SetLocalNotification.h"

@interface ViewController ()

@property (nonatomic, strong) SetLocalNotification *localNotification;

@end

@implementation ViewController

@synthesize localNotification = _localNotification;

- (SetLocalNotification *)localNotification
{
    if (!_localNotification) {
        _localNotification = [[SetLocalNotification alloc] init];
    }
    return _localNotification;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setLocalNotification:(id)sender {
    [self.localNotification setLocalNotificationWithMessage:@"message"
                                                   fireDate:[NSDate dateWithTimeIntervalSinceNow:10]
                                                repeatOrNot:NO
                                                      Sound:UILocalNotificationDefaultSoundName
                                                        key:nil forValue:nil];
}

@end

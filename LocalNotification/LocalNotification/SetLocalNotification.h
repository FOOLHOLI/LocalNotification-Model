//
//  SetLocalNotification.h
//  LocalNotification
//
//  Created by 蘇健豪1 on 2014/11/4.
//  Copyright (c) 2014年 蘇健豪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SetLocalNotification : NSObject

- (void)setLocalNotificationWithMessage:(NSString *)message fireDate:(NSDate *)fireDate repeatOrNot:(BOOL)repeat Sound:(NSString *)sound key:(NSString *)key forValue:(id)value;

@end

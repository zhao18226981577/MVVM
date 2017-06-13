//
//  SignTicketAndTimer.m
//  StudyLife
//
//  Created by wl-ios.admin on 16/9/12.
//  Copyright © 2016年 wl-ios.admin. All rights reserved.
//

#import "SignTicketAndTimer.h"

@implementation SignTicketAndTimer
+(NSString *)getTransTime{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate *datenow = [NSDate date];
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    
    return timeSp;
}
+(NSString *)getSign{
    
    NSString *Signstr=[NSString stringWithFormat:@"access_id=%@timestamp=%@",@"Ai_1512301111",[SignTicketAndTimer getTransTime]];
    
    NSString *sing=[Tools md5EncryptWithContent:Signstr];
    
    return sing;
}
@end

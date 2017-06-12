//
//  Tools.h
//  MVVM
//
//  Created by 精智 on 17/6/12.
//  Copyright © 2017年 精智. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Tools : NSObject

//json数据格式转字典
+ (id)toNSDictionary:(NSData *)jsonData;
+ (NSString *)toJSONData:(id)theData;

//十六进制色值转换
+ (UIColor *) colorWithHexString: (NSString *)color;

//判断是否是手机号
+ (BOOL)isMobileNumber:(NSString *)mobileNum;

//时间戳转换
+ (NSString *)timeFormatted:(int)totalSeconds;

//MD5转换
+(NSString *)md5EncryptWithContent:(NSString *)content;

//显示信息
+(void)show:(NSString *)message ToView:(UIView*)view operation:(Operation)operate;
@end

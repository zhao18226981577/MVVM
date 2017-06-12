//
//  NetworkRequest.h
//  MVVM
//
//  Created by 精智 on 17/6/12.
//  Copyright © 2017年 精智. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkRequest : NSObject

/**
 请求
 @param url   请求地址
 @param parameters   请求参数
 @param get   请求方式 (yes：get方法 no：post方法)
 @param success   请求成功回调
 @param failed   请求失败回调
 */
+ (void)requestWithUrl:(NSString *)url
            parameters:(NSDictionary *)parameters
                 isGet:(BOOL)get
               success:(SuccessBlock)success
                failed:(FailedBlock)failed;

/**
 计算固定宽度的文本显示高度
 @param text 文本
 @param width 显示宽度
 @param fontSize 显示字体
 @return 文本显示高度
 */
+ (CGFloat)calculateTextHeight:(NSString *)text
                     width:(CGFloat) width
                      font:(CGFloat) fontSize;
@end

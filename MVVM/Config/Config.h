//
//  Config.h
//  MVVM
//
//  Created by 精智 on 17/6/12.
//  Copyright © 2017年 精智. All rights reserved.
//

#ifndef Config_h
#define Config_h

typedef void (^SuccessBlock) (id result);
typedef void (^FailedBlock) (id reason);
typedef void (^Operation) ();

/**
 *
 *网络请求地址
 *
 */
//服务器地址
#define SERVER_KEY          @"http://v2.jzapi.xuechulai.com/Services/"

#define URL_MACRO(p) [NSString stringWithFormat:@"%@%@",SERVER_KEY,p]


//获取系统版本
#define IOS_VERSION ([[[UIDevice currentDevice] systemVersion] floatValue])
//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
//颜色
#define RGBA_COLOR(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]
#define RGB_COLOR(R, G, B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]





#define URL_Study  @"KechengService.svc/HuoquKecheng"  //获取课程


#endif /* Config_h */

//
//  NetworkRequest.m
//  MVVM
//
//  Created by 精智 on 17/6/12.
//  Copyright © 2017年 精智. All rights reserved.
//

#import "NetworkRequest.h"
#import "SignTicketAndTimer.h"
@implementation NetworkRequest

+ (void)requestWithUrl:(NSString *)url parameters:(NSDictionary *)parameters isGet:(BOOL)get success:(SuccessBlock)success failed:(FailedBlock)failed{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", nil];
    [manager.requestSerializer setValue:[SignTicketAndTimer getTransTime] forHTTPHeaderField:@"timestamp"];
    [manager.requestSerializer setValue:[SignTicketAndTimer getSign] forHTTPHeaderField:@"sign"];
    NSString *ticket;
    ticket = @"";
    [manager.requestSerializer setValue:ticket forHTTPHeaderField:@"ticket"];
    manager.requestSerializer.timeoutInterval = 30.0f;
    if (get) {
        [manager GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failed(error.localizedDescription);
        }];
    }else{
        [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failed(error.localizedDescription);
        }];
    }
}
+ (CGFloat)calculateTextHeight:(NSString *)text
                         width:(CGFloat) width
                          font:(CGFloat) fontSize{
    if (text.length <= 0) {
        return 0;
    }
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:text];
    NSRange allRange = [text rangeOfString:text];
    [attrStr addAttribute:NSFontAttributeName
                    value:[UIFont systemFontOfSize:fontSize]
                    range:allRange];
    CGFloat titleHeight;
    NSStringDrawingOptions options =  NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect = [attrStr boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - width, CGFLOAT_MAX)
                                        options:options
                                        context:nil];
    titleHeight = ceilf(rect.size.height);
    return titleHeight;
}
@end

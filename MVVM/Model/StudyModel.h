//
//  StudyModel.h
//  MVVM
//
//  Created by 精智 on 17/6/12.
//  Copyright © 2017年 精智. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StudyModel : NSObject
@property(nonatomic,strong) NSString *CImgPath;
@property(nonatomic,strong) NSString *Title;
@property(nonatomic,strong) NSString *GradeName;
+(NSMutableArray *)parse:(NSArray *)responsObj;
@end

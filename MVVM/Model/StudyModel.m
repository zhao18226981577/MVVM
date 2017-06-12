//
//  StudyModel.m
//  MVVM
//
//  Created by 精智 on 17/6/12.
//  Copyright © 2017年 精智. All rights reserved.
//

#import "StudyModel.h"

@implementation StudyModel
+(NSMutableArray *)parse:(NSArray *)responsObj{
    NSMutableArray *arr=[NSMutableArray new];
    for (NSDictionary *dic in responsObj) {
        StudyModel *model=[StudyModel mj_objectWithKeyValues:dic];
        [arr addObject:model];
    }
    return arr;
}
@end

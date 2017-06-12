//
//  StudyViewModel.m
//  MVVM
//
//  Created by 精智 on 17/6/12.
//  Copyright © 2017年 精智. All rights reserved.
//

#import "StudyViewModel.h"
#import "StudyDetailViewController.h"
#import "StudyModel.h"
@implementation StudyViewModel

/**
 获取列表
 
 @prama index   获取列表第几页
 */
- (void)getStudyList:(int)index{
    [NetworkRequest requestWithUrl:URL_MACRO(URL_Study) parameters:@{@"sousuo":@"",
                     @"nianji":@(0),
                     @"kemu":@(0),
                     @"pagesize":@(10),
                     @"pageindex":@(index)
                     } isGet:YES success:^(id result) {
                         [self fetchValueWithArray:result];
                        } failed:^(id reason) {
                            self.errorBlock(@"加载失败");
                        }];
}

/**
 *
 *解析数据
 *
 */

-(void)fetchValueWithArray:(NSArray *)arr{
    NSArray *studyArr = [StudyModel parse:arr];
    self.resultBlock(studyArr);
}

/**
 跳转详情页
 
 @param studyModel   传入的模型
 @param superController   所在页面
 */
- (void)studyDetailWithStudyModel:(StudyModel *)studyModel
                WithViewController:(UIViewController *)superController{
    StudyDetailViewController *detailController = [[StudyDetailViewController alloc] init];
//    detailController.studyModel = studyModel;
    [superController.navigationController pushViewController:detailController animated:YES];
}

@end

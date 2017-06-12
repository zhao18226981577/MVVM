//
//  StudyViewModel.h
//  MVVM
//
//  Created by 精智 on 17/6/12.
//  Copyright © 2017年 精智. All rights reserved.
//

#import "BaseViewModel.h"
#import "StudyModel.h"
@interface StudyViewModel : BaseViewModel
/**
 获取列表
 
 @prama index   获取列表第几页
 */
- (void)getStudyList:(int)index;


/**
 跳转详情页
 
 @param studyModel   传入的模型
 @param superController   所在页面
 */
- (void)studyDetailWithStudyModel:(StudyModel *)studyModel
                 WithViewController:(UIViewController *)superController;

@end

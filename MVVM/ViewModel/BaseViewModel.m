//
//  BaseViewModel.m
//  MVVM
//
//  Created by 精智 on 17/6/12.
//  Copyright © 2017年 精智. All rights reserved.
//

#import "BaseViewModel.h"

@interface ViewModelClass : NSObject

@end

@implementation BaseViewModel
#pragma 接收传过来的block
- (void)setBlockWithReturnBlock: (SuccessBlock) resultBlock
                 WithErrorBlock: (FailedBlock) errorBlock
{
    _resultBlock = resultBlock;
    _errorBlock = errorBlock;
}
@end

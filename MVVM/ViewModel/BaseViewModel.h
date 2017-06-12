//
//  BaseViewModel.h
//  MVVM
//
//  Created by 精智 on 17/6/12.
//  Copyright © 2017年 精智. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseViewModel : NSObject
@property (strong, nonatomic) SuccessBlock resultBlock;
@property (strong, nonatomic) FailedBlock errorBlock;

// 传入交互的Block块
- (void)setBlockWithReturnBlock: (SuccessBlock) resultBlock
                 WithErrorBlock: (FailedBlock) errorBlock;
@end

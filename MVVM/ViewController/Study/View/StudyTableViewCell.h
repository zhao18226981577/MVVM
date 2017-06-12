//
//  StudyTableViewCell.h
//  MVVM
//
//  Created by 精智 on 17/6/12.
//  Copyright © 2017年 精智. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudyModel.h"
@interface StudyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *StudyImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property(nonatomic, strong) StudyModel *model;
@end

//
//  StudyTableViewCell.m
//  MVVM
//
//  Created by 精智 on 17/6/12.
//  Copyright © 2017年 精智. All rights reserved.
//

#import "StudyTableViewCell.h"

@implementation StudyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.StudyImageView.clipsToBounds = YES;
}
-(void)setModel:(StudyModel *)model{
    [self.StudyImageView sd_setImageWithURL:[NSURL URLWithString:model.CImgPath]];
    self.titleLabel.text = model.Title;
    self.infoLabel.text = model.GradeName;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

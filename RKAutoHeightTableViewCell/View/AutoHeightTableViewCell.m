//
//  AutoHeightTableViewCell.m
//  RKAutoHeightTableViewCell
//
//  Created by mac on 21/08/18.
//  Copyright © 2018 Rathakrishnan. All rights reserved.
//

#import "AutoHeightTableViewCell.h"

@implementation AutoHeightTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configureView];
    }
    return self;
}

- (void)configureView {
    
    
    CGFloat iconViewWidth = 36.0;
    
    self.iconView = [UIButton buttonWithType:UIButtonTypeCustom];
    self.iconView.layer.cornerRadius = iconViewWidth / 2.0;
    self.iconView.clipsToBounds = YES;
    [self.iconView setImage:[UIImage imageNamed:@"icon"] forState:UIControlStateNormal];
    [self.contentView addSubview:self.iconView];

    UIView *view = [[UIView alloc] init];
    
    self.titleLbl = [[UILabel alloc] init];
    self.titleLbl.font = [UIFont systemFontOfSize:13.0];
    self.titleLbl.textColor = [UIColor blackColor];
    self.titleLbl.text = @"Title";
    [view addSubview:self.titleLbl];
    
    self.timeLbl = [[UILabel alloc] init];
    self.timeLbl.font = [UIFont systemFontOfSize:12.0];
    self.timeLbl.textColor = [UIColor grayColor];
    self.timeLbl.text = @"2018-08-21";
    [view addSubview:self.timeLbl];
    
    [self.contentView addSubview:view];
    
    self.contentLbl = [[UILabel alloc] init];
    self.contentLbl.numberOfLines = 0;
    self.contentLbl.font = [UIFont systemFontOfSize:15.0];
    self.contentLbl.textColor = [UIColor blackColor];
    [self.contentView addSubview:self.contentLbl];
    
    
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        // 步骤3：设置头像的约束，最重要的思想是：给头像的top与contentView.mas_top之间建立约束
        make.top.equalTo(self.contentView.mas_top).offset(27.0);
        // 设置size与leading（left）的约束，不解释
        make.size.mas_equalTo(CGSizeMake(iconViewWidth, iconViewWidth));
        make.leading.equalTo(self.contentView.mas_leading).offset(20.0);
    }];
    
    // titleLbl与timeLbl也是使用了自动撑开的思想
    [self.titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.top.equalTo(view);
    }];
    
    [self.timeLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-10);
        make.top.equalTo(self.titleLbl).offset(3.0);
        make.bottom.equalTo(view.mas_bottom);
    }];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.iconView.mas_trailing).offset(10.0);
        make.trailing.lessThanOrEqualTo(self.contentView.mas_trailing).offset(-10.0);
        make.centerY.equalTo(self.iconView.mas_centerY);
    }];
    
    [self.contentLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        // 步骤4:设置评论的top与头像的bottom之间的约束
        make.top.equalTo(self.iconView.mas_bottom).offset(15.0);
        // 步骤5：设置评论的bottom与contentView.mas_bottom之间的约束
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-25.0);
        make.leading.equalTo(self.iconView.mas_leading);
        make.trailing.equalTo(self.contentView.mas_trailing).offset(-20.0);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end

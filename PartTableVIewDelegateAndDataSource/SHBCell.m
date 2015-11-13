//
//  SHBCell.m
//  PartTableVIewDelegateAndDataSource
//
//  Created by 沈红榜 on 15/11/13.
//  Copyright © 2015年 沈红榜. All rights reserved.
//

#import "SHBCell.h"

@implementation SHBCell {
    UILabel         *_label;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
        _label.translatesAutoresizingMaskIntoConstraints = false;
        _label.font = [UIFont systemFontOfSize:25];
        _label.textColor = [UIColor redColor];
        _label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_label];
        
        NSDictionary *views = NSDictionaryOfVariableBindings(_label);
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_label]|" options:0 metrics:nil views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_label]|" options:0 metrics:nil views:views]];
    }
    return self;
}

- (void)configCell:(NSString *)title {
    _label.text = title;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  ChildIHastemCell.m
//  Demo
//
//  Created by srj on 2018/5/30.
//  Copyright © 2018年 srj. All rights reserved.
//

#import "ChildIHastemCell.h"
@implementation ChildIHastemCellItem
+ (instancetype)createData:(NSString *)strData boolData:(BOOL)boolData
{
    ChildIHastemCellItem *item = [ChildIHastemCellItem new];
    item.strData = strData;
    item.boolData = boolData;
    return item;
}
@end
@interface ChildIHastemCell()
@property (strong, nonatomic) UILabel *lineLbl;
@property (strong, nonatomic) UILabel *nameLbl;

@end
@implementation ChildIHastemCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        [self createUI];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (void)createUI
{
    [self addSubview:self.lineLbl];
    [self addSubview:self.nameLbl];

}
- (void)setItem:(ChildIHastemCellItem *)item
{
    _item = item;
    [self loadUI];
}

- (void)loadUI
{
    NSLog(@"%@",self.item.strData);
    self.nameLbl.text = self.item.strData;
    self.lineLbl.hidden = self.item.boolData;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.lineLbl setFrame:CGRectMake(0, self.frame.size.height-1, CGRectGetWidth([[UIScreen mainScreen] bounds]), 1)];
    [self.nameLbl setFrame:CGRectMake(16, 0, CGRectGetWidth([[UIScreen mainScreen] bounds]), self.frame.size.height)];
}

+ (CGFloat)cellHeight:(NSDictionary *)data
{
    ChildIHastemCellItem *item = data[QLCellDataItemKey];
    if (item.boolData){
        return 80;
    }
    return 44;
}

- (UILabel *)nameLbl
{
    if (!_nameLbl){
        _nameLbl = [[UILabel alloc] init];
        _nameLbl.font = [UIFont systemFontOfSize:15];
        _nameLbl.textColor = [UIColor blueColor];
    }
    return _nameLbl;
}
- (UILabel *)lineLbl
{
    if (!_lineLbl){
        _lineLbl = [[UILabel alloc] init];
        _lineLbl.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.12];
    }
    return _lineLbl;
}
@end

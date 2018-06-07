//
//  ChildNoXibCell.m
//  Demo
//
//  Created by srj on 2018/5/30.
//  Copyright © 2018年 srj. All rights reserved.
//

#import "ChildNoXibCell.h"
@implementation ChildNoXibCellItem
+ (instancetype)createUserVO:(UserVO *)userVO
{
    ChildNoXibCellItem *item = [ChildNoXibCellItem new];
    item.userVO = userVO;
    return item;
}
@end


@interface ChildNoXibCell()
@property (strong, nonatomic) UIImageView *imgIV;
@property (strong,nonatomic) UIButton *btn;

@end

@implementation ChildNoXibCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        [self createUI];
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        self.contentView.backgroundColor = [UIColor blueColor];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)createUI
{
    [self addSubview:self.imgIV];
    [self addSubview:self.btn];
}

- (void)setItem:(ChildNoXibCellItem *)item
{
    _item = item;
    [self loadUI];
}

- (void)loadUI
{
    [self.btn setTitle:self.item.userVO.name forState:UIControlStateNormal];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.imgIV setFrame:CGRectMake(0, 0, CGRectGetWidth([[UIScreen mainScreen] bounds]), 100)];
    [self.btn setFrame:CGRectMake(10, 10, 300, 30)];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)btnAction
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"按钮触发" message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
}

- (UIImageView *)imgIV
{
    if (!_imgIV){
        _imgIV = [[UIImageView alloc] init];
        _imgIV.image = [UIImage imageNamed:@"bg_title"];
    }
    return _imgIV;
}

- (UIButton *)btn
{
    if (!_btn){
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn setTitle:@"点击" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_btn setBackgroundColor:[UIColor redColor]];
        [_btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}
+ (CGFloat)cellHeight:(NSDictionary *)data
{
    return 100;
}
@end

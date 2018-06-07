//
//  DZChild1XibCell.m
//  Demo
//
//  Created by srj on 17/2/24.
//  Copyright © 2017年 srj. All rights reserved.
//

#import "DZChild1XibCell.h"
@implementation DZChild1XibCellItem
+ (instancetype)createTitle:(NSString *)title
{
    DZChild1XibCellItem *item = [DZChild1XibCellItem new];
    item.height = 300;
    item.title = title;
    return item;
}
@end
@interface DZChild1XibCell()
@property (strong, nonatomic) IBOutlet UILabel *lbl;

@end

@implementation DZChild1XibCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setItem:(DZChild1XibCellItem *)item
{
    _item = item;
    [self loadUI];
}

- (void)loadUI
{
    self.lbl.text = self.item.title;
    self.item.height = 30;
}

- (CGFloat)cellHeight{
    return self.item.height;
}
@end

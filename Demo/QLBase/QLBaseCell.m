//
//  QLBaseCell.m
//  creditcenter_ios
//
//  Created by nodrift on 17/2/24.
//  Copyright © 2018年 qianli. All rights reserved.
//

#import "QLBaseCell.h"

NSString *const QLCellDataItemKey        = @"item";

static NSInteger kBaseCellNormalHeight = 44;

@implementation QLCellData
+ (instancetype)createWithCellClass:(Class)class data:(NSDictionary *)data{
    QLCellData * cd = [QLCellData new];
    cd.cellId = NSStringFromClass([class class]);
    cd.data = data;
    return cd;
}
@end

@implementation QLBaseCell
- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

+ (CGFloat)cellHeight:(NSDictionary *)data;
{
    return kBaseCellNormalHeight;
}

@end

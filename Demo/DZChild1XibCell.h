//
//  DZChild1XibCell.h
//  Demo
//
//  Created by srj on 17/2/24.
//  Copyright © 2017年 srj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YVBaseCell.h"

@interface DZChild1XibCellItem : DZCellItem
+ (instancetype)createTitle:(NSString *)title;
@property (nonatomic,strong)NSString *title;

@end
@interface DZChild1XibCell : YVBaseCell
@property (nonatomic,strong)DZChild1XibCellItem *item;
@end

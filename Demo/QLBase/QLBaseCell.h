//
//  QLBaseCell.h
//  creditcenter_ios
//
//  Created by nodrift on 17/2/24.
//  Copyright © 2018年 qianli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QLBaseCellProtocol.h"

#define RegistClass(x,y) [x registerClass:y forCellReuseIdentifier:(NSStringFromClass(y))];


extern NSString *const QLCellDataItemKey;

@class QLBaseCell;

@interface QLCellData : NSObject
+ (instancetype)createWithCellClass:(Class)cell data:(NSDictionary *)data;
@property (nonatomic,copy  ) NSString * cellId;
@property (nonatomic,strong) NSDictionary *data;
@end

@interface QLBaseCell : UITableViewCell<QLBaseCellProtocol>

@end

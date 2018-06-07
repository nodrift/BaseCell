//
//  ChildIHastemCell.h
//  Demo
//
//  Created by srj on 2018/5/30.
//  Copyright © 2018年 srj. All rights reserved.
//

#import "QLBaseCell.h"
@interface ChildIHastemCellItem : NSObject
+ (instancetype)createData:(NSString *)strData boolData:(BOOL)boolData;
@property (nonatomic,strong) NSString *strData;
@property (nonatomic,assign) BOOL boolData;
@end

@interface ChildIHastemCell : QLBaseCell
@property (nonatomic, strong) ChildIHastemCellItem *item; //对象名必须为item
@end

//
//  ChildNoXibCell.h
//  Demo
//
//  Created by srj on 2018/5/30.
//  Copyright © 2018年 srj. All rights reserved.
//

#import "QLBaseCell.h"
#import "UserVO.h"

@interface ChildNoXibCellItem : NSObject
+ (instancetype)createUserVO:(UserVO *)userVO;
@property (nonatomic,strong) UserVO *userVO;
@end

@interface ChildNoXibCell : QLBaseCell
@property (nonatomic,strong) ChildNoXibCellItem *item;
@end

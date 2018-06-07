//
//  DZChildXibCell.h
//  Demo
//
//  Created by srj on 17/2/24.
//  Copyright © 2017年 srj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YVBaseCell.h"

@protocol DZChildXibCellDelegate <NSObject>
- (void)show;
@end

@interface DZChildXibCell : YVBaseCell
@property (nonatomic, weak) id <DZChildXibCellDelegate> delegate;
@end

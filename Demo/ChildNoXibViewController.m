//
//  ChildNoXibViewController.m
//  Demo
//
//  Created by srj on 2018/5/30.
//  Copyright © 2018年 srj. All rights reserved.
//

#import "ChildNoXibViewController.h"
#import "ChildNoXibCell.h"
#import "ChildIHastemCell.h"

@interface ChildNoXibViewController ()
@property (nonatomic,strong) ChildIHastemCellItem *oneItem;
@end

@implementation ChildNoXibViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createData];
}

- (void)registCells
{
    [super registCells];
    RegistClass(self.rootTableView, [ChildNoXibCell class]);
    RegistClass(self.rootTableView, [ChildIHastemCell class]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)createData
{
    UserVO *userVO = [[UserVO alloc] init];
    userVO.name = @"这个是名字文案,而不是点击文案";
    [self.cellData addObject:[QLCellData createWithCellClass:[ChildNoXibCell class] data:@{QLCellDataItemKey:[ChildNoXibCellItem createUserVO:userVO]}]];
    
    BOOL isBottom = NO;
    for (int i=0;i<100;i++){
        NSString *content = [NSString stringWithFormat:@"str%d",i];
        if (i == 99){
            isBottom = YES;
            content = @"最底层没有分割线";
        }
        if (i == 50){
            [self.cellData addObject:[QLCellData createWithCellClass:[ChildIHastemCell class] data:@{QLCellDataItemKey:self.oneItem}]];
        }else {
            [self.cellData addObject:[QLCellData createWithCellClass:[ChildIHastemCell class] data:@{QLCellDataItemKey:[ChildIHastemCellItem createData:content boolData:isBottom]}]];
        }
        if (i ==10){
            [self.cellData addObject:[QLCellData createWithCellClass:[ChildNoXibCell class] data:@{}]];
        }
    }
    
//    随意删除cell
    //中间删除了十个cell
    [self.cellData removeObjectsInRange:NSMakeRange(10, 10)];
    [self.rootTableView reloadData];
}

- (ChildIHastemCellItem *)oneItem
{
    if (!_oneItem){
        _oneItem = [ChildIHastemCellItem createData:@"这是特殊的一个cell" boolData:NO];
    }
    return _oneItem;
}
@end

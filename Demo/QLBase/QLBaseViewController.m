//
//  QLBaseViewController.m
//  creditcenter_ios
//
//  Created by nodrift on 17/2/24.
//  Copyright © 2018年 qianli. All rights reserved.
//

#import "QLBaseViewController.h"

@interface QLBaseViewController ()<UITableViewDelegate,UITableViewDataSource>
@end

@implementation QLBaseViewController
#pragma mark - View Init
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.rootTableView];
    
    [self cellData];
    [self registCells];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Override
- (void)registCells
{
    //存放公共的cells
}
#pragma mark - UITableView Delegate And Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellData.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QLCellData * cellData = [self.cellData objectAtIndex:indexPath.row];
    Class cellClass = NSClassFromString(cellData.cellId);
    if ([cellClass conformsToProtocol:@protocol(QLBaseCellProtocol)]) {
        Class <QLBaseCellProtocol> protocol = cellClass;
        return [protocol cellHeight:cellData.data];
    }else {
        return 0;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QLCellData * rowItem = [self.cellData objectAtIndex:indexPath.row];
    QLBaseCell * cell = [tableView dequeueReusableCellWithIdentifier:rowItem.cellId];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self fillCell:cell data:rowItem];
    return cell;
}
- (void)fillCell:(UITableViewCell *)cell data:(QLCellData *)rowObj {
    for (NSString * keyPath in rowObj.data.allKeys) {
        if(keyPath.length == 0){continue;}
        [cell setValue:rowObj.data[keyPath] forKeyPath:keyPath];
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark - Getter And Setter
- (NSMutableArray *)cellData
{
    if (!_cellData){
        _cellData = [NSMutableArray new];
    }
    return _cellData;
}
- (UITableView *)rootTableView
{
    if (!_rootTableView){
        _rootTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _rootTableView.delegate = self;
        _rootTableView.dataSource = self;
        _rootTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_rootTableView setFrame:CGRectMake(0, 0, CGRectGetWidth([[UIScreen mainScreen] bounds]), CGRectGetHeight([[UIScreen mainScreen] bounds]))];
        _rootTableView.backgroundColor = [UIColor colorWithRed:1 green:2 blue:2 alpha:1];
    }
    return _rootTableView;
}

@end

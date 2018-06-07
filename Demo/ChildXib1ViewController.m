//
//  ChildXib1ViewController.m
//  Demo
//
//  Created by srj on 17/2/24.
//  Copyright © 2017年 srj. All rights reserved.
//

#import "ChildXib1ViewController.h"
#import "DZChild1XibCell.h"

@interface ChildXib1ViewController ()
@property (nonatomic,strong) DZChild1XibCellItem *cellItem;
@end

@implementation ChildXib1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i=0;i<300;i++){
        [self.cellData addObject:[DZCellData createWithCellId:@"DZChild1XibCell" data:@{@"Item":[DZChild1XibCellItem createTitle:@"123"]}]];
        [self.cellData addObject:[DZCellData createWithCellId:@"DZChild1XibCell" data:@{@"Item":[DZChild1XibCellItem createTitle:@"234"]}]];
        [self.cellData addObject:[DZCellData createWithCellId:@"DZChild1XibCell" data:@{@"Item":[DZChild1XibCellItem createTitle:@"444"]}]];
        [self.cellData addObject:[DZCellData createWithCellId:@"DZChildXibCell" data:@{}]];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.cellData = nil;
        [self cellData];
        [self.cellData addObject:[DZCellData createWithCellId:@"DZChildXibCell" data:@{}]];
        [self.cellData addObject:[DZCellData createWithCellId:@"DZChild1XibCell" data:@{@"Item":self.cellItem}]];
        [self.cellData addObject:[DZCellData createWithCellId:@"DZChildXibCell" data:@{}]];

        [self.cellData addObject:[DZCellData createWithCellId:@"DZChild1XibCell" data:@{@"Item":[DZChild1XibCellItem createTitle:@"33333333"]}]];
        [self.cellData addObject:[DZCellData createWithCellId:@"DZChild1XibCell" data:@{@"Item":[DZChild1XibCellItem createTitle:@"444"]}]];
        [self.cellData addObject:[DZCellData createWithCellId:@"DZChildXibCell" data:@{}]];
        [self.rootTableView reloadData];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.cellItem.title = @"改变了我";
            [self.rootTableView reloadData];
        });
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)registCells
{
    [self.rootTableView registerNib:[UINib nibWithNibName:@"DZChild1XibCell" bundle:nil] forCellReuseIdentifier:@"DZChild1XibCell"];
    [self.rootTableView registerNib:[UINib nibWithNibName:@"DZChildXibCell" bundle:nil] forCellReuseIdentifier:@"DZChildXibCell"];
}

- (DZChild1XibCellItem *)cellItem
{
    if (!_cellItem){
        _cellItem = [DZChild1XibCellItem createTitle:@"1"];
    }
    return _cellItem;
}
@end

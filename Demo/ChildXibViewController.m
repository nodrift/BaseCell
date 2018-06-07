//
//  ChildXibViewController.m
//  Demo
//
//  Created by srj on 17/2/24.
//  Copyright © 2017年 srj. All rights reserved.
//

#import "ChildXibViewController.h"
#import "DZChildXibCell.h"
#import "ChildXib1ViewController.h"

@interface ChildXibViewController ()<DZChildXibCellDelegate>

@end

@implementation ChildXibViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.cellData addObject:[DZCellData createWithCellId:@"DZChildXibCell" data:@{}]];
//    [self.rootTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)registCells
{
    [self.rootTableView registerNib:[UINib nibWithNibName:@"DZChildXibCell" bundle:nil] forCellReuseIdentifier:@"DZChildXibCell"];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    if ([cell isKindOfClass:[DZChildXibCell class]]){
        ((DZChildXibCell *)cell).delegate = self;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    ChildXib1ViewController *vc = [[ChildXib1ViewController alloc] initWithNibName:@"ChildXib1ViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)show
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"hha" message:@"sdf" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [alert show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [alert dismissWithClickedButtonIndex:-1 animated:YES];
    });
}

@end

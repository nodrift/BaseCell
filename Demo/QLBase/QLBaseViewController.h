//
//  QLBaseViewController.h
//  creditcenter_ios
//
//  Created by nodrift on 17/2/24.
//  Copyright © 2018年 qianli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QLBaseCell.h"
#import "QLBaseCellProtocol.h"

#define RegistNIB(view, class)  [view registerNib:[UINib nibWithNibName:(NSStringFromClass(class)) bundle:nil] forCellReuseIdentifier:(NSStringFromClass(class))];

#define RegistClass(view,class) [view registerClass:class forCellReuseIdentifier:(NSStringFromClass(class))];

/*
 * cellData 对应于tableView里的CellId+Data cellId寻址于相关派生类的Cell对象 Data之于Model
 */
@interface QLBaseViewController : UIViewController
@property (strong, nonatomic) UITableView *rootTableView;
@property (strong, nonatomic) NSMutableArray *cellData;
//注册cell
- (void)registCells;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end

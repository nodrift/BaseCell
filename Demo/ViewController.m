//
//  ViewController.m
//  Demo
//
//  Created by srj on 17/2/24.
//  Copyright © 2017年 srj. All rights reserved.
//

#import "ViewController.h"
#import "ChildNoXibViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupBtn];
}

- (void)setupBtn
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(0, 100, 200, 100)];
    [btn addTarget:self action:@selector(gotoVC:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"点我" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)gotoVC:(id)sender
{
    ChildNoXibViewController *vc = [[ChildNoXibViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}
@end

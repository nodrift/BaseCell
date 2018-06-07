//
//  DZChildXibCell.m
//  Demo
//
//  Created by srj on 17/2/24.
//  Copyright © 2017年 srj. All rights reserved.
//

#import "DZChildXibCell.h"

@implementation DZChildXibCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (IBAction)click:(id)sender {
    if(self.delegate){
        [self.delegate show];
    }
}
@end

//
//  MZSecondViewController.m
//  MZRouter
//
//  Created by 李风 on 2020/8/4.
//  Copyright © 2020 mengzhu.com. All rights reserved.
//

#import "MZSecondViewController.h"

@interface MZSecondViewController ()

@end

@implementation MZSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    self.navigationItem.title = @"Second";
    
    if (self.getUserBlock) {
        self.getUserBlock(self.userId);
    }
}

@end

//
//  MZFirstViewController.m
//  MZRouter
//
//  Created by 李风 on 2020/8/4.
//  Copyright © 2020 mengzhu.com. All rights reserved.
//

#import "MZFirstViewController.h"

@interface MZFirstViewController ()

@end

@implementation MZFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.title = @"First";
    
    if (self.returnBlock) {
        self.returnBlock([NSString stringWithFormat:@"First block - %@",self.name]);
    }
}

@end

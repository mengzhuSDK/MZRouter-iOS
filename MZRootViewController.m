//
//  MZRootViewController.m
//  MZRouter
//
//  Created by 李风 on 2020/8/4.
//  Copyright © 2020 mengzhu.com. All rights reserved.
//

#import "MZRootViewController.h"
#import "MZRouter.h"
#import "MZGlobalModuleConst.h"

@interface MZRootViewController ()

@end

@implementation MZRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setTitle:@"第一种注册跳转" forState:UIControlStateNormal];
    button1.frame = CGRectMake(15, 100, self.view.frame.size.width - 30, 44.0);
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button1 setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:button1];
    [button1 addTarget:self action:@selector(button1Click) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setTitle:@"第二种注册跳转" forState:UIControlStateNormal];
    button2.frame = CGRectMake(15, 200, self.view.frame.size.width - 30, 44.0);
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:button2];
    [button2 addTarget:self action:@selector(button2Click) forControlEvents:UIControlEventTouchUpInside];
}

- (void)button1Click {

    [MZRouter openURL:MZRootFirst withUserInfo:@{MZRouterParameterViewController:self,MZRouterParameterBlock:^(id data){
        NSLog(@"data = %@",data);
    },@"name":@"first name",} completion:^(id result) {
        NSLog(@"跳转完毕");
    }];
}

- (void)button2Click {
    UIViewController *vc = [MZRouter objectForURL:MZRootSecond withUserInfo:@{MZRouterParameterViewController:self,MZRouterParameterBlock:^(NSString *userId){
            NSLog(@"userId = %@",userId);
    },@"userId":@"lifeng"}];
    [self.navigationController pushViewController:vc animated:YES];
}

@end

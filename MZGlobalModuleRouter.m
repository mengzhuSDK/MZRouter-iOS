//
//  MZGlobalModuleRouter.m
//  MZRouter
//
//  Created by 李风 on 2020/8/4.
//  Copyright © 2020 mengzhu.com. All rights reserved.
//

#import "MZGlobalModuleRouter.h"
#import "MZRouter.h"
#import "MZGlobalModuleConst.h"

#import "MZFirstViewController.h"
#import "MZSecondViewController.h"

@implementation MZGlobalModuleRouter

+ (void)load {
    
    // 第一种注册方式
    [MZRouter registerURLPattern:MZRootFirst toHandler:^(NSDictionary *routerParameters) {
        
        UIViewController *viewController = routerParameters[MZRouterParameterUserInfo][MZRouterParameterViewController];
        
        void(^block)(id data) = routerParameters[MZRouterParameterUserInfo][MZRouterParameterBlock];
        
        NSString *name = routerParameters[MZRouterParameterUserInfo][@"name"];
        
        MZFirstViewController *vc = [[MZFirstViewController alloc] init];
        if (block) vc.returnBlock = block;
        if (name) vc.name = name;

        if (viewController.navigationController) {
            [viewController.navigationController pushViewController:vc animated:YES];
        } else {
            [viewController presentViewController:vc animated:YES completion:nil];
        }
    }];
    
    
    // 第二种注册方式，注册保存ViewController，可使用[MGJRouter objectForURL:@"MZ://login/another"]获取ViewController
    [MZRouter registerURLPattern:MZRootSecond toObjectHandler:^id(NSDictionary *routerParameters) {
        
        void(^block)(NSString *message) = routerParameters[MZRouterParameterUserInfo][MZRouterParameterBlock];
        NSString *userId = routerParameters[MZRouterParameterUserInfo][@"userId"];

        MZSecondViewController *vc = [[MZSecondViewController alloc] init];
        if (block) vc.getUserBlock = block;
        if (userId) vc.userId = userId;

        return vc;
    }];
}

@end

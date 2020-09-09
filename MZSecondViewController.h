//
//  MZSecondViewController.h
//  MZRouter
//
//  Created by 李风 on 2020/8/4.
//  Copyright © 2020 mengzhu.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^GetUserIdBlock)(NSString *message);

@interface MZSecondViewController : UIViewController

@property (nonatomic, copy) GetUserIdBlock getUserBlock;

@property (nonatomic, copy) NSString *userId;

@end

NS_ASSUME_NONNULL_END

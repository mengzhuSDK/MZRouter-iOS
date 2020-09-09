//
//  MZFirstViewController.h
//  MZRouter
//
//  Created by 李风 on 2020/8/4.
//  Copyright © 2020 mengzhu.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ReturnBlock)(id data);

@interface MZFirstViewController : UIViewController

@property (nonatomic, copy) ReturnBlock returnBlock;

@property (nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END

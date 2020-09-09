//
//  MZRouter.h
//
//  Created by 李风 on 2020/8/4.
//  Copyright © 2020 盟主. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString *const MZRouterParameterViewController;//传递的viewController参数的key
extern NSString *const MZRouterParameterNavigationController;//传递的navigationController参数的key
extern NSString *const MZRouterParameterBlock;//传递的回调block的key
/**
 * 这3个定义的 string 用于跳转的时候传递的参数的key
 */

extern NSString *const MZRouterParameterURL;
extern NSString *const MZRouterParameterCompletion;
extern NSString *const MZRouterParameterUserInfo;

/**
 *  routerParameters 里内置的几个参数会用到上面定义的 string
 */
typedef void (^MZRouterHandler)(NSDictionary *routerParameters);

/**
 *  需要返回一个 object，配合 objectForURL: 使用
 */
typedef id _Nullable (^MZRouterObjectHandler)(NSDictionary *routerParameters);

@interface MZRouter : NSObject

/**
 *  注册 URLPattern 对应的 Handler，在 handler 中可以初始化 VC，然后对 VC 做各种操作
 *
 *  @param URLPattern 带上 scheme，如 mz://beauty/:id
 *  @param handler    该 block 会传一个字典，包含了注册的 URL 中对应的变量。
 *                    假如注册的 URL 为 mz://beauty/:id 那么，就会传一个 @{@"id": 4} 这样的字典过来
 */
+ (void)registerURLPattern:(NSString *)URLPattern toHandler:(MZRouterHandler)handler;

/**
 *  注册 URLPattern 对应的 ObjectHandler，需要返回一个 object 给调用方
 *
 *  @param URLPattern 带上 scheme，如 mz://beauty/:id
 *  @param handler    该 block 会传一个字典，包含了注册的 URL 中对应的变量。
 *                    假如注册的 URL 为 mz://beauty/:id 那么，就会传一个 @{@"id": 4} 这样的字典过来
 *                    自带的 key 为 @"url" 和 @"completion" (如果有的话)
 */
+ (void)registerURLPattern:(NSString *)URLPattern toObjectHandler:(MZRouterObjectHandler)handler;

/**
 *  取消注册某个 URL Pattern
 *
 *  @param URLPattern URLPattern
 */
+ (void)deregisterURLPattern:(NSString *)URLPattern;

/**
 *  打开此 URL
 *  会在已注册的 URL -> Handler 中寻找，如果找到，则执行 Handler
 *
 *  @param URL 带 Scheme，如 mz://beauty/3
 */
+ (void)openURL:(NSString *)URL;

/**
 *  打开此 URL，同时当操作完成时，执行额外的代码
 *
 *  @param URL        带 Scheme 的 URL，如 mz://beauty/4
 *  @param completion URL 处理完成后的 callback，完成的判定跟具体的业务相关
 */
+ (void)openURL:(NSString *)URL completion:(void (^)(id result))completion;

/**
 *  打开此 URL，带上附加信息，同时当操作完成时，执行额外的代码
 *
 *  @param URL        带 Scheme 的 URL，如 mz://beauty/4
 *  @param userInfo 附加参数
 *  @param completion URL 处理完成后的 callback，完成的判定跟具体的业务相关
 */
+ (void)openURL:(NSString *)URL withUserInfo:(NSDictionary * _Nullable)userInfo completion:(void (^)(id result))completion;

/**
 * 查找谁对某个 URL 感兴趣，如果有的话，返回一个 object
 *
 *  @param URL 带 Scheme，如 mz://beauty/3
 */
+ (id)objectForURL:(NSString *)URL;

/**
 * 查找谁对某个 URL 感兴趣，如果有的话，返回一个 object
 *
 *  @param URL 带 Scheme，如 mz://beauty/3
 *  @param userInfo 附加参数
 */
+ (id)objectForURL:(NSString *)URL withUserInfo:(NSDictionary * _Nullable)userInfo;

/**
 *  是否可以打开URL
 *
 *  @param URL 带 Scheme，如 mz://beauty/3
 *
 *  @return 返回BOOL值
 */
+ (BOOL)canOpenURL:(NSString *)URL;
+ (BOOL)canOpenURL:(NSString *)URL matchExactly:(BOOL)exactly;

/**
 *  调用此方法来拼接 urlpattern 和 parameters
 *
 *  #define MZ_ROUTE_BEAUTY @"beauty/:id"
 *  [MZRouter generateURLWithPattern:MZ_ROUTE_BEAUTY, @[@13]];
 *
 *
 *  @param pattern    url pattern 比如 @"beauty/:id"
 *  @param parameters 一个数组，数量要跟 pattern 里的变量一致
 *
 *  @return 返回生成的URL String
 */
+ (NSString *)generateURLWithPattern:(NSString *)pattern parameters:(NSArray *)parameters;

@end

NS_ASSUME_NONNULL_END

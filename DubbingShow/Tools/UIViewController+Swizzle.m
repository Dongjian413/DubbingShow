//
//  UIViewController+Swizzle.m
//  Coding_iOS
//
//  Created by 王 原闯 on 14-8-1.
//  Copyright (c) 2014年 Coding. All rights reserved.
//

#import "UIViewController+Swizzle.h"
#import "ObjcRuntime.h"
#import "RDVTabBarController.h"


@implementation UIViewController (Swizzle)
- (void)customViewDidAppear:(BOOL)animated{
    if ([NSStringFromClass([self class]) rangeOfString:@"_RootViewController"].location != NSNotFound) {
        [self.rdv_tabBarController setTabBarHidden:NO animated:YES];
        // 禁用 iOS7 返回手势
        if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
            self.navigationController.interactivePopGestureRecognizer.enabled = NO;
        }

    }
    [self customViewDidAppear:animated];
    
}

- (void)customViewWillDisappear:(BOOL)animated{
    [self customViewWillDisappear:animated];
    
}

- (void)customviewWillAppear:(BOOL)animated{
    if ([[self.navigationController childViewControllers] count] > 1) {
        [self.rdv_tabBarController setTabBarHidden:YES animated:YES];
    }
    //    返回按钮
    if (!self.navigationItem.leftBarButtonItem && self.navigationController.viewControllers.count > 1) {
        self.navigationItem.leftBarButtonItems = [self backButton];
    }
    [self customviewWillAppear:animated];
}

#pragma mark BackBtn M
- (NSArray *)backButton{
    UIView *view = [[UIView alloc] init];
    view.size = CGSizeMake(44.0, 44.0);
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [view addSubview:backBtn];
    backBtn.size = CGSizeMake(40, 40);
    [backBtn setImage:[UIImage imageNamed:@"all_back_white"] forState:UIControlStateNormal];
    backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 10.0, 0, 0);
    [backBtn addTarget:self action:@selector(goBack_Swizzle) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:view];
    
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -15.0;
    return @[negativeSpacer,back];
}

- (void)goBack_Swizzle
{
    [self.navigationController popViewControllerAnimated:YES];
}

+ (void)load{
    swizzleAllViewController();
}
@end

void swizzleAllViewController()
{
    Swizzle([UIViewController class], @selector(viewDidAppear:), @selector(customViewDidAppear:));
    Swizzle([UIViewController class], @selector(viewWillDisappear:), @selector(customViewWillDisappear:));
    Swizzle([UIViewController class], @selector(viewWillAppear:), @selector(customviewWillAppear:));
}

//
//  LYGuideController.m
//  700du
//
//  Created by liuyan on 17/2/23.
//  Copyright © 2017年 liuyan. All rights reserved.
//

#import "LYGuideController.h"
#import "DSTabBarController.h"
#import "AppDelegate.h"

@interface LYGuideController ()<UIApplicationDelegate>

@property (nonatomic, strong)UIScrollView *scrollView;

@end

@implementation LYGuideController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self scrollerView];
    self.view.backgroundColor = kTableBackColor;
}

-(void)scrollerView
{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    // 开启分页
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    // 隐藏滑动条
    _scrollView.showsHorizontalScrollIndicator = NO;
    // 可滚动区域
    _scrollView.contentSize = CGSizeMake(3 * kScreenWidth, kScreenHeight);
    for (int i = 0;  i < 3; i++) {
        
        // 创建背景图
        UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(i*kScreenWidth, 0, kScreenWidth, kScreenHeight)];
        imageView1.userInteractionEnabled = YES;
        imageView1.image = [UIImage imageNamed:(kDevice_Is_iPhone4) ? [NSString stringWithFormat:@"guide-4-0%d.jpg",i+1] : [NSString stringWithFormat:@"guide-6-0%d.jpg",i+1]];
        [_scrollView addSubview:imageView1];
        
        if (i == 2) {
            UIButton *experienceButton = [UIButton buttonWithType:UIButtonTypeCustom];
            experienceButton.frame = (kDevice_Is_iPhone4) ? CGRectMake(kScreenWidth * 0.3, kScreenHeight - kAdaptScreen(25.0) - 30 , kScreenWidth * 0.4, 30): CGRectMake(kScreenWidth * 0.3, kScreenHeight - kAdaptScreen(30.0) - 38 , kScreenWidth * 0.4, 38);
            [experienceButton setBackgroundImage:[UIImage imageNamed:@"guidebottom"] forState:UIControlStateNormal];
            [experienceButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
            [imageView1 addSubview:experienceButton];
        }
        
        
    }
    [self.view addSubview:_scrollView];
}

- (void)clickButton:(UIButton *)btn
{
    DSTabBarController *rootVC = [[DSTabBarController alloc] init];
    rootVC.edgesForExtendedLayout = UIRectEdgeNone;
    rootVC.tabBar.translucent = YES;
    rootVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:rootVC animated:YES completion:^{
        [kKeyWindow setRootViewController:rootVC];
    }];
}



@end

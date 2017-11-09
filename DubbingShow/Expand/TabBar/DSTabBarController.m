//
//  DSTabBarController.m
//  DubbingShow
//
//  Created by vicki753-mac on 08/11/2017.
//  Copyright © 2017 liuyan. All rights reserved.
//

#import "DSTabBarController.h"
#import "LYHomePageController.h"
#import "LYAttentionController.h"
#import "LYCircleController.h"
#import "LYPersonCenterController.h"
#import "DSTabBar.h"
#import "DSTabBarItem.h"

@interface DSTabBarController ()<DSTabBarDelegate>

@end

@implementation DSTabBarController

-(instancetype)init{
    if (self = [super init]) {
         [self setupTabBarViewController];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)setupTabBarViewController{
    
    
    LYHomePageController *homeViewController = [[LYHomePageController alloc] init];
    UINavigationController *homeNavController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    LYAttentionController *attentionViewController = [[LYAttentionController alloc] init];
    UINavigationController *attentionNavController = [[UINavigationController alloc] initWithRootViewController:attentionViewController];
    LYCircleController *circleViewController = [[LYCircleController alloc] init];
    UINavigationController *circleNavController = [[UINavigationController alloc] initWithRootViewController:circleViewController];
    LYPersonCenterController *personCenterViewController = [[LYPersonCenterController alloc] init];
    UINavigationController *personCenterNavController = [[UINavigationController alloc] initWithRootViewController:personCenterViewController];
    
    self.viewControllers = @[homeNavController, attentionNavController, circleNavController, personCenterNavController];
    
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    DSTabBar *tabBar = [[DSTabBar alloc] initWithFrame:self.tabBar.bounds andTabBarItems:
                        @[@{DSTabBarItemTitle:@"首页",
                            DSTabBarItemNormalImageName:@"tabbar_firstpage_button_normal",
                            DSTabBarItemSelectedImageName:@"tabbar_firstpage_button_selected",
                            DSTabBarType:@(DSTabBarItemModeNormal)},
                          @{DSTabBarItemTitle:@"关注",
                            DSTabBarItemNormalImageName:@"attention_tabbar_button_normal",
                            DSTabBarItemSelectedImageName:@"attention_tabbar_button_selected",
                            DSTabBarType:@(DSTabBarItemModeNormal)},
                          @{DSTabBarItemTitle:@"",
                            DSTabBarItemNormalImageName:@"tabbar_addmore_button_normal",
                            DSTabBarItemSelectedImageName:@"tabbar_addmore_button_selected",
                            DSTabBarType:@(DSTabBarItemModeNormal)},
                          @{DSTabBarItemTitle:@"圈子",
                            DSTabBarItemNormalImageName:@"circle_tabbar_button_normal",
                            DSTabBarItemSelectedImageName:@"circle_tabbar_button_selected",
                            DSTabBarType:@(DSTabBarItemModeNormal)},
                          @{DSTabBarItemTitle:@"我的",
                            DSTabBarItemNormalImageName:@"mine_tabbar_button_normal",
                            DSTabBarItemSelectedImageName:@"mine_tabbar_button_selected",
                            DSTabBarType:@(DSTabBarItemModeNormal)}] andCenterIndex:2];
    tabBar.delegate = self;
    [self.tabBar addSubview:tabBar];
    
  
    
}

#pragma mark - DSTabBarDelegate
-(void)tabBarDidSelectedRiseButton{
    NSLog(@"get this one now");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

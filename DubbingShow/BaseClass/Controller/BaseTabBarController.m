//
//  BaseTabBarController.m
//  suishenbaodian
//
//  Created by fire on 15/11/26.
//  Copyright © 2015年 MY. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
#import "RDVTabBarItem.h"
#import "LYHomePageController.h"
#import "LYAttentionController.h"
#import "LYCircleController.h"
#import "LYPersonCenterController.h"

@interface BaseTabBarController ()<RDVTabBarControllerDelegate>
/**
 *  点击的tabbar的索引(0 ~ 3)
 */
@property (nonatomic, assign) NSInteger indexClicked;
@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self setupViewControllers];
}

#pragma mark Private_M
- (void)setupViewControllers {
    LYHomePageController *homeVC = [[LYHomePageController alloc] init];
    UINavigationController *homeNavi = [[BaseNavigationController alloc] initWithRootViewController:homeVC];
    
    LYAttentionController *attentionVC = [[LYAttentionController alloc] init];
    UINavigationController *attentionNavi = [[BaseNavigationController alloc] initWithRootViewController:attentionVC];
    
    
    
    LYCircleController *circkeVC = [[LYCircleController alloc] init];
    UINavigationController *circleNavi = [[BaseNavigationController alloc] initWithRootViewController:circkeVC];
    
    LYPersonCenterController *mineVC = [[LYPersonCenterController alloc] init];
    UINavigationController *mineNavi = [[BaseNavigationController alloc] initWithRootViewController:mineVC];
    
    [self setViewControllers:@[homeNavi,attentionNavi,circleNavi,mineNavi]];
    
    UILabel *lineLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 0.5)];
    lineLb.backgroundColor = kTableViewSepColor;
    [self.tabBar addSubview:lineLb];
    
    [self customizeTabBarForController];
    self.delegate = self;
}

- (void)customizeTabBarForController {
    UIImage *backgroundImage = [UIImage imageNamed:@"bottom_bar_bg"];
    NSArray *tabBarItemImages = @[@"tabbar_icon_home", @"tabbar_icon_explore",@"tabbar_icon_develop",@"tabbar_icon_my"];
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[self tabBar] items]) {
        [item setBackgroundSelectedImage:backgroundImage withUnselectedImage:backgroundImage];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_sel",
                                                      [tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_nor",
                                                        [tabBarItemImages objectAtIndex:index]]];
       
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        index++;
    }
}

#pragma mark RDVTabBarControllerDelegate
- (BOOL)tabBarController:(RDVTabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    NSLog(@"tabBatController %@  viewController %@", tabBarController, viewController);
//    self.indexClicked = [self.viewControllers indexOfObject:viewController];
//    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"tabclicked"];
//    if (self.indexClicked == 2 ) {
//        if ([str isEqualToString:@"N"]) {
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"InsuranceProdect_RootViewController" object:nil];
//            [[NSUserDefaults standardUserDefaults] setObject:@"Y" forKey:@"tabclicked"];
//        }
//        
//    }else{
//        [[NSUserDefaults standardUserDefaults] setObject:@"N" forKey:@"tabclicked"];
//    }
    
    return YES;
}

#pragma mark LoginViewControllDelegate 

- (void)loginSuccess {
    [self setSelectedIndex:self.indexClicked];
}




@end

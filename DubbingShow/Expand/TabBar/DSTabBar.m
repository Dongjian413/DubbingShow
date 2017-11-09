//
//  DSTabBar.m
//  DubbingShow
//
//  Created by vicki753-mac on 07/11/2017.
//  Copyright © 2017 liuyan. All rights reserved.
//

#import "DSTabBar.h"
#import "DSTabBarItem.h"
#import "DSTabBarController.h"

@interface DSTabBar ()

@property (nonatomic, strong)NSMutableArray *tabBarItems;
@property (nonatomic, strong)DSTabBarItem *currentSelectedItem;
@property (nonatomic, assign)NSInteger centerIndex;

@end


@implementation DSTabBar

-(instancetype)initWithFrame:(CGRect)frame
              andTabBarItems:(NSArray *)tabBarItems
              andCenterIndex:(NSInteger)centerIndex{
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        self.tabBarItems = [NSMutableArray array];
        self.tabBarItemArributes = tabBarItems;
        self.centerIndex = centerIndex;
        [self setup];
    }
    return self;
}

-(void)setup{
    self.backgroundColor = [UIColor whiteColor];
    CGFloat width = kScreenWidth/self.tabBarItemArributes.count;
    CGFloat height = self.bounds.size.height;
    
    for (int i = 0; i < self.tabBarItemArributes.count ; i++) {
          NSDictionary *itemDic = self.tabBarItemArributes[i];
          DSTabBarItem *item;
        if (i == 2) {
            item = [[DSTabBarItem alloc] initWithFrame:CGRectMake(i*width,-30, height+20, height+20)
                                          andImageRect:CGRectMake(0, 0, height+10, height+10)
                                          andTitleRect:CGRectMake(0, 0, 0, 0)
                                        andNormalImage:[UIImage imageNamed:itemDic[DSTabBarItemNormalImageName]]
                                      andSelectedImage:[UIImage imageNamed:itemDic[DSTabBarItemSelectedImageName]]
                                              andTitle:itemDic[DSTabBarItemTitle]
                                        andNormalColor:[UIColor colorWithRed:223/255.0 green:101/255.0 blue:57/255.0 alpha:1.0]
                                      andSelectedColor:[UIColor colorWithRed:223/255.0 green:101/255.0 blue:57/255.0 alpha:1.0]
                                               andFont:[UIFont systemFontOfSize:12]
                                                andTag:i];
            [self addSubview:item];
        }else{
            item = [[DSTabBarItem alloc] initWithFrame:CGRectMake(i*width, 0, width, height)
                                          andImageRect:CGRectMake((width-height/2)/2, 0, height/2,height/2 )
                                          andTitleRect:CGRectMake(0, height/2, width, (height)/2)
                                        andNormalImage:[UIImage imageNamed:itemDic[DSTabBarItemNormalImageName]]
                                      andSelectedImage:[UIImage imageNamed:itemDic[DSTabBarItemSelectedImageName]]
                                              andTitle:itemDic[DSTabBarItemTitle]
                                        andNormalColor:[UIColor colorWithRed:191/255.0 green:191/255.0 blue:191/255.0 alpha:1.0]
                                      andSelectedColor:[UIColor colorWithRed:223/255.0 green:101/255.0 blue:57/255.0 alpha:1.0]
                                               andFont:[UIFont systemFontOfSize:12]
                                                andTag:i];
            [self addSubview:item];
        }
        [item addTarget:self action:@selector(itemSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabBarItems addObject:item];
        self.centerIndex = 0;
    }
}

#pragma mark - Touch Event
-(void)itemSelected:(UIButton *)button{
  
    if (button.tag == 2) {
        if ([self.delegate respondsToSelector:@selector(tabBarDidSelectedRiseButton)]) {
            if (self.currentSelectedItem.tag != 2) {
                self.currentSelectedItem.selected = NO;
                self.currentSelectedItem = self.tabBarItems[button.tag];
            }
            self.currentSelectedItem.selected = !self.currentSelectedItem.selected;
            [self.delegate tabBarDidSelectedRiseButton];
        }
    }else
    {
        [self setSelectedIndex:button.tag];
    }
}

- (void)setSelectedIndex:(NSInteger)index{
    self.currentSelectedItem.selected = NO;
    self.currentSelectedItem = self.tabBarItems[index];
    self.currentSelectedItem.selected = YES;
    UIWindow *keyWindow = [[[UIApplication sharedApplication] delegate] window];
    DSTabBarController *tabBarController = (DSTabBarController *)keyWindow.rootViewController;
    if (tabBarController) {
        tabBarController.selectedIndex = index;
    }
}



@end

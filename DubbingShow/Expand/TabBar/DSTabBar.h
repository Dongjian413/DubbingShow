//
//  DSTabBar.h
//  DubbingShow
//
//  Created by vicki753-mac on 07/11/2017.
//  Copyright © 2017 liuyan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol DSTabBarDelegate<NSObject>

- (void)tabBarDidSelectedRiseButton;

@end

@interface DSTabBar : UIView

@property (nonatomic, weak)id<DSTabBarDelegate> delegate;
@property (nonatomic, copy)NSArray<NSDictionary *> *tabBarItemArributes;

-(instancetype)initWithFrame:(CGRect)frame
              andTabBarItems:(NSArray *)tabBarItems
              andCenterIndex:(NSInteger)centerIndex;

@end

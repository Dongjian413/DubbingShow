//
//  DSTabBarItem.h
//  DubbingShow
//
//  Created by vicki753-mac on 07/11/2017.
//  Copyright © 2017 liuyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DSButton.h"

extern NSString *const DSTabBarItemTitle;
extern NSString *const DSTabBarItemNormalImageName;
extern NSString *const DSTabBarItemSelectedImageName;
extern NSString *const DSTabBarType;


typedef NS_ENUM(NSInteger, DSTabBarItemMode){
    DSTabBarItemModeNormal = 0,
    DSTabBarItemModeSelected = 1
};

@interface DSTabBarItem : DSButton

-(instancetype)initWithFrame:(CGRect)frame
                andImageRect:(CGRect)imageFrame
                andTitleRect:(CGRect)titleFrame
              andNormalImage:(UIImage *)normalImage
            andSelectedImage:(UIImage *)selectedImage
                    andTitle:(NSString *)title
              andNormalColor:(UIColor *)normalColor
            andSelectedColor:(UIColor*)selectedColor
                     andFont:(UIFont *)font
                      andTag:(NSInteger)tag;

@end

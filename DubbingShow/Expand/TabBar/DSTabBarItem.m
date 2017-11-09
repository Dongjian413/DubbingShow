//
//  DSTabBarItem.m
//  DubbingShow
//
//  Created by vicki753-mac on 07/11/2017.
//  Copyright © 2017 liuyan. All rights reserved.
//

#import "DSTabBarItem.h"

NSString *const DSTabBarItemTitle = @"DSTabBarItemTitle";
NSString *const DSTabBarItemNormalImageName = @"DSTabBarItemNormalImageName";
NSString *const DSTabBarItemSelectedImageName = @"DSTabBarItemSelectedImageName";
NSString *const DSTabBarType = @"DSTabBarType";


@implementation DSTabBarItem

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self config];
    }
    return self;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self config];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self config];
    }
    return self;
}



-(instancetype)initWithFrame:(CGRect)frame
                andImageRect:(CGRect)imageFrame
                andTitleRect:(CGRect)titleFrame
              andNormalImage:(UIImage *)normalImage
            andSelectedImage:(UIImage *)selectedImage
                    andTitle:(NSString *)title
              andNormalColor:(UIColor *)normalColor
            andSelectedColor:(UIColor*)selectedColor
                     andFont:(UIFont *)font
                      andTag:(NSInteger)tag{
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        self.imageRect = imageFrame;
        self.titleRect = titleFrame;
        [self setImage:normalImage  forState:UIControlStateNormal];
        [self setImage:selectedImage forState:UIControlStateSelected];
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:normalColor forState:UIControlStateNormal];
        [self setTitleColor:selectedColor forState:UIControlStateSelected];
        self.titleLabel.font = font;
        self.tag = tag;
    }
    return self;
}

- (void)config{
    self.adjustsImageWhenHighlighted = NO;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self.titleLabel sizeToFit];
    CGSize titleSzie = self.titleLabel.frame.size;
    
    CGSize imageSize = [self imageForState:UIControlStateNormal].size;
    if (imageSize.width != 0 && imageSize.height != 0) {
        CGFloat imageViewCenterY = CGRectGetHeight(self.frame) - 3 -titleSzie.height - imageSize.height / 2 -5;
        self.imageView.center = CGPointMake(CGRectGetWidth(self.frame)/2, imageViewCenterY);
    }else{
        CGPoint imageViewCenter = self.imageView.center;
        imageViewCenter.x = CGRectGetWidth(self.frame)/2;
        imageViewCenter.y = (CGRectGetHeight(self.frame) - titleSzie.height) / 2;
        self.imageView.center = imageViewCenter;
    }
    CGPoint labelCenter = CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)-3-titleSzie.height/2);
    self.titleLabel.center = labelCenter;
    
}




@end

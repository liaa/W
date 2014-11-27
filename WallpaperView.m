//
//  WallpaperView.m
//  W
//
//  Created by liaa on 10/29/14.
//  Copyright (c) 2014 kidliaa. All rights reserved.
//

#import "WallpaperView.h"

@implementation WallpaperView {
    // 配置值
    int floorCount; //从里到外层数总和
    float baseHeight; //最里层(最低层)的高度
    
    // 算出值
    float differenceHeight;
    int horizontalPiceCount;
    float averWidth;
    CGPoint commonAnchorPoint;
    
    
    
    
}
#pragma mark -
#pragma mark initialization
-(instancetype)initWithFrame:(CGRect)frame andColor:(UIColor *)color
{
    self = [super initWithFrame:frame];
    if (self) {
        self.color = color;
        [self setupSizeInfoAccordingToScreenSize];
        [self uisetup];
    }
    return self;
}
-(void)setupSizeInfoAccordingToScreenSize
{
    float viewWidth = self.frame.size.width;
    float viewHeight = self.frame.size.height;
    
    // 配置值
    floorCount = 8;
    baseHeight = viewHeight * 0.6;
    
    // 算出值
    horizontalPiceCount = floorCount * 2 - 1;
    averWidth = viewWidth / horizontalPiceCount;
    differenceHeight = viewHeight - baseHeight;
    commonAnchorPoint = CGPointMake(viewWidth/2, viewHeight);
    
}
#pragma mark -
#pragma mark uisetup
- (void) uiuColor
{
    UIColor *finalColor = self.color;
    for (int i = 0; i < floorCount; i++) {
        float normalizedValueBaseOnNestedLevel = i / (floorCount - 1.0); //根据层级得到一个标准化的值(0~1)用来计算不同层级的 1)颜色值  2)高度值
        const CGFloat *compoments = CGColorGetComponents(finalColor.CGColor);
        CGFloat r = 0.0 + compoments[0] * normalizedValueBaseOnNestedLevel;
        CGFloat g = 0.0 + compoments[1] * normalizedValueBaseOnNestedLevel;
        CGFloat b = 0.0 + compoments[2] * normalizedValueBaseOnNestedLevel;
        
        CALayer *layer = self.layer.sublayers[(floorCount-1)-i];
        layer.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1].CGColor;
    }
}
- (void) uiuLayersFrame
{
    
    for (int i = 0; i < floorCount; i++) {
        float normalizedValueBaseOnNestedLevel = i / (floorCount - 1.0); //根据层级得到一个标准化的值(0~1)用来计算不同层级的 1)颜色值  2)高度值
        
        float width = averWidth * (1 + i * 2);
        float height = baseHeight + differenceHeight * normalizedValueBaseOnNestedLevel;
        
        CALayer *layer = self.layer.sublayers[(floorCount-1)-i];
        layer.bounds = CGRectMake(0, 0, width, height);
        layer.position = commonAnchorPoint;
        layer.anchorPoint = CGPointMake(0.5, 1);
    }
}
- (void) uisetup {
    UIColor *finalColor = self.color;
    
    // 绘制背景 Layers
    for (int i = 0; i < floorCount; i++) {
        
        float normalizedValueBaseOnNestedLevel = i / (floorCount - 1.0); //根据层级得到一个标准化的值(0~1)用来计算不同层级的 1)颜色值  2)高度值
        
        float width = averWidth * (1 + i * 2);
        float height = baseHeight + differenceHeight * normalizedValueBaseOnNestedLevel;
        
        const CGFloat *compoments = CGColorGetComponents(finalColor.CGColor);
        CGFloat r = 0.0 + compoments[0] * normalizedValueBaseOnNestedLevel;
        CGFloat g = 0.0 + compoments[1] * normalizedValueBaseOnNestedLevel;
        CGFloat b = 0.0 + compoments[2] * normalizedValueBaseOnNestedLevel;
        
        CALayer *layer;
        
        if (self.layer.sublayers[i] != nil) {
            layer = self.layer.sublayers[i];
        } else {
            layer = [CALayer layer];
            layer.position = commonAnchorPoint;
            layer.anchorPoint = CGPointMake(0.5, 1);
        }
        layer.bounds = CGRectMake(0, 0, width, height);
        layer.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1].CGColor;
        [self.layer insertSublayer:layer atIndex:0];
    }
}


#pragma mark -
#pragma mark handle rotation
-(void)layoutSubviews
{
    [self setupSizeInfoAccordingToScreenSize];
    [self uiuLayersFrame];
}

@end

//
//  W_color.m
//  W
//
//  Created by liaa on 10/29/14.
//  Copyright (c) 2014 kidliaa. All rights reserved.
//

#import "W_color.h"

@implementation W_color
- (void) setup {
    UIColor *finalColor = self.color;
    int floot = 8;
    int totalPiece = floot * 2 - 1;
    float everWidth = self.frame.size.width / totalPiece;
    float baseHeight = self.bounds.size.height * 0.6;
    float deltHeight = self.bounds.size.height - baseHeight;
    CGPoint position = CGPointMake(self.bounds.size.width/2, self.bounds.size.height);
    
    for (int i = 0; i < floot; i++) {
        float grade = i / (floot - 1.0);
        float width = everWidth * (1 + i * 2);

        float height = baseHeight + deltHeight * grade;
        
        const CGFloat *compoments = CGColorGetComponents(finalColor.CGColor);
        
        CGFloat r = 0.0 + compoments[0] * grade;
        CGFloat g = 0.0 + compoments[1] * grade;
        CGFloat b = 0.0 + compoments[2] * grade;
        
        
        if (self.layer.sublayers[floot - 1] != nil) {
                CALayer *layer = self.layer.sublayers[(floot-1)-i];
                layer.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1].CGColor;
            continue;
        }
        
        CALayer *layer;
        if (self.layer.sublayers[i] != nil) {
            layer = self.layer.sublayers[i];
        } else {
            layer = [CALayer layer];
            layer.position = position;
            layer.anchorPoint = CGPointMake(0.5, 1);
        }
        layer.bounds = CGRectMake(0, 0, width, height);
        layer.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1].CGColor;
        
        
        [self.layer insertSublayer:layer atIndex:0];
        
        
    }
}

-(instancetype)initWithFrame:(CGRect)frame andColor:(UIColor *)color
{
    self = [super initWithFrame:frame];
    if (self) {
        self.color = color;
        [self setup];
    }
    
    return self;
    
}

@end

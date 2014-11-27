//
//  WallpaperView.h
//  W
//
//  Created by liaa on 10/29/14.
//  Copyright (c) 2014 kidliaa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WallpaperView : UIView
-(instancetype)initWithFrame:(CGRect)frame andColor:(UIColor *)color;
- (void) uisetup;
- (void) uiuColor;
@property UIColor *color;
@end

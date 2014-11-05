//
//  W_color.h
//  W
//
//  Created by liaa on 10/29/14.
//  Copyright (c) 2014 kidliaa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface W_color : UIView
- (void) setup;
-(instancetype)initWithFrame:(CGRect)frame andColor:(UIColor *)color;
@property UIColor *color;
@end

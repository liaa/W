//
//  RH7SlideUpTransitionAnimator.h
//  RH7
//
//  Created by liaa on 11/6/14.
//  Copyright (c) 2014 raoheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface RH7SlideUpTransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>
- (instancetype)initWithYOffset:(float)yOffset;
@property BOOL presenting;
@end

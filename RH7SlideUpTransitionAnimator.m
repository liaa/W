//
//  RH7SlideUpTransitionAnimator.m
//  RH7
//
//  Created by liaa on 11/6/14.
//  Copyright (c) 2014 raoheng. All rights reserved.
//

#import "RH7SlideUpTransitionAnimator.h"

@implementation RH7SlideUpTransitionAnimator {
    float yOff;
}

- (instancetype)initWithYOffset:(float)yOffset;
{
    self = [super init];
    if (self) {
        yOff = yOffset;
    }
    return self;
}
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.2f;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    UIView *fromView = fromVC.view;
    UIView *toView = toVC.view;
    
    if (self.presenting) {
        CGRect baseRect = fromVC.view.frame;

        CGRect destinationRect = CGRectMake(baseRect.origin.x, baseRect.origin.y + yOff, baseRect.size.width, baseRect.size.height - yOff);

        CGRect startRect = CGRectMake(0, baseRect.size.height, destinationRect.size.width, destinationRect.size.height);
        toView.frame = startRect;
        
        
        [containerView addSubview:toView];
        
        toView.translatesAutoresizingMaskIntoConstraints = NO;
        
        NSDictionary *metrics = @{@"y": [NSNumber numberWithFloat:containerView.frame.size.height]};
        
        
        NSArray *vCs = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(==y)-[toView]|"
                        
                                                               options:0
                                                               metrics:metrics
                                                                 views:@{@"toView":toView, @"containerView":containerView}];
        
        [containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[toView]|"
                                                                             options:0
                                                                              metrics:metrics
                                                                               views:@{@"toView":toView}]];
        [containerView addConstraints:vCs];
        [containerView layoutIfNeeded];
        
        [containerView removeConstraints:vCs];
        [containerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[toView]|"

                                                                             options:0
                                                                             metrics:nil
                                                                                views:@{@"toView":toView}]];

        
        
        
        [UIView animateWithDuration:0.2f animations:^{
            fromVC.view.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
            [containerView layoutIfNeeded];
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
    
    if (!self.presenting) {
        CGRect baseRect = fromVC.view.frame;
        CGRect destRect = CGRectMake(baseRect.origin.x, baseRect.origin.y += baseRect.size.height, baseRect.size.width, baseRect.size.height);
        
        [UIView animateWithDuration:0.2f animations:^{
            [fromView setFrame:destRect];
            
        } completion:^(BOOL finished) {
                        toVC.view.tintAdjustmentMode = UIViewTintAdjustmentModeAutomatic;
            [fromView removeFromSuperview];
            [transitionContext completeTransition:YES];
        }];
    }
    
}

@end

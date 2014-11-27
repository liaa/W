//
//  ViewController.m
//  W
//
//  Created by liaa on 10/29/14.
//  Copyright (c) 2014 kidliaa. All rights reserved.
//

#import "ViewController.h"
#import "WallpaperView.h"
#import "RGBViewController.h"
#import "RH7SlideUpTransitionAnimator.h"
@interface ViewController () <FullScreeControllerProtocal, UIViewControllerTransitioningDelegate>

@end

@implementation ViewController {
    WallpaperView *colorView;
    UIColor *color;
}
#pragma mark -
#pragma mark ===vc lifecycle===
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self uis];
    
}
#pragma mark -
#pragma mark ===uisetup===
- (void) uis
{
    color = [UIColor colorWithRed:87/255.0 green:181/255.0 blue:188/255.0 alpha:1.0];
    colorView = [[WallpaperView alloc] initWithFrame:self.view.frame andColor:color];
    colorView.translatesAutoresizingMaskIntoConstraints = NO;


    [self.view insertSubview:colorView atIndex:0];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[colorView]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:@{@"colorView":colorView}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[colorView]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:@{@"colorView":colorView}]];
}

#pragma mark -
#pragma mark ===uiupdate===

#pragma mark -
#pragma mark ===action===
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    RGBViewController *vc = [[RGBViewController alloc] initWithNibName:@"RBGViewController" bundle:nil];
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha =0.0;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    vc.rValue = floorf(red*255);
    vc.gValue = floorf(green*255);
    vc.bValue = floorf(blue*255);
    vc.delegate = self;
    vc.transitioningDelegate = self;
    vc.modalPresentationStyle = UIModalPresentationCustom;
    
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
}
#pragma mark -
#pragma mark ===delegate and datasource===
#pragma mark =delegate UIViewControllerTransition=
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    RH7SlideUpTransitionAnimator *animator = [[RH7SlideUpTransitionAnimator alloc] initWithYOffset:0];
    animator.presenting = YES;
    return animator;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    RH7SlideUpTransitionAnimator *animator = [[RH7SlideUpTransitionAnimator alloc] initWithYOffset:0];
    animator.presenting = NO;
    return animator;
}

#pragma mark =delegate RGBViewController=
-(void) fullScreenValueChangedR:(int)R g:(int)g b:(int)B
{
    color = [UIColor colorWithRed:R/255.0 green:g/225.0 blue:B/255.0 alpha:1.0];
    colorView.color = color;
    [colorView uiuColor];
}
#pragma mark -
#pragma mark ===notification===

#pragma mark -
#pragma mark ===helper===
- (void) sliderActionR:(id)sender
{
    [self update];
}

- (void) sliderActionG:(id)sender
{
    [self update];
}

- (void) sliderActionB:(id)sender
{
    [self update];
}

- (void) update {
    
//    UIColor *color = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:black/255.0 alpha:1];
//    aView.color = color;
//    [aView setup];
}
- (void) hideSlider {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) prefersStatusBarHidden
{
    return YES;
}
@end

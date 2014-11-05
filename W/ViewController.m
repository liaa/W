//
//  ViewController.m
//  W
//
//  Created by liaa on 10/29/14.
//  Copyright (c) 2014 kidliaa. All rights reserved.
//

#import "ViewController.h"
#import "W_color.h"
@interface ViewController ()

@end

@implementation ViewController {
    UISlider *r;
    UISlider *g;
    UISlider *b;
    W_color *aView;
    UIView *controllerPanel;
    
    BOOL showController;
}
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    showController = !showController;
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self toggleControllerVisibility];
}

- (void) toggleControllerVisibility
{
    controllerPanel.hidden = !showController;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    showController = YES;
    CGFloat w = self.view.bounds.size.width;
    CGFloat h = self.view.bounds.size.height;
    controllerPanel = [[UIView alloc] initWithFrame:CGRectMake(w/2-150, h - 150, 300, 150)];
    [self showColorController];
    UIColor *color = [self getColor];
    aView = [[W_color alloc] initWithFrame:self.view.frame andColor:color];
    
    
    
//    [self.view addSubview:aView];
    [self.view insertSubview:aView atIndex:0];
    [self.view addSubview:controllerPanel];
    
}

- (void) showColorController {
    
    CGRect frame = CGRectMake(50, 0, 200.0, 10.0);
    r = [[UISlider alloc] initWithFrame:frame];
    [r addTarget:self action:@selector(sliderActionR:) forControlEvents:UIControlEventValueChanged];
    [r setBackgroundColor:[UIColor clearColor]];
    r.minimumValue = 0.0;
    r.maximumValue = 255.0;
    r.continuous = YES;
    r.minimumTrackTintColor = [UIColor redColor];
    r.value = 99.0;
    
    frame = CGRectMake(50, 50, 200.0, 10.0);
    g = [[UISlider alloc] initWithFrame:frame];
    [g addTarget:self action:@selector(sliderActionG:) forControlEvents:UIControlEventValueChanged];
    [g setBackgroundColor:[UIColor clearColor]];
    g.minimumValue = 0.0;
    g.maximumValue = 255.0;
    g.continuous = YES;
    g.minimumTrackTintColor = [UIColor greenColor];
    g.value = 167.0;
    
    frame =CGRectMake(50, 100, 200.0, 10.0);
    b = [[UISlider alloc] initWithFrame:frame];
    [b addTarget:self action:@selector(sliderActionG:) forControlEvents:UIControlEventValueChanged];
    [b setBackgroundColor:[UIColor clearColor]];
    b.minimumValue = 0.0;
    b.maximumValue = 255.0;
    b.continuous = YES;
    b.minimumTrackTintColor = [UIColor blueColor];
    b.value = 157.0;
    
    [controllerPanel addSubview:r];
    [controllerPanel addSubview:g];
    [controllerPanel addSubview:b];
    
    controllerPanel.hidden = !showController;
    
    
}
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

- (UIColor *) getColor {
    float red = r.value;
    float green = g.value;
    float black = b.value;
    UIColor *color = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:black/255.0 alpha:1];
    return color;
    
}
- (void) update {
    float red = r.value;
    float green = g.value;
    float black = b.value;
    UIColor *color = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:black/255.0 alpha:1];
    aView.color = color;
    [aView setup];
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

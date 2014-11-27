//
//  RGBViewController.m
//  W
//
//  Created by liaa on 11/5/14.
//  Copyright (c) 2014 kidliaa. All rights reserved.
//

#import "RGBViewController.h"

@interface RGBViewController ()
@property (nonatomic) UILabel *labelR;
@property (nonatomic) UILabel *labelG;
@property (nonatomic) UILabel *labelB;
@end

@implementation RGBViewController {
    float h;
    float lastPanX;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIPanGestureRecognizer *p = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    UITapGestureRecognizer *t = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(t:)];
    [self.view addGestureRecognizer:t];
    [self.view addGestureRecognizer:p];
    lastPanX = -1;
    [self uis];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    h = self.view.frame.size.height;
}
- (void) viewDidLayoutSubviews
{
    h = self.view.frame.size.height;
}
- (void) viewWillLayoutSubviews
{
//    self.view.frame = [UIScreen mainScreen].bounds;
}
- (void) uis
{
    self.labelR = [[UILabel alloc] init];
    self.labelR.translatesAutoresizingMaskIntoConstraints = NO;
    self.labelR.textColor = [UIColor whiteColor];
    
    
    self.labelG = [[UILabel alloc] init];
    self.labelG.translatesAutoresizingMaskIntoConstraints = NO;
    self.labelG.textColor = [UIColor whiteColor];
    
    
    self.labelB = [[UILabel alloc] init];
    self.labelB.translatesAutoresizingMaskIntoConstraints = NO;
    self.labelB.textColor = [UIColor whiteColor];
    
    self.labelR.text = [NSString stringWithFormat:@"%i",self.rValue];
    self.labelG.text = [NSString stringWithFormat:@"%i",self.gValue];
    self.labelB.text = [NSString stringWithFormat:@"%i",self.bValue];
    
    [self.view addSubview:self.labelR];
    [self.view addSubview:self.labelG];
    [self.view addSubview:self.labelB];
    NSDictionary *vD = @{@"l1": self.labelR};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[l1(100)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:vD]];
    
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.labelR
                                                           attribute:NSLayoutAttributeBottom
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeBottom
                                                          multiplier:0.33
                                                            constant:0.0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.labelG
                                                           attribute:NSLayoutAttributeBottom
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeBottom
                                                          multiplier:0.66
                                                            constant:0.0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.labelG
                                                           attribute:NSLayoutAttributeLeft
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeLeft
                                                          multiplier:1
                                                            constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.labelB
                                                           attribute:NSLayoutAttributeBottom
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeBottom
                                                          multiplier:1.0
                                                            constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.labelB
                                                           attribute:NSLayoutAttributeLeft
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeLeft
                                                          multiplier:1
                                                            constant:0.0]];
}
- (void)t:(UITapGestureRecognizer *)recognizer
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)pan:(UIPanGestureRecognizer *)recognizer {
    
    CGPoint translation = [recognizer translationInView:self.view];
    CGPoint startPoint = [recognizer locationInView:self.view];
    
    float y = startPoint.y;
    if (lastPanX == -1) {
        lastPanX = translation.x;
    }
    
    NSLog(@"y: %f | %f | %f", y, h/3, h*2/3);
    
    if (0 <= y && y <= h/3) {
        float old = [self.labelR.text floatValue];
        float new = old + (translation.x - lastPanX);
        lastPanX = translation.x;
        int displayValue = floorf(new);
        
        if (new >=0 && new <= 255) {
            self.rValue = displayValue;
        } else if ( new < 0) {
            self.rValue = 0;
        } else {
            self.rValue = 255;
        }
        NSLog(@"r");
        
    } else if ( y >= h*2/3) {
        float old = [self.labelB.text floatValue];
        float new = old + (translation.x - lastPanX);
        lastPanX = translation.x;
        int displayValue = floorf(new);
        
        if (new >=0 && new <= 255) {
            self.bValue = displayValue;
        } else if ( new < 0) {
            self.bValue = 0;
        } else {
            self.bValue = 255;
        }
        NSLog(@"b");
    } else {
        
        float old = [self.labelG.text floatValue];
        float new = old + (translation.x - lastPanX);
        lastPanX = translation.x;
        int displayValue = floorf(new);
        
        if (new >=0 && new <= 255) {
            self.gValue = displayValue;
        } else if ( new < 0) {
            self.gValue = 0;
        } else {
            self.gValue = 255;
        }
        
        NSLog(@"g");
        
    }
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        lastPanX = 0.0;
    } else {
        [self update];
    }
}

-(void)update
{
    self.labelR.text = [NSString stringWithFormat:@"%i",self.rValue];
    self.labelG.text = [NSString stringWithFormat:@"%i",self.gValue];
    self.labelB.text = [NSString stringWithFormat:@"%i",self.bValue];
    [self.delegate fullScreenValueChangedR:self.rValue g:self.gValue b:self.bValue];
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    lastPanX = 0.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}


@end

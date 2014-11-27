//
//  FullScreenController.m
//  W
//
//  Created by liaa on 11/5/14.
//  Copyright (c) 2014 kidliaa. All rights reserved.
//

#import "FullScreenController.h"

@implementation FullScreenController {
    int r;
    int g;
    int b;
}

- (void)setInitR:(int)r G:(int)g B:(int)b
{
    
}

-(instancetype)initWithFrame:(CGRect)frame r:(int)R g:(int)G b:(int)B
{
    self = [super initWithFrame:frame];
    if (self) {
        r = R;
        g = G;
        b = B;
        [self setup];
    }
    return self;
}

-(void)setup
{
    self.backgroundColor = [UIColor redColor];
}
@end

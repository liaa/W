//
//  FullScreenController.h
//  W
//
//  Created by liaa on 11/5/14.
//  Copyright (c) 2014 kidliaa. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol FullScreeControllerProtocal <NSObject>

- (void) fullScreenValueChanged;

@end

@interface FullScreenController : UIView

@property id<FullScreeControllerProtocal> delegate;
- (void)show;
-(instancetype)initWithFrame:(CGRect)frame r:(int)r g:(int)g b:(int)b;
@end

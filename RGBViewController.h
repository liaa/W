//
//  RGBViewController.h
//  W
//
//  Created by liaa on 11/5/14.
//  Copyright (c) 2014 kidliaa. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol FullScreeControllerProtocal <NSObject>

- (void) fullScreenValueChangedR:(int)R g:(int)g b:(int)B;

@end
@interface RGBViewController : UIViewController
@property id<FullScreeControllerProtocal> delegate;
@property int rValue;
@property int gValue;
@property int bValue;
@end

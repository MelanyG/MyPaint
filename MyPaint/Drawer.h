//
//  Drawer.h
//  MyPaint
//
//  Created by Melany Gulianovych on 12/17/15.
//  Copyright (c) 2015 Melany Gulianovych. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Drawer : UIView


@property (nonatomic, assign) BOOL crossLine;

- (instancetype)initWithFrame:(CGRect)frame
                        shape:(int)shape
                        color:(UIColor*)color
                startLocation:(CGPoint)startTap
                  endLocation:(CGPoint)stopTap;


@end

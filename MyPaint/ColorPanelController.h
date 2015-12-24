//
//  ColorPanelController.h
//  MyPaint
//
//  Created by Melany Gulianovych on 12/18/15.
//  Copyright (c) 2015 Melany Gulianovych. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Board.h"
#import "SettingsForColor.h"

@protocol ColorDelegate;

@interface ColorPanelController : UIViewController


@property (nonatomic, weak) id delegate;
@property(nonatomic, strong) UIColor* color;

@end

//
//  CanvasViewController.h
//  MyPaint
//
//  Created by Melany Gulianovych on 12/18/15.
//  Copyright (c) 2015 Melany Gulianovych. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FigureViewController.h"
#import "Drawer.h"
#import "ColorPanelController.h"

@interface CanvasViewController : UIViewController

@property(nonatomic, strong) Drawer* rect;
@property(nonatomic, assign) NSInteger tag;
@property(nonatomic, assign) CGPoint start;
@property(nonatomic, assign) CGPoint stop;



@end

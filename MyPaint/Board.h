//
//  ViewController.h
//  MyPaint
//
//  Created by Melany Gulianovych on 12/17/15.
//  Copyright (c) 2015 Melany Gulianovych. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FigureViewController.h"
#import "ColorPanelController.h"
//#import "CanvasViewController.h"

@protocol FigureDelegate;
@protocol ColorDelegate;

@class CanvasViewController;

@interface Board : UIViewController

@end

@protocol FigureDelegate<NSObject>

@required

-(void) didSelectFigure:(NSInteger)tag;
//-(void) didSelectColor:(NSInteger)button;

@end

@protocol ColorDelegate<NSObject>

@required


-(void) didSelectColor:(UIColor*)button;

@end









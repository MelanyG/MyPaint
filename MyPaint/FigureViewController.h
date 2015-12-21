//
//  FigureViewController.h
//  MyPaint
//
//  Created by Melany Gulianovych on 12/18/15.
//  Copyright (c) 2015 Melany Gulianovych. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Board.h"



@protocol FigureDelegate;

@interface FigureViewController: UIViewController

@property(weak, nonatomic) id  delegate;//protocol



@end







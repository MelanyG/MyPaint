//
//  FigureViewController.m
//  MyPaint
//
//  Created by Melany Gulianovych on 12/18/15.
//  Copyright (c) 2015 Melany Gulianovych. All rights reserved.
//

#import "FigureViewController.h"



@implementation FigureViewController


- (IBAction)selectShapeButtonPressed:(UISegmentedControl *)sender
{
    self.tag = sender.selectedSegmentIndex;
    [self.delegate didSelectFigure:sender.selectedSegmentIndex];
}

@end

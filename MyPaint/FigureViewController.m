//
//  FigureViewController.m
//  MyPaint
//
//  Created by Melany Gulianovych on 12/18/15.
//  Copyright (c) 2015 Melany Gulianovych. All rights reserved.
//

#import "FigureViewController.h"

@interface FigureViewController ()

@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentFigureContoler;

@end


@implementation FigureViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.segmentFigureContoler.transform = CGAffineTransformMakeRotation(M_PI / 2.0);
}


- (IBAction)selectShapeButtonPressed:(UISegmentedControl *)sender
{
    [self.delegate didSelectFigure:sender.selectedSegmentIndex];
}


@end

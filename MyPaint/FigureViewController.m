//
//  FigureViewController.m
//  MyPaint
//
//  Created by Melany Gulianovych on 12/18/15.
//  Copyright (c) 2015 Melany Gulianovych. All rights reserved.
//

#import "FigureViewController.h"

@interface FigureViewController ()


@end


@implementation FigureViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (IBAction)selectFigurePressed:(UIButton *)sender {

    [self.delegate didSelectFigure:sender.tag];

}










@end

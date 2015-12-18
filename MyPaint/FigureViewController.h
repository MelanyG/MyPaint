//
//  FigureViewController.h
//  MyPaint
//
//  Created by Melany Gulianovych on 12/18/15.
//  Copyright (c) 2015 Melany Gulianovych. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    Line,
    triangle,
    circle,
    rectangle,
    elipse,
    square
    
} SelectedFigure;

@protocol FigureDelegate

@required

-(void) didSelectFigure:(UISegmentedControl*) Figure;


@end

@interface FigureViewController : UIViewController

@property(nonatomic, assign) NSInteger tag;
@property (strong, nonatomic) IBOutlet UISegmentedControl *Figure;
@property(weak, nonatomic) id <FigureDelegate> delegate;

- (IBAction)selectShapeButtonPressed:(UISegmentedControl *)sender;

@end







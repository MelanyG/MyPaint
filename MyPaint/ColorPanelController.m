//
//  ColorPanelController.m
//  MyPaint
//
//  Created by Melany Gulianovych on 12/18/15.
//  Copyright (c) 2015 Melany Gulianovych. All rights reserved.
//

#import "ColorPanelController.h"

@interface ColorPanelController()

@property(nonatomic, assign) CGFloat red;
@property(nonatomic, assign) CGFloat green;
@property(nonatomic, assign) CGFloat blue;

@end


@implementation ColorPanelController


- (IBAction)ColorPressed:(id)sender
{
    UIButton * PressedButton = (UIButton*)sender;
    
    switch(PressedButton.tag)
    {
        case 0:
            self.red = 0.0/255.0;
            self.green = 0.0/255.0;
            self.blue = 0.0/255.0;
            break;
        case 1:
            self.red = 105.0/255.0;
            self.green = 105.0/255.0;
            self.blue = 105.0/255.0;
            break;
        case 2:
            self.red = 255.0/255.0;
            self.green = 0.0/255.0;
            self.blue = 0.0/255.0;
            break;
        case 3:
            self.red = 0.0/255.0;
            self.green = 0.0/255.0;
            self.blue = 255.0/255.0;
            break;
        case 4:
            self.red = 102.0/255.0;
            self.green = 204.0/255.0;
            self.blue = 0.0/255.0;
            break;
        case 5:
            self.red = 102.0/255.0;
            self.green = 255.0/255.0;
            self.blue = 0.0/255.0;
            break;
        case 6:
            self.red = 51.0/255.0;
            self.green = 204.0/255.0;
            self.blue = 255.0/255.0;
            break;
        case 7:
            self.red = 160.0/255.0;
            self.green = 82.0/255.0;
            self.blue = 45.0/255.0;
            break;
        case 8:
            self.red = 255.0/255.0;
            self.green = 102.0/255.0;
            self.blue = 0.0/255.0;
            break;
        case 9:
            self.red = 255.0/255.0;
            self.green = 255.0/255.0;
            self.blue = 0.0/255.0;
            break;
    }
    self.color= [UIColor colorWithRed:(self.red) green:(self.green) blue:(self.blue) alpha:1] ;
    
    [self.delegate didSelectColor:self.color];
}

@end

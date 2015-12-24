//
//  SettongsForColor.h
//  MyPaint
//
//  Created by Melany Gulianovych on 12/24/15.
//  Copyright (c) 2015 Melany Gulianovych. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorPanelController.h"

@interface SettingsForColor : UIViewController


@property (strong, nonatomic) IBOutlet UISlider *brushControl;
@property (strong, nonatomic) IBOutlet UISlider *opacityControl;
@property (strong, nonatomic) IBOutlet UIImageView *brushPreview;
@property (strong, nonatomic) IBOutlet UIImageView *opacityPreview;
@property (strong, nonatomic) IBOutlet UILabel *brushValueLabel;
@property (strong, nonatomic) IBOutlet UILabel *opacityValueLabel;

- (IBAction)valueChanged:(id)sender;


- (IBAction)closeSettings:(id)sender;
@end

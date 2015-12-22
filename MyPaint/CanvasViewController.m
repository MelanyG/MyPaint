//
//  CanvasViewController.m
//  MyPaint
//
//  Created by Melany Gulianovych on 12/18/15.
//  Copyright (c) 2015 Melany Gulianovych. All rights reserved.
//

#import "CanvasViewController.h"




@interface CanvasViewController ()

@property(nonatomic, strong) Drawer* rect;
@property(nonatomic, weak) UIView* draggingView;
@property(nonatomic, assign)CGPoint touchesBegan;
@property(nonatomic, assign) NSInteger tag; //for protocol
@property(nonatomic, assign) CGPoint start;
@property(nonatomic, assign) CGPoint stop;

@end



@implementation CanvasViewController


#pragma mark-Figure selected Delegate

-(void) didSelectFigure:(NSInteger) tag
{
    self.tag=tag;
}


#pragma mark-Touches

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch* touch = [[event allTouches] anyObject];
    self.start = [touch locationInView:self.view];
    
    CGRect frame = CGRectMake(self.start.x,
                              self.start.y,
                              0, 0);
    
    self.rect = [[Drawer alloc] initWithFrame:frame
                                        shape:self.tag
                                startLocation:self.start
                                  endLocation:self.start];
    
//    self.rect.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.rect];
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.rect.transform=CGAffineTransformMakeScale(1.2f, 1.2f);
                         self.rect.alpha=0.3;
                     }];
    NSLog(@"touchesBegan,%@", NSStringFromCGRect(frame));
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    
    UITouch* touch = [[event allTouches] anyObject];
    self.stop = [touch locationInView:self.view];
    
    CGFloat width = self.stop.x - self.start.x;
    CGFloat height = self.stop.y - self.start.y;
    
    CGFloat x = width >= 0 ? self.start.x : self.start.x + width;
    CGFloat y = height >= 0 ? self.start.y : self.start.y + height;
    
    CGRect frame = CGRectMake(x, y, fabs(width), fabs(height));
    
    self.rect.crossLine = (width > 0 && height < 0) || (width < 0 && height > 0);
    self.rect.frame = frame;
    
    [self.rect setNeedsDisplay];
    NSLog(@"touchesMoved,%@", NSStringFromCGRect(frame));
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    NSLog(@"touchesEnded");
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.rect.transform=CGAffineTransformIdentity;
                         self.rect.alpha=1.f;
                     }];
    
    
    self.rect = nil;
}


@end

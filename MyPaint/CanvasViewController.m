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
//@property(nonatomic, weak) UIView* draggingView;
//@property(nonatomic, assign)CGPoint touchesBegan;
@property(nonatomic, assign) NSInteger tag; //for protocol
@property(nonatomic, strong) UIColor* button; //for protocol
@property(nonatomic, assign) CGPoint start;
@property(nonatomic, assign) CGPoint stop;
@property(nonatomic, strong) NSMutableArray* myArray;
@property(nonatomic, assign) CGFloat width; //for protocol
@property(nonatomic, weak) UIView* currentView;
@property(nonatomic, assign) CGFloat tmpScale;

//@property(nonatomic, strong) UIGestureRecognizer* gestureTab;
@end



@implementation CanvasViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.myArray = [[NSMutableArray alloc] init];
    
    UITapGestureRecognizer*  gestureTab = [[UITapGestureRecognizer alloc]initWithTarget:self
action:@selector(handleDoubleTap:) ];
    [self.view addGestureRecognizer: gestureTab];
    gestureTab.numberOfTapsRequired=2;
//gestureTab.numberOfTouchesRequired=2;
    
       //[gestureTab numberOfTouches];
    //gestureTab.numberOfTouchesRequired = 1;
    UIPinchGestureRecognizer* pinchGesture=[[UIPinchGestureRecognizer alloc]initWithTarget:self
action:@selector(handlePinch:)];
    [self.view addGestureRecognizer:pinchGesture];
   
}

#pragma mark-protocols

-(void) didSelectFigure:(NSInteger) tag
{
    self.tag=tag;
}

-(void) didSelectColor:(UIColor*) colorSelected
{
    self.button=colorSelected;
}

-(void) didSelectWidth:(CGFloat)shapeWidth
{
    self.width = shapeWidth;
}

#pragma mark-Gestures

-(void)handleDoubleTap:(UITapGestureRecognizer*) gestureTab
{
    NSLog(@"Tab,%@", NSStringFromCGPoint([gestureTab locationInView:self.view]));
    
}

-(void)handlePinch:(UIPinchGestureRecognizer*) pinchGesture
{
    
    NSLog(@"pinchGesture" );
    
    if(pinchGesture.state == UIGestureRecognizerStateBegan)
    {
        self.tmpScale = 1.f;
    }
    
    CGFloat newScale = 1.f+pinchGesture.scale-self.tmpScale;
    
    CGAffineTransform currentTransform = self.currentView.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, newScale, newScale);
    
    self.currentView.transform = newTransform;
    self.tmpScale = pinchGesture.scale;
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
                                        color:self.button
                                        width:self.width
                                startLocation:self.start
                                  endLocation:self.start];
    
    self.rect.translatesAutoresizingMaskIntoConstraints = NO;
//    self.rect.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.rect];
    [self.myArray addObject:self.rect];
    
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
    //NSLog(@"touchesMoved,%@", NSStringFromCGRect(frame));
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    //NSLog(@"touchesEnded");
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.rect.transform=CGAffineTransformIdentity;
                         self.rect.alpha=1.f;
                     }];
    
    self.rect = nil;
   // NSLog(@"q-ty of elements in array: %lu", (unsigned long)[self.myArray count]);
}






@end

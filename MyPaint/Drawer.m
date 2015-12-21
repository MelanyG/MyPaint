//
//  Drawer.m
//  MyPaint
//
//  Created by Melany Gulianovych on 12/17/15.
//  Copyright (c) 2015 Melany Gulianovych. All rights reserved.
//

#import "Drawer.h"

typedef enum shapeTypes
{
    Line,
    triangle,
    circle,
    rectangle,
    elipse,
    squire
    
}SelectedFigure;

@interface Drawer()

@property(nonatomic, assign)CGPoint startPoint;
@property(nonatomic, assign)CGPoint endPoint;
@property(nonatomic, assign)NSInteger shape;

@end

@implementation Drawer



- (instancetype)initWithFrame:(CGRect)frame
                        shape:(int)shape
                startLocation:(CGPoint)startTap
                  endLocation:(CGPoint)stopTap
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor grayColor];
        self.shape = shape;
        self.startPoint = startTap;
        self.endPoint = stopTap;
    }
    return self;
}

- (void)drawRect:(CGRect)rect;
{
    [super drawRect:rect];

    switch (self.shape) {
        case Line:
            [self drawLines:rect];
              break;
        case triangle:
            [self drawTriangle:rect];
            break;
        case circle:
            [self drawCircle:rect];
            break;
        case rectangle:
            [self drawRectangle:rect];
            break;
        case elipse:
            [self drawElipse:rect];
            break;
        default:
            break;
    }
}

- (void)drawLines:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 25);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGPoint p = CGPointMake(rect.size.width, rect.size.height);
    
    if (self.crossLine)
    {
        CGContextMoveToPoint(context, 0, p.y);
        CGContextAddLineToPoint(context, p.x, 0);
    }
    else
    {
        CGContextMoveToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, p.x, p.y);
    }
    
    CGContextStrokePath(context);
}

-(void)drawTriangle:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    int sides = 3;
    
    double radius = (rect.size.width<rect.size.height?rect.size.width:rect.size.height) / 2.0;
    //double size = 2*radius*sin(60/2);
    CGPoint center = CGPointMake(rect.size.width/2, rect.size.height/2);
    
    
    double theta = 2.0 * M_PI / sides;
    
    CGContextMoveToPoint(context, center.x, center.y-radius);
    for (NSUInteger k=1; k<sides; k++) {
        float x = radius * sin(k * theta);
        float y = radius * cos(k * theta);
        CGContextAddLineToPoint(context, center.x+x, center.y-y);
    }
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextClosePath(context);
    CGContextSetLineWidth(context, 5);

    //CGContextFillPath(context);           // Choose for a filled triangle
    //CGContextSetLineWidth(context, 2); // Choose for a unfilled triangle
    CGContextStrokePath(context);      // Choose for a unfilled triangle
}

-(void)drawCircle:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    CGContextSetRGBStrokeColor(context, 0.9, 0.9, 0.9, 1.0);
    CGContextSetLineWidth(context, 5);
    rect.size.width-=5;
    rect.size.height-=5;
    rect.origin.x+=5;
    rect.origin.y+=5;
    CGContextStrokeEllipseInRect(context, rect);
    
    
}

-(void)drawRectangle:(CGRect)rect
{
    CGRect rectangle = CGRectMake(0, 0, rect.size.width, rect.size.height);
    CGContextRef context = UIGraphicsGetCurrentContext();
    //CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, .0);
    CGContextSetRGBStrokeColor(context, 0.5, 0.5, 0.5, 3.0);
    CGContextFillRect(context, rectangle);
    CGContextSetLineWidth(context, 5);
    CGContextSetRGBStrokeColor(context, 0.9, 0.9, 0.9, 1.0);
    
    //CGContextRef context = UIGraphicsGetCurrentContext();
    //CGContextAddRect(context, CGRectMake(startPoint.x, startPoint.y, (endPoint.x - startPoint.x), (endPoint.y - startPoint.y)));
    CGContextStrokePath(context);
    
}

-(void)drawElipse:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGPoint p = CGPointMake(rect.size.width, rect.size.height);
    UIBezierPath *arc = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(p.x, p.y, rect.size.width, rect.size.height)];
    CGContextSetLineWidth(context, 25);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    //;
    [arc stroke];
}

-(void)drawSquire:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    int sides = 3;
    double size = 100.0;
    CGPoint center = CGPointMake(160.0, 100.0);
    
    double radius = size / 2.0;
    double theta = 2.0 * M_PI / sides;
    
    CGContextMoveToPoint(context, center.x, center.y-radius);
    for (NSUInteger k=1; k<sides; k++) {
        float x = radius * sin(k * theta);
        float y = radius * cos(k * theta);
        CGContextAddLineToPoint(context, center.x+x, center.y-y);
    }
    CGContextClosePath(context);
    
    
    //CGContextFillPath(context);           // Choose for a filled triangle
    //CGContextSetLineWidth(context, 2); // Choose for a unfilled triangle
    CGContextStrokePath(context);      // Choose for a unfilled triangle
}

@end

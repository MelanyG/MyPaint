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
        self.backgroundColor = [UIColor redColor];
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
            break;
        case rectangle:
            break;
        case elipse:
            break;
        default:
            break;
    }
}

- (void)drawLines:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 5);
    
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
}

-(void)drawTriangle:(CGRect)rect {
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

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
    ellipse,
    rectangle,
    trapeze,
    polygon,
    
}SelectedFigure;

@interface Drawer()

@property(nonatomic, assign)CGPoint startPoint;
@property(nonatomic, assign)CGPoint endPoint;
@property(nonatomic, assign)NSInteger shape;
@property(nonatomic, strong)UIColor* color;

@end

@implementation Drawer



- (instancetype)initWithFrame:(CGRect)frame
                        shape:(int)shape
                        color:(UIColor*)color
                startLocation:(CGPoint)startTap
                  endLocation:(CGPoint)stopTap
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor grayColor];
        self.shape = shape;
        self.color=[UIColor blackColor];
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
        case ellipse:
            [self drawEllipse:rect];
            break;
        case rectangle:
            [self drawRectangle:rect];
            break;
        case trapeze:
            [self drawTrapeze:rect];
            break;
        case polygon:
            [self drawPolygon:rect];
            break;
        default:
            break;
    }
}

- (void)drawLines:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 5);
    CGContextSetStrokeColorWithColor(context, [self.color CGColor]);
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
    CGContextSetStrokeColorWithColor(context, [self.color CGColor]);
    CGContextClosePath(context);
    CGContextSetLineWidth(context, 5);

    //CGContextFillPath(context);           // Choose for a filled triangle
    //CGContextSetLineWidth(context, 2); // Choose for a unfilled triangle
    CGContextStrokePath(context);      // Choose for a unfilled triangle
}

-(void)drawEllipse:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    CGContextSetStrokeColorWithColor(context, [self.color CGColor]);
    CGContextSetLineWidth(context, 5);
    rect.size.width-=5;
    rect.size.height-=5;
    rect.origin.x+=5;
    rect.origin.y+=5;
    CGContextStrokeEllipseInRect(context, rect);
    
    
}

-(void)drawRectangle:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 10);
    
    CGContextSetStrokeColorWithColor(context, [self.color CGColor]);

    
    CGContextAddRect(context, CGRectInset
                     (CGRectMake(0, 0, rect.size.width, rect.size.height),
                      (self.endPoint.x - self.startPoint.x), (self.endPoint.y - self.startPoint.y)));
    CGContextStrokePath(context);
    
}

-(void)drawTrapeze:(CGRect)rect
{
    rect.size.width-=5;
    rect.size.height-=5;
    rect.origin.x+=5;
    rect.origin.y+=5;
    
    UIBezierPath * aPath = [UIBezierPath bezierPath];
    
    // Set the starting point of the shape.
    [aPath moveToPoint:CGPointMake(rect.size.width/3, CGRectGetMinY(rect))];
    
    // Draw some lines.
    [aPath addLineToPoint:CGPointMake((rect.size.width/3)*2, CGRectGetMinY(rect))];
    
    [aPath addLineToPoint:CGPointMake(rect.size.width, rect.size.height)];
    [aPath addLineToPoint:CGPointMake(5, rect.size.height)];
    [aPath closePath];
    
    //set the line width
    aPath.lineWidth = 5;
    
    //set the stoke color
    [[UIColor blackColor] setStroke];
    
    //draw the path
    [aPath stroke];

}

-(void)drawPolygon:(CGRect)rect
{
    rect.size.width-=5;
    rect.size.height-=5;
    rect.origin.x+=5;
    rect.origin.y+=5;
    UIBezierPath * aPath = [UIBezierPath bezierPath];
    
    // Set the starting point of the shape.
    [aPath moveToPoint:CGPointMake(rect.size.width/3, CGRectGetMinY(rect))];
    
    // Draw some lines.
    [aPath addLineToPoint:CGPointMake((rect.size.width/3)*2, CGRectGetMinY(rect))];
    
    [aPath addLineToPoint:CGPointMake(rect.size.width, rect.size.height/3)];
    [aPath addLineToPoint:CGPointMake(rect.size.width, (rect.size.height/3)*2)];
    [aPath addLineToPoint:CGPointMake((rect.size.width/3)*2, rect.size.height)];
    [aPath addLineToPoint:CGPointMake((rect.size.width/3), rect.size.height)];
    [aPath addLineToPoint:CGPointMake((5), (rect.size.height/3)*2)];
    [aPath addLineToPoint:CGPointMake((5), (rect.size.height/3))];
    
    
    //changes start here !
    
    //the point look to be at 80% down
    //[aPath addLineToPoint:CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect) * .8)];
    
    
    //1st arc
    //The end point look to be at 1/4 at left, bottom
    //CGPoint p = CGPointMake(CGRectGetMaxX(rect) / 4, CGRectGetMaxY(rect));
    //CGPoint cp = CGPointMake( (CGRectGetMaxX(rect) / 4) + ((CGRectGetMaxX(rect) - (CGRectGetMaxX(rect) / 4)) / 2) , CGRectGetMaxY(rect) * .8);
    
    //[aPath addQuadCurveToPoint:p controlPoint:cp];
    
    
    //2nd arc
    //The end point look to be at 80% downt at left,
    //CGPoint p2 = CGPointMake(CGRectGetMinX(rect), CGRectGetMaxY(rect) * .8);
    //CGPoint cp2 = CGPointMake( (CGRectGetMaxX(rect) / 4) / 2 , CGRectGetMaxY(rect) * .8);
    
    //[aPath addQuadCurveToPoint:p2 controlPoint:cp2];
    
    
    //close the path
    [aPath closePath];
    
    //set the line width
    aPath.lineWidth = 5;
    
    //set the stoke color
    [[UIColor blackColor] setStroke];
    
    //draw the path
    [aPath stroke];
    
    //UIBezierPath *poly = [[UIBezierPath alloc] init];
    
    ////set the line width
    //poly.lineWidth = 5;
    
    //set the stoke color
    //[[UIColor greenColor] setStroke];
    
   
    //[poly strokeWithBlendMode:normal alpha:0.8];
    //[poly moveToPoint:CGPointMake(0.0, 0.0)];
    //[poly addLineToPoint:CGPointMake(200.0, 0.0)];
    //[poly addLineToPoint:CGPointMake(200.0, 200.0)];
    //[poly closePath];
    //[poly stroke]; // draw stroke
    
  }

@end

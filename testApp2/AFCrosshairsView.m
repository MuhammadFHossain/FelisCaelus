//
//  corsshairs.m
//  testApp2
//
//  Created by Muhammad Farhan Hossain on 12/10/2013.
//  Copyright (c) 2013 Apps Factory. All rights reserved.
//

#import "AFCrosshairsView.h"

@implementation AFCrosshairsView

- (void) drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGFloat height = self.bounds.size.height;
    CGFloat width = self.bounds.size.width;
    CGFloat centerX = width / 2;
    CGFloat centerY = height / 2;
    CGFloat edge = 60;
    
    UIBezierPath *path;
    CGRect pathRect;
    
    // Configure the graphics context.
    [[UIColor colorWithRed:0.5 green:0.5 blue:1 alpha:1] setStroke];
    
    // Draw the square.
    pathRect = CGRectMake(centerX - edge / 2, centerY - edge / 2, edge, edge);
    path = [UIBezierPath bezierPathWithRect:pathRect];
    [path stroke];
    
    // Draw the vertical line.
    path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(centerX, 0)];
    [path addLineToPoint:CGPointMake(centerX, height)];
    [path moveToPoint:CGPointMake(0, centerY)];
    [path addLineToPoint:CGPointMake(width, centerY)];
    [path stroke];
    
}

@end

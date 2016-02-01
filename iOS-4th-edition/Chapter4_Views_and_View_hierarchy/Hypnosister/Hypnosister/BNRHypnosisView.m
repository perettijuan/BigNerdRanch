//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Juan Pablo Peretti on 29/1/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self) {
        // set the background to be a clear background
        self.backgroundColor = [UIColor clearColor];
        // create the instance of the image to show
        _logoImage = [UIImage imageNamed:@"logo.png"];
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    CGRect bounds = self.bounds;
    // figure the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    
    // The largest circle will circumscribe the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    // Instances of this class draw lines and shapes
    UIBezierPath *path = [[UIBezierPath alloc] init];

    for(float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center radius:currentRadius startAngle:0.0 endAngle:M_PI * 2.0 clockwise:YES];
    }
    
    
    path.lineWidth = 10;
    [[UIColor lightGrayColor] setStroke];
    
    // draw the line
    [path stroke];
    
    // draw the image
    [_logoImage drawInRect:rect];
}

@end

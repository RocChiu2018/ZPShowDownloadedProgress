//
//  ZPProgressView.m
//  显示下载进度
//
//  Created by 赵鹏 on 2018/12/26.
//  Copyright © 2018 赵鹏. All rights reserved.
//

#import "ZPProgressView.h"

@implementation ZPProgressView

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    
    /**
     因为只有在"drawRect:"方法内才能够获取到系统创建的图形上下文，正是这个原因所以一般才在此方法内绘制图形；
     不能手动调用"drawRect:"方法，即便手动调用了也不能够绘制出图形，因为没有传入图形上下文，必须调用"setNeedsDisplay"方法才行。
     */
//    [self drawRect:self.bounds];
    
    /**
     手动调用"setNeedsDisplay"方法时，系统会创建与View相关联的图形上下文，然后接着系统会自动调用"drawRect:"方法，把刚才创建的图形上下文传进去，这样才能绘制出图形。
     */
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect
{
    //半径
    CGFloat radius = rect.size.width * 0.5;
    
    //圆心
    CGPoint center = CGPointMake(radius, radius);
    
    //终止弧度
    CGFloat endAngle = - M_PI_2 + self.progress * M_PI * 2;
    
    //创建贝塞尔路径
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:center radius:radius - 2 startAngle:- M_PI_2 endAngle:endAngle clockwise:YES];
    
    //绘制圆弧
    [bezierPath stroke];
}


@end

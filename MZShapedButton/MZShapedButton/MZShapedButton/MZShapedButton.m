//
//  MZShapedButton.m
//  MZShapedButton
//
//  Created by zhangle on 15/12/4.
//  Copyright © 2015年 Machelle. All rights reserved.
//

#import "MZShapedButton.h"

@implementation MZShapedButton

//绘制按钮时添加path遮罩
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CAShapeLayer *shapLayer = [CAShapeLayer layer];
    shapLayer.path = self.path.CGPath;
    self.layer.mask = shapLayer;
}

//覆盖方法，点击时判断点是否在path内，YES则响应，NO则不响应
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    BOOL res = [super pointInside:point withEvent:event];
    if (res)
    {
        if ([self.path containsPoint:point])
        {
            return YES;
        }
        return NO;
    }
    return NO;
}

//- (UIBezierPath *)path
//{
//    if (!_path)
//    {
//        float viewWidth = 100;
//        UIBezierPath *path = [UIBezierPath bezierPath];
//        [path moveToPoint:CGPointMake((sin(M_1_PI / 180 * 60)) * (viewWidth /
//        2), (viewWidth / 4))];
//        [path addLineToPoint:CGPointMake((viewWidth / 2), 0)];
//        [path addLineToPoint:CGPointMake(viewWidth - ((sin(M_1_PI / 180 * 60))
//        * (viewWidth / 2)),
//                                         (viewWidth / 4))];
//        [path addLineToPoint:CGPointMake(viewWidth - ((sin(M_1_PI / 180 * 60))
//        * (viewWidth / 2)),
//                                         (viewWidth / 2) + (viewWidth / 4))];
//        [path addLineToPoint:CGPointMake((viewWidth / 2), viewWidth)];
//        [path addLineToPoint:CGPointMake((sin(M_1_PI / 180 * 60)) * (viewWidth
//        / 2),
//                                         (viewWidth / 2) + (viewWidth / 4))];
//        [path closePath];
//        _path = path;
//    }
//    return _path;
//}

@end

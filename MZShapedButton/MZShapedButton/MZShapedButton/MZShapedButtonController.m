//
//  MZShapedButtonController.m
//  MZShapedButton
//
//  Created by zhangle on 15/12/4.
//  Copyright © 2015年 Machelle. All rights reserved.
//

#import "MZShapedButton.h"
#import "MZShapedButtonController.h"

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

@interface MZShapedButtonController ()

@end

@implementation MZShapedButtonController

- (void)viewDidLoad
{
    //标签1
    UILabel *labelNormal =
        [[UILabel alloc] initWithFrame:CGRectMake(10, 30, SCREEN_WIDTH - 10, 20)];
    labelNormal.text = @"普通按钮点击边框外也响应事件，响应区域仍为矩形";
    labelNormal.font = [UIFont fontWithName:@"Arial" size:14.0f];
    [self.view addSubview:labelNormal];

    //普通按钮
    UIButton *btnNromal = [UIButton buttonWithType:UIButtonTypeCustom];
    btnNromal.frame = CGRectMake(50, 70, 100, 100);
    CAShapeLayer *shapLayer = [CAShapeLayer layer];
    shapLayer.path = [[self getPath:1] CGPath];
    btnNromal.layer.mask = shapLayer;
    [btnNromal setTitle:@"普通按钮" forState:UIControlStateNormal];
    [btnNromal addTarget:self
                  action:@selector(btnAction:)
        forControlEvents:UIControlEventTouchUpInside];
    btnNromal.backgroundColor = [UIColor greenColor];
    [self.view addSubview:btnNromal];

    //标签2
    UILabel *labelShaped =
        [[UILabel alloc] initWithFrame:CGRectMake(10, 200, SCREEN_WIDTH - 10, 20)];
    labelShaped.text = @"下面的按钮只在形状内响应，非矩形";
    labelShaped.font = [UIFont fontWithName:@"Arial" size:14.0f];
    [self.view addSubview:labelShaped];

    //六边形
    MZShapedButton *btn1 = [MZShapedButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(50, 250, 100, 100);
    btn1.path = [self getPath:1];
    [btn1 setTitle:@"按钮1" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    btn1.backgroundColor = [UIColor greenColor];
    [self.view addSubview:btn1];

    //五边形
    MZShapedButton *btn2 = [MZShapedButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(160, 250, 100, 90);
    btn2.path = [self getPath:2];
    [btn2 setTitle:@"按钮2" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    btn2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:btn2];

    //随意
    MZShapedButton *btn3 = [MZShapedButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(10, 370, 200, 100);
    btn3.path = [self getPath:3];
    [btn3 setTitle:@"按钮3" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    btn3.backgroundColor = [UIColor greenColor];
    [self.view addSubview:btn3];
}

#pragma mark
#pragma mark Action
//变色响应
- (void)btnAction:(MZShapedButton *)sender
{
    sender.backgroundColor = [UIColor colorWithRed:(arc4random() % 255 + 1) / 255.0
                                             green:(arc4random() % 255 + 1) / 255.0
                                              blue:(arc4random() % 255 + 1) / 255.0
                                             alpha:1.0];
}

#pragma mark
#pragma mark Method
//获取遮罩path
- (UIBezierPath *)getPath:(NSInteger)num
{
    switch (num)
    {
    case 1:
    {
        float viewWidth = 100;
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake((sin(M_1_PI / 180 * 60)) * (viewWidth / 2), (viewWidth / 4))];
        [path addLineToPoint:CGPointMake((viewWidth / 2), 0)];
        [path addLineToPoint:CGPointMake(viewWidth - ((sin(M_1_PI / 180 * 60)) * (viewWidth / 2)),
                                         (viewWidth / 4))];
        [path addLineToPoint:CGPointMake(viewWidth - ((sin(M_1_PI / 180 * 60)) * (viewWidth / 2)),
                                         (viewWidth / 2) + (viewWidth / 4))];
        [path addLineToPoint:CGPointMake((viewWidth / 2), viewWidth)];
        [path addLineToPoint:CGPointMake((sin(M_1_PI / 180 * 60)) * (viewWidth / 2),
                                         (viewWidth / 2) + (viewWidth / 4))];
        [path closePath];
        return path;
    }
    break;
    case 2:
    {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(50.0, 0.0)];
        [path addLineToPoint:CGPointMake(100.0, 35.0)];
        [path addLineToPoint:CGPointMake(80, 90)];
        [path addLineToPoint:CGPointMake(20.0, 90)];
        [path addLineToPoint:CGPointMake(0.0, 35.0)];
        [path closePath];
        return path;
    }
    break;
    case 3:
    {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0, 100)];
        [path addLineToPoint:CGPointMake(20, 0)];
        [path addLineToPoint:CGPointMake(45, 50)];
        [path addLineToPoint:CGPointMake(70, 0)];
        [path addLineToPoint:CGPointMake(150, 30)];
        [path addLineToPoint:CGPointMake(175, 0)];
        [path addLineToPoint:CGPointMake(200, 100)];
        [path closePath];
        return path;
    }
    break;

    default:
        return nil;
        break;
    }
}

@end

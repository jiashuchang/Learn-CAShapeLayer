//
//  ViewController.m
//  CAShapeLayer画图学习
//
//  Created by TianLi on 2018/8/22.
//  Copyright © 2018年 TianLi. All rights reserved.
//


//  学习地址：https://www.jianshu.com/p/139f4fbe7b6b
#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self text6];
}
#pragma mark 颜色说明---矩形为例
- (void)text1{
    // Do any additional setup after loading the view.
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = CGRectMake(375/2, 667/2-50, 100, 100);
    //设置背景色
    //    layer.backgroundColor = [UIColor cyanColor].CGColor;
    //设置描边色
    layer.strokeColor = [UIColor blackColor].CGColor;
    //设置填充色
    layer.fillColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 100, 100)];
    layer.path = path.CGPath;
}
#pragma mark 绘制shape
- (void)text2{
    //绘制矩形
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 100, 100)];
    //绘制圆形路径
    UIBezierPath *path2 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
    //绘制自带圆角的路径
    UIBezierPath *path3 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 100) cornerRadius:30];
    //指定矩形某一个角加圆角（代码示例为左上角）
    UIBezierPath *path4 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 100) byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(50, 50)];
}
#pragma mark 绘制曲线（正弦曲线为例）
- (void)text3{
    UIBezierPath *path = [self startPoint:CGPointMake(50, 300) endPoint:CGPointMake(200, 300) controlPoint:CGPointMake(125, 200)];
    UIBezierPath *path1 = [self startPoint:CGPointMake(200, 300) endPoint:CGPointMake(350, 300) controlPoint:CGPointMake(275, 400)];
    CAShapeLayer *layer = [self createShapeLayer:[UIColor orangeColor]];
    layer.path = path.CGPath;
    CAShapeLayer *layer1 = [self createShapeLayer:[UIColor greenColor]];
    layer1.path = path1.CGPath;
    
    //    ////结束点、两个控制点
    //    [path addCurveToPoint:CGPointMake(330, 667/2) controlPoint1:CGPointMake(125, 200) controlPoint2:CGPointMake(185, 450)];
    
}
/**
 配置贝塞尔曲线
 
 @param startPoint 起始点
 @param endPoint 结束点
 @param controlPoint 控制点
 @return UIBezierPath对象
 */
- (UIBezierPath *)startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:startPoint];
    [path addQuadCurveToPoint:endPoint controlPoint:controlPoint];
    return path;
}
- (CAShapeLayer *)createShapeLayer:(UIColor *)color{
    CAShapeLayer *layer = [CAShapeLayer layer];
    //    layer.frame = CGRectMake(0, 0, 50, 50);
    //设置背景色
    //    layer.backgroundColor = [UIColor cyanColor].CGColor;
    //设置描边色
    layer.strokeColor = [UIColor blackColor].CGColor;
    //设置填充色
    layer.fillColor = color.CGColor;
    [self.view.layer addSublayer:layer];
    return layer;
}
#pragma mark 直线动画
- (void)text4{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 200)];
    [path addLineToPoint:CGPointMake(100, 200)];
    [path addLineToPoint:CGPointMake(200, 200)];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    //每次动画的持续时间
    animation.duration = 5;
    //动画起始位置
    animation.fromValue = @(0);
    //动画的结束位置
    animation.toValue = @(1);
    //动画的重复次数
    animation.repeatCount = 5;
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.strokeColor = [UIColor blackColor].CGColor;
    layer.fillColor = [UIColor redColor].CGColor;
    layer.lineWidth = 2.0;
    [self.view.layer addSublayer:layer];
    
    layer.path = path.CGPath;
    [layer addAnimation:animation forKey:@"strokeEndAnimation"];
}
#pragma mark 曲线动画
- (void)text5{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 200)];
    [path addQuadCurveToPoint:CGPointMake(100, 200) controlPoint:CGPointMake(50, 100)];
    [path addQuadCurveToPoint:CGPointMake(200, 200) controlPoint:CGPointMake(150, 300)];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.lineWidth = 2.0;
    layer.strokeColor = [UIColor blackColor].CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    [self.view.layer addSublayer:layer];
    layer.path = path.CGPath;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.repeatCount = 5;
    animation.duration = 5;
    animation.fromValue = @(0);
    animation.toValue = @(1);
    [layer addAnimation:animation forKey:@"strokeEndAnimation"];
}
#pragma mark 圆形动画
- (void)text6{
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(375/2-100, 667/2-100, 200, 200)];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 3.0;
    animation.fromValue = @(0);
    animation.toValue = @(1);
    animation.repeatCount = 100;
    
    CAShapeLayer *layer = [self createShapeLayer:[UIColor clearColor]];
    layer.path = path.CGPath;
    layer.lineWidth = 25.0;
    //圆的起始位置，默认为0
    layer.strokeStart = 0;
    //圆的结束位置，默认为1，如果值为0.75，则显示3/4的圆
    layer.strokeEnd = 1;
    [layer addAnimation:animation forKey:@"strokeEndAnimation"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

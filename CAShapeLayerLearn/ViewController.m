//
//  ViewController.m
//  CAShapeLayerLearn
//
//  Created by jglx on 16/11/11.
//  Copyright © 2016年 Organization. All rights reserved.
//

#import "ViewController.h"
#import "CAShapeLayer+MyCAShapeLayer.h"
#include <stdio.h>
#import <stdlib.h>
#import <time.h>
#import <Foundation/Foundation.h>

@interface ViewController ()

@property (nonatomic,strong)UIView * bringView;

@property (nonatomic,strong)CAShapeLayer * refreshLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _bringView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 60, 150)];
    _bringView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_bringView];
    _bringView.layer.cornerRadius = 30;
    _bringView.clipsToBounds = YES;
//    [self testOne];
//    [self testOneOne];
//    [self testTwo];

    [NSTimer scheduledTimerWithTimeInterval:.5 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
    
}

-(void)timerFired:(NSTimer *)timeFired{

   
    NSInteger num = arc4random()%150;
    
    [self refreshUIWithVoicePower:num];
}

-(void)testOne{

    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 50, 150, 150)];
    imageView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:imageView];
    imageView.image = [UIImage imageNamed:@"Pic.jpg"];

}

-(void)testOneOne{
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(200, 50, 150, 150)];
    imageView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:imageView];
    imageView.image = [UIImage imageNamed:@"Pic.jpg"];
    CAShapeLayer * layer = [CAShapeLayer createMaskLayerWithView:imageView];
    imageView.layer.mask = layer;
}

-(void)testTwo{
    
    UIView * demoView = [[UIView alloc] initWithFrame:CGRectMake(40, 200, 50, 50)];
    demoView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:demoView];
    
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = demoView.bounds;
    shapeLayer.strokeEnd = 0.7f;
    shapeLayer.strokeStart = 0.1f;
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:demoView.bounds];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 2.0;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    [demoView.layer addSublayer:shapeLayer];
    
    CABasicAnimation * pathAnima = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnima.duration = 3.0f;
    pathAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    pathAnima.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnima.toValue = [NSNumber numberWithFloat:1.0f];
    pathAnima.fillMode = kCAFillModeForwards;
    pathAnima.removedOnCompletion = NO;
    [shapeLayer addAnimation:pathAnima forKey:@"strokeEndAnimation"];
    
}

-(void)gotoLesionView{
    UIView * bringView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 60, 150)];
    bringView.layer.cornerRadius = 30;
    bringView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:bringView];
    bringView.clipsToBounds = YES;
    
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 60, 150) cornerRadius:0];
    CAShapeLayer * indicateLayer = [CAShapeLayer layer];
    indicateLayer.path = path.CGPath;
    indicateLayer.fillColor = [UIColor redColor].CGColor;
    [bringView.layer addSublayer:indicateLayer];
    
}

-(void)refreshUIWithVoicePower:(float)voicePower{
    [_refreshLayer removeFromSuperlayer];
    _refreshLayer = nil;
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 150 - voicePower, 60, 150) cornerRadius:0];
    _refreshLayer = [CAShapeLayer layer];
    _refreshLayer.path = path.CGPath;
    _refreshLayer.fillColor = [UIColor grayColor].CGColor;
    [_bringView.layer addSublayer:_refreshLayer];
}


@end

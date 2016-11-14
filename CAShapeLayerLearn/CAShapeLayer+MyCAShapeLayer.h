//
//  CAShapeLayer+MyCAShapeLayer.h
//  CAShapeLayerLearn
//
//  Created by jglx on 16/11/11.
//  Copyright © 2016年 Organization. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CAShapeLayer (MyCAShapeLayer)


+(instancetype)createMaskLayerWithView:(UIView *)view;

@end

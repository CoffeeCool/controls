//
//  LaunchImageAnimation.h
//  controls
//
//  Created by Coffee on 15/12/13.
//  Copyright © 2015年 webigstudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LaunchImageAnimationProtocol.h"


@interface LaunchImageAnimation : NSObject<LaunchImageAnimationProtocol>


+ (instancetype)fadeAnimation;


+ (instancetype)fadeScaleAnimation;
+ (instancetype)fadeScaleAnimationWithDelay:(CGFloat)delay;

+ (instancetype)fadeAnimationWithDelay:(CGFloat)delay;

@end


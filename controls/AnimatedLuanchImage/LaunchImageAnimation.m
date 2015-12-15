//
//  LaunchImageAnimation.m
//  controls
//
//  Created by Coffee on 15/12/13.
//  Copyright © 2015年 webigstudio. All rights reserved.
//

#import "LaunchImageAnimation.h"

@interface LaunchImageAnimation()

@property (nonatomic, assign) CGFloat scale;
@property (nonatomic, assign) CGFloat duration;// duration time
@property (nonatomic, assign) CGFloat delay;   // delay hide
@property (nonatomic, assign) UIViewAnimationOptions options; //default is easeInOut

@end

@implementation LaunchImageAnimation

#pragma mark - Instance Maker
+ (instancetype)fadeAnimation
{
    return [[LaunchImageAnimation alloc] initWithDelay:0.2 scale:1.0];
}


+ (instancetype)fadeAnimationWithDelay:(CGFloat)delay
{
    return [[LaunchImageAnimation alloc] initWithDelay:delay scale:1.0];
}

+ (instancetype)fadeScaleAnimation
{
    return [[LaunchImageAnimation alloc] init];
}

+ (instancetype)fadeScaleAnimationWithDelay:(CGFloat)delay
{
    return [[LaunchImageAnimation alloc] initWithDelay:delay scale:1.6];
}
#pragma mark - life cycle
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.scale = 1.6;
        self.duration = 0.4;
        self.delay = 1.0;
        self.options = UIViewAnimationCurveEaseInOut;
    }
    return self;
}

- (instancetype)initWithDelay:(CGFloat)delay scale:(CGFloat)scale
{
    self = [self init];
    if (self) {
        self.delay = delay;
        self.scale = scale;
    }
    return self;
}


#pragma mark - Protocol
- (void)configureAnimationWithView:(UIView *)view completion:(void (^)(BOOL))completion
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    [UIView animateWithDuration:self.duration delay:self.delay options:self.options animations:^{
        view.transform = CGAffineTransformMakeScale(self.scale, self.scale);
        view.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        completion(finished);
        [[UIApplication sharedApplication] setStatusBarHidden:NO];
        [view removeFromSuperview];
    }];
}

@end

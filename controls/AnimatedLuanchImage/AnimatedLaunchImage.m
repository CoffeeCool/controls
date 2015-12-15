//
//  AnimatedLaunchImage.m
//  controls
//
//  Created by Coffee on 15/12/13.
//  Copyright © 2015年 webigstudio. All rights reserved.
//

#import "AnimatedLaunchImage.h"
#import "UIImage+LaunchImageMaker.h"
#import "AnimatedLaunchImageView.h"
#import "LaunchImageAnimation.h"
#define CurrentWindow [[UIApplication sharedApplication].windows firstObject]
@implementation AnimatedLaunchImage

+ (void)fadeScaleAnimateLaunchImage
{
    AnimatedLaunchImageView *animatedLaunchImageView = [[AnimatedLaunchImageView alloc] initWithImage:[UIImage getLaunchImage]];

    id<LaunchImageAnimationProtocol> animation = [LaunchImageAnimation fadeScaleAnimation];

    [self animationView:animatedLaunchImageView showInView:CurrentWindow animation:animation completion:^(BOOL finished) {
        
    }];

}

+ (void)fadeScaleAnimateLaunchImage:(CGFloat)delay
{
    AnimatedLaunchImageView *animatedLaunchImageView = [[AnimatedLaunchImageView alloc] initWithImage:[UIImage getLaunchImage]];
    id<LaunchImageAnimationProtocol> animation = [LaunchImageAnimation fadeScaleAnimationWithDelay:delay];
    [self animationView:animatedLaunchImageView showInView:CurrentWindow animation:animation completion:^(BOOL finished) {
        
    }];
}

+ (void)fadeAnimateLaunchImageWithAdImageUrl:(NSString *)imageUrl
{
    AnimatedLaunchImageView *animatedLaunchImageView = [[AnimatedLaunchImageView alloc] initWithImage:[UIImage getLaunchImage] adImageUrl:imageUrl];
    
    id<LaunchImageAnimationProtocol> animation = [LaunchImageAnimation fadeAnimation];
    
    [self animationView:animatedLaunchImageView showInView:CurrentWindow animation:animation completion:^(BOOL finished) {
        
    }];

}

+ (void)fadeAnimateLaunchImageWithAdImageUrl:(NSString *)imageUrl
                                        delay:(CGFloat)delay
{
    AnimatedLaunchImageView *animatedLaunchImageView = [[AnimatedLaunchImageView alloc] initWithImage:[UIImage getLaunchImage] adImageUrl:imageUrl];
    
    id<LaunchImageAnimationProtocol> animation = [LaunchImageAnimation fadeAnimationWithDelay:delay];
    
    [self animationView:animatedLaunchImageView showInView:CurrentWindow animation:animation completion:^(BOOL finished) {
        
    }];
}

+ (void)animationView:(UIView *)animationView
           showInView:(UIView *)superView
         animation:(id<LaunchImageAnimationProtocol>)animation
        completion:(void (^)(BOOL finished))completion
{
    if (superView == nil) {
        NSLog(@"superView can't nil");
        return;
    }
    superView.hidden = NO;
    [superView addSubview:animationView];
    [superView bringSubviewToFront:animationView];
    
    animationView.frame = superView.bounds;
    
    if (animation && [animation respondsToSelector:@selector(configureAnimationWithView:completion:)]) {
        [animation configureAnimationWithView:animationView completion:completion];
    }else {
        completion(YES);
    }
}

@end

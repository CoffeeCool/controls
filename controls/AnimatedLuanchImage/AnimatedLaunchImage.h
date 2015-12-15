//
//  AnimatedLaunchImage.h
//  controls
//
//  Created by Coffee on 15/12/13.
//  Copyright © 2015年 webigstudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimatedLaunchImage : NSObject

/**
 * 放大淡出展示
 */
+ (void)fadeScaleAnimateLaunchImage;

/**
 * 放大淡出展示，延时
 */
+ (void)fadeScaleAnimateLaunchImage:(CGFloat)delay;

/**
 * 淡出展示附带广告图片
 */
+ (void)fadeAnimateLaunchImageWithAdImageUrl:(NSString *)imageUrl;

/**
 * 淡出展示附带广告图片
 */
+ (void)fadeAnimateLaunchImageWithAdImageUrl:(NSString *)imageUrl
                                       delay:(CGFloat)delay;

@end

//
//  UIImage+LaunchImageMaker.m
//  controls
//
//  Created by Coffee on 15/12/13.
//  Copyright © 2015年 webigstudio. All rights reserved.
//

#import "UIImage+LaunchImageMaker.h"

#define CurrentWindow [[UIApplication sharedApplication].windows firstObject]

@implementation UIImage (LaunchImageMaker)


+ (NSString *)getLaunchImageName
{
    //垂直
    NSString *viewOrientation = @"Portrait";
    //横向
    if (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])) {
        viewOrientation = @"Landscape";
    }
    
    NSString *launchImageName = nil;
    
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    
    CGSize viewSize = CurrentWindow.bounds.size;
    
    for (NSDictionary* dict in imagesDict)
    {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        
        //在启动图片数组中匹配屏幕尺寸和方向
        
        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]])
        {
            launchImageName = dict[@"UILaunchImageName"];
        }
    }
    return launchImageName;
}

+ (UIImage *)getLaunchImage
{
    return [UIImage imageNamed:[self getLaunchImageName]];
}

@end

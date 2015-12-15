//
//  UIImageView+CFWebImage.m
//  controls
//
//  Created by Coffee on 15/12/15.
//  Copyright © 2015年 webigstudio. All rights reserved.
//

#import "UIImageView+CFWebImage.h"
#import "SDWebImageManager.h"
@implementation UIImageView (CFWebImage)

- (void)setOnlineImage:(NSString *)url
{
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    [manager downloadImageWithURL:[NSURL URLWithString:url] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        self.alpha = 0.0;
        self.image = image;
        
        [UIView animateWithDuration:0.3 delay:0.4 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.alpha = 1.0;
        } completion:nil];
    }];
}

@end

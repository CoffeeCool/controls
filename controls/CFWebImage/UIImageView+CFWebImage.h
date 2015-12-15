//
//  UIImageView+CFWebImage.h
//  controls
//
//  Created by Coffee on 15/12/15.
//  Copyright © 2015年 webigstudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (CFWebImage)

/**
 * 设置网络图片，渐进展示
 */
- (void)setOnlineImage:(NSString *)url;

@end

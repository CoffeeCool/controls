//
//  AnimatedLaunchImageView.m
//  controls
//
//  Created by Coffee on 15/12/13.
//  Copyright © 2015年 webigstudio. All rights reserved.
//

#import "AnimatedLaunchImageView.h"
#import "UIImageView+CFWebImage.h"
#define CurrentWindow [[UIApplication sharedApplication].windows firstObject]

@interface AnimatedLaunchImageView()

@property (nonatomic, strong) UIImageView *adImageView;

@end

@implementation AnimatedLaunchImageView

#pragma mark - life cycle 

- (instancetype)initWithImage:(UIImage *)image
{
    self = [super initWithImage:image];
    if (self) {
        self.frame = CurrentWindow.bounds;
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image adImageUrl:(NSString *)adImageUrl
{
    self = [self initWithImage:image];
    if (self) {

        self.adImageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)*0.78);
        [self addSubview:self.adImageView];
        [self.adImageView setOnlineImage:adImageUrl];
        
    }
    return self;
}


@end

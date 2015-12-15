//
//  LaunchImageAnimationProtocol.h
//  controls
//
//  Created by Coffee on 15/12/13.
//  Copyright © 2015年 webigstudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LaunchImageAnimationProtocol <NSObject>

@optional

- (void)configureAnimationWithView:(UIView *)view completion:(void (^)(BOOL finished))completion;

@end




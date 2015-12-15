//
//  ViewControllerOne.m
//  trasitionpractice
//
//  Created by YouLoft_MacMini on 15/11/23.
//  Copyright © 2015年 YouLoft_MacMini. All rights reserved.
//

#import "XWMagicMoveController.h"
#import "XWMagicMoveCell.h"
#import "XWMagicMovePushController.h"

@interface XWMagicMoveController ()<UINavigationControllerDelegate>
@property (nonatomic, assign) BOOL isPulling;
@property (nonatomic, assign) CGFloat lastPosition;

@end

@implementation XWMagicMoveController

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.itemSize = CGSizeMake(150, 180);
    layout.minimumInteritemSpacing = 10;
    layout.minimumLineSpacing = 10;
    self = [super initWithCollectionViewLayout:layout];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"神奇移动";
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerNib:[UINib nibWithNibName:@"XWMagicMoveCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
}

#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (XWMagicMoveCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XWMagicMoveCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    _currentIndexPath = indexPath;
    XWMagicMovePushController *vc = [[XWMagicMovePushController alloc] init];
    //设置导航控制器的代理为推出的控制器，可以达到自定义不同控制器的退出效果的目的
    self.navigationController.delegate = vc;
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat currentPostion = scrollView.contentOffset.y;
    if (currentPostion - self.lastPosition > 1) {
        self.lastPosition = currentPostion;
        self.isPulling = YES;
    }
    else if (self.lastPosition - currentPostion > 1)
    {
        self.lastPosition = currentPostion;
        self.isPulling = NO;
    }
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.isPulling) {
        //转动特效
        CATransform3D rotation;
        rotation = CATransform3DRotate(CATransform3DIdentity, (15.0*M_PI)/180, -0.2, 0, 0);
        rotation.m34 = -0.01;
        
        cell.alpha = 0;
        cell.layer.transform = rotation;
        
        UIViewAnimationOptions option = UIViewAnimationOptionCurveEaseInOut;
        
        [UIView animateWithDuration:0.8 delay:0.0 options:option animations:^{
            cell.layer.transform = CATransform3DIdentity;
            cell.alpha = 1;
        } completion:^(BOOL finished) {
            
        }];
    }
    
}

@end

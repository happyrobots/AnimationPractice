#import <QuartzCore/QuartzCore.h>
#import "PPPopupView.h"

@implementation PPPopupView

- (void)showInView:(UIView *)view {
    __weak PPPopupView *weakSelf = self;
    self.rateItNowButton.alpha = 0;
    self.remindLaterButton.alpha = 0;
    self.messageLabel.alpha = 0;
    [view addSubview:self.rateItNowButton.superview];

    [CATransaction setCompletionBlock:^{
        [UIView animateWithDuration:0.3 animations:^{
            weakSelf.rateItNowButton.alpha = 1;
            weakSelf.remindLaterButton.alpha = 1;
            weakSelf.messageLabel.alpha = 1;
            weakSelf.badgeView.alpha = 1;
        }];
    }];

    [CATransaction begin];
    [CATransaction setAnimationDuration:0.3];
    [weakSelf animateContainerView];
    [weakSelf animateBadgeView];
    [CATransaction commit];
}

- (void)animateContainerView {
    CGPoint containerViewLayerPosition = self.containerView.layer.position;
//    self.containerView.layer.position = CGPointMake(self.containerView.layer.position.x, -self.containerView.layer.frame.size.height*2);

    CAKeyframeAnimation *containerViewBounceAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
    containerViewBounceAnimation.keyTimes = @[@(0), @(0.5), @(0.7), @(0.85),
    @(1)];
    containerViewBounceAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    containerViewBounceAnimation.values = @[
        @(containerViewLayerPosition.y),
        @(containerViewLayerPosition.y-50),
        @(containerViewLayerPosition.y+30),
        @(containerViewLayerPosition.y-10),
        @(containerViewLayerPosition.y)
    ];
    containerViewBounceAnimation.duration = 0.5;
    [self.containerView.layer addAnimation:containerViewBounceAnimation forKey:containerViewBounceAnimation.keyPath];

    CABasicAnimation *containerViewScaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    containerViewScaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    containerViewScaleAnimation.autoreverses = YES;
    containerViewScaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    containerViewScaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.98, 0.98, 0.98)];
    [self.containerView.layer addAnimation:containerViewScaleAnimation forKey:containerViewScaleAnimation.keyPath];
}

- (void)animateBadgeView {
    CABasicAnimation *badgeViewScaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    badgeViewScaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    badgeViewScaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(2, 2, 2)];
    badgeViewScaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    badgeViewScaleAnimation.duration = 0.3;
    badgeViewScaleAnimation.autoreverses = YES;
    [self.badgeView.layer addAnimation:badgeViewScaleAnimation forKey:badgeViewScaleAnimation.keyPath];

    CABasicAnimation *badgeViewFadeAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    badgeViewFadeAnimation.fromValue = @(1);
    badgeViewFadeAnimation.toValue = @(0.5);
    badgeViewFadeAnimation.duration = 0.3;
    badgeViewFadeAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.badgeView.layer addAnimation:badgeViewFadeAnimation forKey:badgeViewFadeAnimation.keyPath];
}

@end

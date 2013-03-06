@interface PPPopupView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *containerView;
@property (weak, nonatomic) IBOutlet UIImageView *badgeView;
@property (weak, nonatomic) IBOutlet UIButton *rateItNowButton;
@property (weak, nonatomic) IBOutlet UIButton *remindLaterButton;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

- (void)showInView:(UIView *)view;
@end

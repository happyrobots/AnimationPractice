#import "PPPopupView.h"
#import "PPAppDelegate.h"

@interface PPAppDelegate ()
@property (strong, nonatomic) PPPopupView *popupView;
@end

@implementation PPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.popupView = [[PPPopupView alloc] initWithFrame:self.window.frame];
    [[NSBundle mainBundle] loadNibNamed:@"PPPopupView" owner:self.popupView options:nil];
    [self.popupView showInView:self.window];
    return YES;
}

@end

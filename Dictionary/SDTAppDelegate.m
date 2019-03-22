#import "SDTAppDelegate.h"
#import "SDTMainViewController.h"
#import "SDTDictionary.h"
#import "SDTDictionaryViewDefinitions.h"
//#import "Flurry.h"
//#import "TestFlight.h"

@implementation SDTAppDelegate
@synthesize background;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

//  [Flurry startSession:@"29W38MKGVJXS7Y92C4ZX"];
//  [TestFlight takeOff:@"3f3a4a0b-47b0-4a35-9049-f69b2c82aa77"];

  [self copyCacheIfNeeded];

  [self setupUIAppearances];

  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.window.rootViewController = [[SDTMainViewController alloc] init];
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
    
//    self.window.clipsToBounds =YES;
    
    int statusBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    [application setStatusBarStyle:UIStatusBarStyleLightContent];
    self.window.frame =  CGRectMake(0,statusBarHeight,self.window.frame.size.width,self.window.frame.size.height-statusBarHeight);
    self.window.bounds = CGRectMake(0, statusBarHeight, self.window.frame.size.width, self.window.frame.size.height);
    
//    UIView *FakeNavBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.window.frame.size.width, statusBarHeight)];
//    FakeNavBar.backgroundColor = [UIColor whiteColor];
    
  return YES;
}


- (void)copyCacheIfNeeded {
  SDTDictionary *dictionary = [SDTDictionary sharedInstance];

  if (![[NSFileManager defaultManager] fileExistsAtPath:dictionary.validTermsCacheFilePath]) {
    NSLog(@"copying valid terms from bundle");
    [[NSFileManager defaultManager] copyItemAtPath:[[NSBundle mainBundle] pathForResource:@"validTerms" ofType:@"txt"]
                                            toPath:dictionary.validTermsCacheFilePath error:nil];
    [dictionary reloadValidTermsCache];
  }

  if (![[NSFileManager defaultManager] fileExistsAtPath:dictionary.invalidTermsCacheFilePath]) {
    NSLog(@"copying invalid terms from bundle");
    [[NSFileManager defaultManager] copyItemAtPath:[[NSBundle mainBundle] pathForResource:@"invalidTerms" ofType:@"txt"]
                                            toPath:dictionary.invalidTermsCacheFilePath error:nil];
    [dictionary reloadInvalidTermsCache];
  }
}


- (void)setupUIAppearances {
  // UISearchBar
  [[UISearchBar appearance] setTintColor:DICTIONARY_BASIC_TINT_COLOR];

  // UIBarButtonItem
  NSDictionary *attributes = @{ UITextAttributeTextColor: DICTIONARY_BASIC_TEXT_COLOR,
                                UITextAttributeTextShadowColor: DICTIONARY_BASIC_TINT_COLOR,
                                UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetMake(0, -1)] };
  [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitleTextAttributes:attributes forState:UIControlStateNormal];

  // UITableViewHeaderFooterView
  UITableViewHeaderFooterView *headerViewProxy = [UITableViewHeaderFooterView appearance];
  headerViewProxy.tintColor = DICTIONARY_BASIC_TEXT_COLOR;

  // UILabel
  UILabel *labelProxy = [UILabel appearanceWhenContainedIn:[UITableViewHeaderFooterView class], nil];
  labelProxy.textColor = DICTIONARY_BASIC_TINT_COLOR;
  labelProxy.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
  labelProxy.shadowOffset = CGSizeZero;
}


@end

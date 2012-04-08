//
//  FaceBookAppDelegate.m
//  FaceBookTestApp
//
//  Created by Dmitriy Starodubtsev on 07.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FaceBookAppDelegate.h"
#import "FaceBookViewController.h"

@implementation FaceBookAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _viewController = [[FaceBookViewController alloc] init];
    _viewController.view.frame = CGRectMake(0, 20, 320, 460);
    _window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window addSubview:self.viewController.view];
    _viewController.view.userInteractionEnabled = YES;
    [self.window makeKeyAndVisible];
   
    return YES; 
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [[_viewController facebook] handleOpenURL:url]; 
}

@end

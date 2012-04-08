//
//  FaceBookAppDelegate.h
//  FaceBookTestApp
//
//  Created by Dmitriy Starodubtsev on 07.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FaceBookViewController.h"

@class FaceBookViewController;
@class Facebook;

@interface FaceBookAppDelegate : UIResponder <UIApplicationDelegate> {
}

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) IBOutlet FaceBookViewController *viewController;

@end

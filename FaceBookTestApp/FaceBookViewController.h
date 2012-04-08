//
//  FaceBookViewController.h
//  FaceBookTestApp
//
//  Created by Dmitriy Starodubtsev on 07.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConnect.h"

@class Facebook;
@class FBLoginButton;

@interface FaceBookViewController : UIViewController <FBSessionDelegate>{
    IBOutlet UIButton *_fbButton;
    IBOutlet UIButton *_publishStreamButton;
    NSArray *_permissions;
}

@property(nonatomic, strong) IBOutlet UILabel *label;
@property(nonatomic, strong) Facebook *facebook;
@property(nonatomic) BOOL isLoggedIn; 

- (IBAction)fbButtonClick:(id)sender;

@end
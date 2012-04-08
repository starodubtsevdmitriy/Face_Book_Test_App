//
//  FaceBookViewController.m
//  FaceBookTestApp
//
//  Created by Dmitriy Starodubtsev on 07.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FaceBookViewController.h"
#import "FBConnect.h"
static NSString* kAppId =  @"321076461279492";

@implementation FaceBookViewController

@synthesize label = _label;
@synthesize facebook = _facebook;
@synthesize isLoggedIn = _isLoggedIn;

/*
 * initialization
 */

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (!kAppId) {
        NSLog(@"missing app id!");
        exit(1);
        return nil;
    }
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        _permissions =  [NSArray arrayWithObjects:
                          @"read_stream", @"offline_access",nil];
    }
    _label = [[UILabel alloc] init];
    _fbButton = [[UIButton alloc] init];
    _publishStreamButton = [[UIButton alloc]init];
    
    return self;
}

/*
 * Set initial view
 */

- (void)viewDidLoad {
    //set the view's background color
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.userInteractionEnabled = YES;
    _facebook = [[Facebook alloc] initWithAppId:kAppId andDelegate:self];
    [self.label setText:@"Please log in"];
    _fbButton.hidden = NO;
    _publishStreamButton.hidden = YES; // Hide Publish Stream button
    _isLoggedIn = NO;
}

/*
 * Show the authorization dialog.
 */

- (void)login {
    [_facebook authorize:_permissions];
}

- (void)logout {
    [_facebook logout:self];
}

/*
 * Processing Publish Stream button is pressed. 
 */

- (IBAction)publishStream:(id)sender {
    SBJSON *jsonWriter = [SBJSON new];
    NSDictionary* actionLinks = [NSArray arrayWithObjects:[NSDictionary dictionaryWithObjectsAndKeys:
                                                           @"Always Running",@"text",@"http://itsti.me/",@"href", nil], nil];
    NSString *actionLinksStr = [jsonWriter stringWithObject:actionLinks];
    NSDictionary* attachment = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"a long run", @"name",
                                @"The Facebook Running app", @"caption",
                                @"it is fun", @"description",
                                @"http://itsti.me/", @"href", nil];
    NSString *attachmentStr = [jsonWriter stringWithObject:attachment];
    NSMutableDictionary* params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   @"Share on Facebook",  @"user_message_prompt",
                                   actionLinksStr, @"action_links",
                                   attachmentStr, @"attachment",
                                   nil];
    [_facebook dialog:@"feed" andParams:params andDelegate:self];
}

/*
 * Processing Facebook button is pressed. 
 */

- (IBAction)fbButtonClick:(id)sender {
    if (_isLoggedIn == YES) {
        [self logout];
        _isLoggedIn = NO;
    } else {
        [self login];
        _isLoggedIn = YES;
    }

}

/*
 * Called when the user has logged in successfully.
 */

- (void)fbDidLogin {
    _publishStreamButton.hidden = NO; // Show Publish Stream button when user login
    [self.label setText:@"logged in"];
}

/*
 * Called when the user canceled the authorization dialog.
 */

-(void)fbDidNotLogin:(BOOL)cancelled {
    NSLog(@"did not login");
}

/*
 * Called when the request logout has succeeded.
 */

- (void)fbDidLogout {
    _publishStreamButton.hidden = YES; // Hide Publish Stream button when user logout
    [self.label setText:@"Please log in"];
}


- (void)viewDidUnload {
    _fbButton = nil;
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];                 // Release any cached data, images, etc that aren't in use.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}



@end

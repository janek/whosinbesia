//
//  VIBELoginViewController.m
//  KtoWBedzi
//
//  Created by Jan Szynal on 03.04.2013.
//  Copyright (c) 2013 PJM. All rights reserved.
//

#import "VIBELoginViewController.h"
#import  <Parse/Parse.h>
#import <QuartzCore/QuartzCore.h>

@interface VIBELoginViewController ()
@property (nonatomic, strong) UIImageView *fieldsBackground;
@end

@implementation VIBELoginViewController


@synthesize fieldsBackground;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.logInView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"yello.png"]]];
    [self.logInView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"vibeLogo.png"]]];
    
    [self.logInView.dismissButton setImage:[UIImage imageNamed:@"Exit.png"] forState:UIControlStateNormal];
    [self.logInView.dismissButton setImage:[UIImage imageNamed:@"ExitDown.png"] forState:UIControlStateHighlighted];
    
//    [self.logInView.facebookButton setImage:nil forState:UIControlStateNormal];
//    [self.logInView.facebookButton setImage:nil forState:UIControlStateHighlighted];
    //[self.logInView.facebookButton setBackgroundImage:[UIImage imageNamed:@"FacebookDown.png"] forState:UIControlStateHighlighted];
   // [self.logInView.facebookButton setBackgroundColor:[UIColor blueColor]];//[UIImage imageNamed:@"default.png"] forState:UIControlStateNormal];
    [self.logInView.logInButton setBackgroundImage:[UIImage imageNamed:@"default.png"] forState:UIControlStateNormal];
    [self.logInView.logInButton setBackgroundImage:[UIImage imageNamed:@"default.png"] forState:UIControlStateHighlighted];
    [self.logInView.logInButton setTitle:@"Log in" forState:UIControlStateNormal];
    [self.logInView.logInButton setTitle:@"Log in" forState:UIControlStateHighlighted];

//    [self.logInView.twitterButton setImage:nil forState:UIControlStateNormal];
//    [self.logInView.twitterButton setImage:nil forState:UIControlStateHighlighted];
//    [self.logInView.twitterButton setBackgroundImage:[UIImage imageNamed:@"Twitter.png"] forState:UIControlStateNormal];
//    [self.logInView.twitterButton setBackgroundImage:[UIImage imageNamed:@"TwitterDown.png"] forState:UIControlStateHighlighted];
//    [self.logInView.twitterButton setTitle:@"" forState:UIControlStateNormal];
//    [self.logInView.twitterButton setTitle:@"" forState:UIControlStateHighlighted];
    
    [self.logInView.signUpButton setBackgroundImage:[UIImage imageNamed:@"default.png"] forState:UIControlStateNormal];
    [self.logInView.signUpButton setBackgroundImage:[UIImage imageNamed:@"default.png"] forState:UIControlStateHighlighted];
    [self.logInView.signUpButton setTitle:@"Sign up!" forState:UIControlStateNormal];
    [self.logInView.signUpButton setTitle:@"Sign up!" forState:UIControlStateHighlighted];
    
    // Add login field background
    fieldsBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LoginFieldBG.png"]];
    [self.logInView addSubview:self.fieldsBackground];
    [self.logInView sendSubviewToBack:self.fieldsBackground];
    self.logInView.externalLogInLabel.text = @"Or sign in via:";
    self.logInView.signUpLabel.layer.opacity = 0;
    
    // Remove text shadow
    CALayer *layer = self.logInView.usernameField.layer;
    layer.shadowOpacity = 0.5f;
    layer = self.logInView.passwordField.layer;
    layer.shadowOpacity = 0.5f;
    layer = self.logInView.logInButton.layer;
    layer.opacity = 0.7;
    layer = self.logInView.signUpButton.layer;
    layer.opacity = 0.7;
    // Set field text color
    [self.logInView.usernameField setTextColor:[UIColor colorWithRed:135.0f/255.0f green:118.0f/255.0f blue:92.0f/255.0f alpha:1.0]];
    [self.logInView.passwordField setTextColor:[UIColor colorWithRed:135.0f/255.0f green:118.0f/255.0f blue:92.0f/255.0f alpha:1.0]];

}

- (void)viewDidLayoutSubviews
{
    // Set frame for elements
    [self.logInView.dismissButton setFrame:CGRectMake(10.0f, 10.0f, 87.5f, 45.5f)];
    [self.logInView.logo setFrame:CGRectMake(60.0, 20.0, (388/2), (156/2))];
    [self.logInView.facebookButton setFrame:CGRectMake(100, 415, 120.0f, 40.0f)];
    [self.logInView.externalLogInLabel setFrame:CGRectMake(100, 380, 120.0f, 40.0f)];
    [self.logInView.twitterButton setFrame:CGRectMake(35.0f+130.0f, 287.0f, 120.0f, 40.0f)];
    [self.logInView.signUpButton setFrame:CGRectMake(35.0f, 300, 255, 40)];
    [self.logInView.logInButton setFrame:CGRectMake(35.0f, 240, 255, 40)];
    [self.fieldsBackground setFrame:CGRectMake(35.0f, 115.0f, 250.0f, 100.0f)];
    [self.logInView setFrame:CGRectMake(0, 0, 640, 1136)];
}




- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) viewWillDisappear:(BOOL)animated
{
    [[PFUser user] setUsername:@"hej"];
    [[PFUser user] setPassword:self.logInView.passwordField.text];
    NSLog(@"%@ %@", [[PFUser user] password], self.logInView.passwordField.text);
        NSLog(@"%@ %@", [[PFUser user] username], self.logInView.usernameField.text);
   // [[PFUser user] signUp];
}

@end

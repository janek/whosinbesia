//
//  VIBEViewController.m
//  KtoWBedzi
//
//  Created by Jan Szynal on 18.03.2013.
//  Copyright (c) 2013 PJM. All rights reserved.
//

#import "VIBEMainViewController.h"
#import <Parse/Parse.h>
#import "VIBELoginViewController.h"
#import "MyLogInViewController.h"

@interface VIBEMainViewController ()

@end

@implementation VIBEMainViewController

- (IBAction)logOutBut:(id)sender
{
     NSLog(@"Log Out");
    [PFUser logOut];
    [self presentLoginViewController];
    
}

- (void)viewDidAppear:(BOOL)animated
{
   [super viewDidAppear:animated];
    
    if (![PFUser currentUser])
    {
        NSLog(@"no user logged in");
        [self presentLoginViewController];
    }
}

- (void)presentLoginViewController
{
    // Create the log in view controller
    VIBELoginViewController *logInViewController = [[VIBELoginViewController alloc] init];
    [logInViewController setDelegate:self]; // Set ourselves as the delegate
    [logInViewController setFacebookPermissions:[NSArray arrayWithObjects:@"friends_about_me", nil]];
    [logInViewController setFields: PFLogInFieldsUsernameAndPassword | PFLogInFieldsLogInButton | PFLogInFieldsFacebook | PFLogInFieldsSignUpButton];
    
    
    // Create the sign up view controller
    PFSignUpViewController *signUpViewController = [[PFSignUpViewController alloc] init];
    [signUpViewController setDelegate:self]; // Set ourselves as the delegate
    
    
    
    
    // Assign our sign up controller to be displayed from the login controller
    [logInViewController setSignUpController:signUpViewController];
    // Present the log in view controller
    [self presentViewController:logInViewController animated:YES completion:NULL];
    
    
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    NSLog(@"user: %@", [PFUser currentUser]);
    //  [[PFUser user] setUsername:@"janekszynal"];
   // [[PFUser user] setPassword:[[PFUser user] objectForKey:@"password"]];
     
    [[PFUser currentUser] signUp];

    // Create request for user's Facebook data
  //  FBRequest *request = [FBRequest requestForMe];
        
    // Send request to Facebook
//    [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
//            if (!error) {
//                // result is a dictionary
//                NSDictionary *userData = (NSDictionary *)result;
//                
//                NSString *facebookID = userData[@"id"];
//              
//                
//                NSDictionary *userProfile = @{
//                                              @"facebookId": facebookID,
//                                              @"name": userData[@"name"],
//                                              @"location": userData[@"location"][@"name"],
//                                              @"gender": userData[@"gender"],
//                                              @"birthday": userData[@"birthday"],
//                                              @"relationship": userData[@"relationship_status"]
//                                              };
//                
//                // Now add the data to the UI elements
//                // ...
//            }
//          NSLog(@"cos sie dzieje");
//        }];
   

}


- (void)myMethod
{
    PFUser *user = [PFUser user];
    user.username = @"my name";
    user.password = @"my pass";
    user.email = @"email@example.com";
    
    // other fields can be set just like with PFObject
    [user setObject:@"415-392-0202" forKey:@"phone"];
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
        } else {
        //    NSString *errorString = [[error userInfo] objectForKey:@"error"];
            // Show the errorString somewhere and let the user try again.
        }
    }];
}
- (IBAction)valChangedTodaySegment:(id)sender
{
    NSString *ans;
    
    switch (self.todaySegment.selectedSegmentIndex)
    {
        case 0:
            ans = @"Yes";
            break;
        case 1:
            ans = @"Maybe";
            
            break;
        case 2:
            ans = @"No";
            
            break;
            
        default:
            break;
    }
    NSLog(@"ans=%@",ans);
    [[PFUser currentUser] setValue:ans forKey:@"Tonight"];
    [[PFUser currentUser] saveInBackground];
}


- (IBAction)valChangedTomorrowSegm:(id)sender
{
    NSString *ans;
    switch (self.tomorrowSegment.selectedSegmentIndex)
    {
        case 0:
             ans = @"Yes";
            
            break;
        case 1:
             ans = @"Maybe";
            
            break;
        case 2:
             ans = @"No";
            
            break;
            
        default:
            break;
    }
      NSLog(@"ans=%@",ans);
    [[PFUser user] setValue:ans forKey:@"Tomorrow"];
    [[PFUser user] saveInBackground];
}



// Sent to the delegate to determine whether the log in request should be submitted to the server.
- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password
{
    // Check if both fields are completed
    if (username && password && username.length != 0 && password.length != 0) {
        return YES; // Begin login process
    }
    
    [[[UIAlertView alloc] initWithTitle:@"Missing Information"
                                message:@"Make sure you fill out all of the information!"
                               delegate:nil
                      cancelButtonTitle:@"ok"
                      otherButtonTitles:nil] show];
    return NO; // Interrupt login process
}

// Sent to the delegate when a PFUser is logged in.
- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}


// Sent to the delegate when the log in attempt fails.
- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error {
    NSLog(@"Failed to log in...");
}

// Sent to the delegate when the log in screen is dismissed.
- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

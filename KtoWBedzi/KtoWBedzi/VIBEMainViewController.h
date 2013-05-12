//
//  VIBEViewController.h
//  KtoWBedzi
//
//  Created by Jan Szynal on 18.03.2013.
//  Copyright (c) 2013 PJM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "VIBELoginViewController.h"

@interface VIBEMainViewController : UIViewController <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *todaySegment;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tomorrowSegment;

@end

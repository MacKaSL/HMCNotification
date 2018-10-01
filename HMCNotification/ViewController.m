//
//  ViewController.m
//  HMCNotification
//
//  Created by Himal Madhushan on 7/24/17.
//  Copyright © 2017 Himal Madhushan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)showNotification:(id)sender {
    [HMCNotification sharedInstance].titleFontColor = [UIColor yellowColor]; // default - black
    [HMCNotification sharedInstance].blurStyle = UIBlurEffectStyleLight; // default - UIBlurEffectStyleExtraLight
    [HMCNotification showCustomPushWithTitle:@"Woohooo" message:@"Congrtaz, It all went successfully. Now you've become a part of iOS dev family" image:[UIImage imageNamed:@"pushIconHappy"]];
    
}

@end

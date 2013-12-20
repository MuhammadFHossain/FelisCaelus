//
//  Felis_FinderViewController.m
//  Felis Caelis
//
//  Created by Muhammad Farhan Hossain on 12/8/2013.
//  Copyright (c) 2013 Apps Factory. All rights reserved.
//

#import "Felis_FinderViewController.h"

@interface Felis_FinderViewController ()
@property (weak, nonatomic) IBOutlet UITextField *Longitude;
@property (weak, nonatomic) IBOutlet UITextField *Latitude;
@property (weak, nonatomic) IBOutlet UIWebView *Loader;
@property (weak, nonatomic) IBOutlet UIButton *Submit;

@end

@implementation Felis_FinderViewController

-(void) fetchAddress: (NSString *)address
{
    NSLog(@"Loading : %@", address);
}

-(IBAction) fetch:(id)sender{
    [self startFetching];
    [self fetchAddress:self.addressField.text];
}

- (void)startFetching
{
    NSLog(@"Fetching..");
    [self.addressField.resignFirstResponder];
    [self.Loader startAnimating];
    self.Submit.endabled = NO;
}

-(void)stopDetching:(NSString *)result
{
    NSLog(@"Done Fetching!");
    self.outputLabel.text = result;
    
}

@end

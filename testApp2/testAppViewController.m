//
//  testAppViewController.m
//  testApp2
//
//  Created by Muhammad Farhan Hossain on 12/10/2013.
//  Copyright (c) 2013 Apps Factory. All rights reserved.
//

#import "testAppViewController.h"

@interface testAppViewController ()

@end

@implementation testAppViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appToBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appReturnsActive) name:UIApplicationDidBecomeActiveNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)appToBackground{
    [_mapView setShowsUserLocation:NO];
}

- (void)appReturnsActive{
    [_mapView setShowsUserLocation:YES];
}


-(void)getImageFromLocation:(id)sender {
    CLLocationCoordinate2D coordinates = self.mapView.centerCoordinate;
    
    NSString *serverAddress = [NSString stringWithFormat:@"http://caf-feliscaelus.herokuapp.com/api/location/getpicture?lat=%f&lon=%f", coordinates.latitude, coordinates.longitude];
    NSURL *serverURL = [[NSURL alloc] initWithString:[serverAddress stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:serverURL];
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *data= [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    UIImage *image = [[UIImage alloc] initWithData:data];
    self.imageView.image = image;
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    [self getImageFromLocation:self];
}

@end

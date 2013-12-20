//
//  testAppViewController.h
//  testApp2
//
//  Created by Muhammad Farhan Hossain on 12/10/2013.
//  Copyright (c) 2013 Apps Factory. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface testAppViewController : UIViewController<MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

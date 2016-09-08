//
//  DetailViewController.h
//  DemoWebServices
//
//  Created by ankur on 26/06/16.
//  Copyright © 2016 ankur. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
@interface DetailViewController : UIViewController

@property (weak ,nonatomic)NSString *name;
@property (weak ,nonatomic)NSString *state;
@property (weak ,nonatomic)NSString *city;
@property (weak ,nonatomic)NSString *zip;
@property (strong, nonatomic) IBOutlet UILabel *lbladd;
@property (strong, nonatomic) IBOutlet UILabel *lblcity;
@property (strong, nonatomic) IBOutlet UILabel *lblstate;
@property (strong, nonatomic) IBOutlet UILabel *lblzip;





@end

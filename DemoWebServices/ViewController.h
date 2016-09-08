//
//  ViewController.h
//  DemoWebServices
//
//  Created by ankur on 23/06/16.
//  Copyright © 2016 ankur. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "customCell.h"
#import "DetailViewController.h"
@interface ViewController : UIViewController <UITableViewDataSource , UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property (weak ,nonatomic)NSString *strName;
@property (weak ,nonatomic)NSString *strAddress;
@property (weak ,nonatomic)NSString *strCity;
@property (weak ,nonatomic)NSString *strZip;


@end


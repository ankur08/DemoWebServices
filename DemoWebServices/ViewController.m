//
//  ViewController.m
//  DemoWebServices
//
//  Created by ankur on 23/06/16.
//  Copyright © 2016 ankur. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableArray *tabledata;
    int i;
}

@end

@implementation ViewController

{
    NSMutableArray *finaldata;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    finaldata = [[NSMutableArray alloc]init];

    NSURL *url = [NSURL URLWithString:@"https://data.colorado.gov/resource/4ykn-tg5h.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSError *error ;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    tabledata  = [ NSJSONSerialization  JSONObjectWithData:data options:nil error:&error ];
    for (i=0; i<tabledata.count; i++)
    {
        NSDictionary *insideArry = [tabledata objectAtIndex:i];
        // jitne bhi array address h sab mmain dictionary fill kar dega
        NSDictionary *takeDictionry = [insideArry objectForKey:@"location"];
        NSString *addressGet = [takeDictionry objectForKey:@"human_address"];
        if (addressGet != NULL) {
            
            NSData *data = [addressGet dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *addressDictionary =[NSJSONSerialization  JSONObjectWithData:data options:nil error:&error];
            [finaldata addObject:addressDictionary];

        }
     }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tabledata count];

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    customCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil)
    {
        cell = [[ UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        // cell = [[NSBundle mainBundle ]loadNibNamed:@"customCell" owner:self options:Nil];
   }
    NSDictionary *persondetail = [finaldata objectAtIndex:indexPath.row];
    cell.textLabel.text = @"Detail";

    return cell ;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *persondetail = [finaldata objectAtIndex:indexPath.row];
    
    DetailViewController *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"detail"];
    detail.name = persondetail[@"'address"];
    detail.city = persondetail[@"city"];
    detail.state = persondetail[@"state"];
    detail.zip = persondetail[@"zip"];
    
    [self.navigationController pushViewController:detail animated:YES];

}

@end

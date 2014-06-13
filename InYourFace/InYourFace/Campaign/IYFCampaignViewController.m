//
//  IYFCampaignViewController.m
//  InYourFace
//
//  Created by Carla G on 2014/06/12.
//  Copyright (c) 2014 sundayTimes. All rights reserved.
//

#import "IYFCampaignViewController.h"
#import <MapKit/MapKit.h>

@interface IYFCampaignViewController ()
@property (nonatomic, strong) NSArray *textArray;
@end

@implementation IYFCampaignViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupTextArray];
    [self.campaignInfoTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tableViewCell"];

    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self setTitle:@"Mud Schools"];
    UIColor *tintColor = [UIColor colorWithRed:0/255.0f green:204/255.0f blue:255/255.0f alpha:1];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName :tintColor};
    [self.navigationController.navigationBar setTintColor:tintColor];
    
    self.campaignImageView.layer.cornerRadius =75;
    self.campaignImageView.layer.masksToBounds = YES;
    
    self.contactButton.layer.borderColor = tintColor.CGColor;
    self.contactButton.layer.borderWidth = 1;
    self.contactButton.layer.cornerRadius = 4;
    
    self.mapButton.layer.borderColor = tintColor.CGColor;
    self.mapButton.layer.borderWidth = 1;
    self.mapButton.layer.cornerRadius = 4;
    
    self.viewVideosButton.layer.borderColor = tintColor.CGColor;
    self.viewVideosButton.layer.borderWidth = 1;
    self.viewVideosButton.layer.cornerRadius = 4;
    
    self.followButton.layer.borderColor = tintColor.CGColor;
    self.followButton.layer.borderWidth = 1;
    self.followButton.layer.cornerRadius = 4;
    
    self.addToCampaignButton.layer.borderColor = tintColor.CGColor;
    self.addToCampaignButton.layer.borderWidth = 1;
    self.addToCampaignButton.layer.cornerRadius = 4;
    
    [self.campaignInfoTableView setBackgroundColor:[UIColor blackColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - table view - 
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.textArray objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor blackColor];
    
    switch (indexPath.row) {
        case 2:
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        case 3:
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        case 4:
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        case 6:
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
            
        default:
            break;
    }
    

    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.textArray count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(void)setupTextArray {
    self.textArray = @[@"Started 13 June 2014", @"Last updated 13 June 2014",@"John Smith", @"Cape Town", @"14 Videos", @"21 Followers", @"Show support"];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 2:
            [self performSegueWithIdentifier:@"viewJohnSmith" sender:self];
            break;
        case 3:
            [self mapTapped];
            break;
        case 4:
            [self performSegueWithIdentifier:@"showVideos" sender:self];
            break;
        case 6:
            [self performSegueWithIdentifier:@"showSupport" sender:self];
            break;
            
        default:
            break;
    }
}


- (void)mapTapped {
    
    //give the user a choice of Apple or Google Maps
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Navigate to Event" delegate:self
                                              cancelButtonTitle:@"Cancel"
                                         destructiveButtonTitle:nil
                                              otherButtonTitles:@"Apple Maps", nil];
    [sheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    //coordinates for the place we want to display
    CLLocationCoordinate2D baxterLocation = CLLocationCoordinate2DMake(-33.9253,18.4239);
    if (buttonIndex==0) {
        //Apple Maps, using the MKMapItem class
        MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:baxterLocation addressDictionary:nil];
        MKMapItem *item = [[MKMapItem alloc] initWithPlacemark:placemark];
        item.name = @"Cape Town";
        [item openInMapsWithLaunchOptions:nil];
    } else if (buttonIndex==1) {
        //Google Maps
        //construct a URL using the comgooglemaps schema
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"comgooglemaps://?center=%f,%f",baxterLocation.latitude,baxterLocation.longitude]];
        if (![[UIApplication sharedApplication] canOpenURL:url]) {
            NSLog(@"Google Maps app is not installed");
            //left as an exercise for the reader: open the Google Maps mobile website instead!
        } else {
            [[UIApplication sharedApplication] openURL:url];
        }
    }
}
@end

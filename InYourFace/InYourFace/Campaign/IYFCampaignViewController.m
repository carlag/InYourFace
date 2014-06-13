//
//  IYFCampaignViewController.m
//  InYourFace
//
//  Created by Carla G on 2014/06/12.
//  Copyright (c) 2014 sundayTimes. All rights reserved.
//

#import "IYFCampaignViewController.h"

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
            break;
        case 3:
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

@end

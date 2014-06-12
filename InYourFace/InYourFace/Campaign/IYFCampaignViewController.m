//
//  IYFCampaignViewController.m
//  InYourFace
//
//  Created by Carla G on 2014/06/12.
//  Copyright (c) 2014 sundayTimes. All rights reserved.
//

#import "IYFCampaignViewController.h"

@interface IYFCampaignViewController ()

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
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self setTitle:@"Mud Schools"];
    UIColor *tintColor = [UIColor colorWithRed:0/255.0f green:204/255.0f blue:255/255.0f alpha:1];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName :tintColor};
    [self.navigationController.navigationBar setTintColor:tintColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

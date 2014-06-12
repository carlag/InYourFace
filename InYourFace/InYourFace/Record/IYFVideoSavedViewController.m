//
//  IYFVideoSavedViewController.m
//  InYourFace
//
//  Created by Carla G on 2014/06/13.
//  Copyright (c) 2014 sundayTimes. All rights reserved.
//

#import "IYFVideoSavedViewController.h"

@interface IYFVideoSavedViewController ()
@property (weak, nonatomic) IBOutlet UIButton *viewCampaignButton;

@end

@implementation IYFVideoSavedViewController

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
    UIColor *tintColor = [UIColor colorWithRed:255/255.0f green:98/255.0f blue:0/255.0f alpha:1];
    self.viewCampaignButton.layer.borderColor = tintColor.CGColor;
    self.viewCampaignButton.layer.borderWidth = 1;
    self.viewCampaignButton.layer.cornerRadius = 4;
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName :tintColor};
    [self.navigationController.navigationBar setTintColor:tintColor];
    // Do any additional setup after loading the view.
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

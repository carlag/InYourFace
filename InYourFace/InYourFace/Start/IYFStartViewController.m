//
//  IYFStartViewController.m
//  InYourFace
//
//  Created by Carla G on 2014/06/12.
//  Copyright (c) 2014 sundayTimes. All rights reserved.
//

#import "IYFStartViewController.h"

@interface IYFStartViewController ()
@property (weak, nonatomic) IBOutlet UITextField *campaignName;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UIButton *userCity;
@property (weak, nonatomic) IBOutlet UIButton *campaignCategory;

@end

@implementation IYFStartViewController

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
    
    [self setTitle:@"Start a campaign"];
    UIColor *tintColor = [UIColor colorWithRed:174/255.0f green:255/255.0f blue:0 alpha:1];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName :tintColor};
    [self.navigationController.navigationBar setTintColor:tintColor];
    
    self.continueButton.layer.borderColor = tintColor.CGColor;
    self.continueButton.layer.borderWidth = 1;
    self.continueButton.layer.cornerRadius = 4;
    
    self.campaignCategory.layer.borderColor = tintColor.CGColor;
    self.campaignCategory.layer.borderWidth = 1;
    self.campaignCategory.layer.cornerRadius = 4;
    
    self.userCity.layer.borderColor = tintColor.CGColor;
    self.userCity.layer.borderWidth = 1;
    self.userCity.layer.cornerRadius = 4;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
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

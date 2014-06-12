//
//  IYFDiscoverViewController.m
//  InYourFace
//
//  Created by Carla G on 2014/06/12.
//  Copyright (c) 2014 sundayTimes. All rights reserved.
//

#import "IYFDiscoverViewController.h"
#import "IYFVideoPlayViewController.h"

@interface IYFDiscoverViewController ()

@property (nonatomic, strong) NSArray *campaignNames;
@property (nonatomic, assign) UIColor *tintColor;

@end

@implementation IYFDiscoverViewController

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
    [self populateCampaignNames];
    [self setTitle:@"Discover Campaigns"];
    UIColor *tintColor = [UIColor colorWithRed:0/255.0f green:204/255.0f blue:255/255.0f alpha:1];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName :tintColor};
    [self.navigationController.navigationBar setTintColor:tintColor];
    [self.campaignCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];


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

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld", (long)(indexPath.row + 1)]];
    
    UIImageView *imageView = [[UIImageView alloc]init];

    imageView.frame = CGRectMake(0,0, 320, 200);
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    [imageView setImage:image];
    
    UIView *campaignName = [[UIView alloc] initWithFrame:CGRectMake(0, 200 - 50,320, 50)];
    UIColor *backgroundColor = [UIColor darkGrayColor];
    
    campaignName.backgroundColor = [backgroundColor colorWithAlphaComponent:0.7];
    [imageView addSubview:campaignName];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10,0,320-70,50)];
    [label setText:[self.campaignNames objectAtIndex:indexPath.row]];
    UIColor *tintColor = [UIColor colorWithRed:0/255.0f green:204/255.0f blue:255/255.0f alpha:1];
    label.textColor = tintColor;
    
    UILabel *videoCountLabel = [[UILabel alloc]initWithFrame:CGRectMake(320-50, 0, 40, 50)];
    [videoCountLabel setText:[NSString stringWithFormat:@"%ld", (long)(indexPath.row*2 + 14)]];
    videoCountLabel.textColor = tintColor;
    videoCountLabel.textAlignment = NSTextAlignmentRight;

    
    [campaignName addSubview:label];
    [campaignName addSubview:videoCountLabel];
    [cell addSubview:imageView];
    [cell setNeedsLayout];
    
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.item == 0)
    {
        [self performSegueWithIdentifier:@"ViewCampaign" sender:self];
        
        
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    IYFVideoPlayViewController *controller = segue.destinationViewController;
}

-(void)populateCampaignNames {
    self.campaignNames = @[@"Mud Schools", @"Service Delivery", @"Save the Rhinos", @"Healthcare", @"Unemployment", @"Infrastructure", @"School Exams", @"Education", @"Corruption", @"Pick Pockets"];
}

@end

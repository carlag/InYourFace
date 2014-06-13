//
//  IYFPromoteViewController.m
//  InYourFace
//
//  Created by Carla G on 2014/06/13.
//  Copyright (c) 2014 sundayTimes. All rights reserved.
//

#import "IYFPromoteViewController.h"

@interface IYFPromoteViewController ()
@property (nonatomic, strong) NSArray *textArray;

@end

@implementation IYFPromoteViewController

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
    [self.promoteTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"promoteTableViewCell"];
    
    [self setTitle:@"Support"];
    UIColor *tintColor = [UIColor colorWithRed:0/255.0f green:204/255.0f blue:255/255.0f alpha:1];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName :tintColor};
    [self.navigationController.navigationBar setTintColor:tintColor];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - table view -
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"promoteTableViewCell" forIndexPath:indexPath];

    
    UIColor *tintColor = [UIColor colorWithRed:0/255.0f green:204/255.0f blue:255/255.0f alpha:1];
    
    CGRect temp = cell.contentView.frame;
    temp.size.height -=10;
    UIView *cellContainerView =[[UIView alloc]initWithFrame:temp];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 300, 40)];
    label.text =  [self.textArray objectAtIndex:indexPath.row];
    label.textColor = tintColor;
    
    cellContainerView.layer.borderWidth = 1;
    cellContainerView.layer.borderColor = tintColor.CGColor;
    cellContainerView.layer.cornerRadius = 4;
    
    [cellContainerView addSubview:label];
    
    [cell addSubview:cellContainerView];
    cell.backgroundColor = [UIColor blackColor];
    
    switch (indexPath.row) {
        case 2:
            break;
        case 3:
            break;
        case 4:
            break;
        case 6:
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
    self.textArray = @[@"Share", @"Embed Videos", @"Download Videos", @"Add your own Video", @"Get in contact"];
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

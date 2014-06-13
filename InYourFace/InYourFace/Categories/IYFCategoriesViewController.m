//
//  IYFCategoriesViewController.m
//  InYourFace
//
//  Created by Carla G on 2014/06/13.
//  Copyright (c) 2014 sundayTimes. All rights reserved.
//

#import "IYFCategoriesViewController.h"

@interface IYFCategoriesViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray *textArray;
@property (nonatomic, strong) NSMutableArray *selectedArray;

@end

@implementation IYFCategoriesViewController

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
    [self setTitle:@"Categories"];
    UIColor *tintColor = [UIColor colorWithRed:255/255.0f green:98/255.0f blue:0/255.0f alpha:1];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName :tintColor};
    [self.navigationController.navigationBar setTintColor:tintColor];
    
    self.nextButton.layer.borderColor = tintColor.CGColor;
    self.nextButton.layer.borderWidth = 1;
    self.nextButton.layer.cornerRadius = 4;

    [self setupTextArray];
    [self.categoriesTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"categoryTableViewCell"];
    self.selectedArray = [[NSMutableArray alloc]init];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView - 
#pragma mark - table view -
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"categoryTableViewCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.textArray objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor blackColor];
    
    if([self.selectedArray containsObject:[NSString stringWithFormat:@"%ld", (long)indexPath.row]]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
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
    self.textArray = @[@"Education", @"Politics",@"Social Change", @"Health", @"Jobs", @"Service Delivery", @"Corporate", @"Corruption", @"Fraud", @"Crime", @"Injustice", @"Postive", @"Uplifting", @"Inspirational", @"Animals Welfare", @"Children", @"Pensioners"];
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *object =[NSString stringWithFormat:@"%ld", (long)indexPath.row];
    if([self.selectedArray containsObject:object]) {
        [self.selectedArray removeObject:object];
    }
    else {
        [self.selectedArray addObject:object];
    }
    
    [tableView reloadData];
    
}

@end

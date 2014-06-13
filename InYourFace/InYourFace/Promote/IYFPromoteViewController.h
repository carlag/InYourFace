//
//  IYFPromoteViewController.h
//  InYourFace
//
//  Created by Carla G on 2014/06/13.
//  Copyright (c) 2014 sundayTimes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IYFPromoteViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *promoteTableView;

@end

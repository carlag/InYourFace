//
//  IYFDiscoverViewController.h
//  InYourFace
//
//  Created by Carla G on 2014/06/12.
//  Copyright (c) 2014 sundayTimes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IYFDiscoverViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *campaignCollectionView;

@end

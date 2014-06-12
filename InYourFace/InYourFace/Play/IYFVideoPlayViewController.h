//
//  IYFVideoPlayViewController.h
//  InYourFace
//
//  Created by Carla G on 2014/06/12.
//  Copyright (c) 2014 sundayTimes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import <MediaPlayer/MediaPlayer.h>

@interface IYFVideoPlayViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

- (IBAction)playVideo:(id)sender;

// For opening UIImagePickerController
-(BOOL)startMediaBrowserFromViewController:(UIViewController*)controller usingDelegate:(id )delegate;

@end

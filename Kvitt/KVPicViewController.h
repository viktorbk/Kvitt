//
//  KVPicViewController.h
//  Kvitt
//
//  Created by Viktor Kjartansson on 06/04/14.
//  Copyright (c) 2014 Geysir It AS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PictureTableViewController.h"

@interface KVPicViewController : UIViewController

@property (strong, retain) PictureTableViewController *fromView;
@property (strong, retain) NSString *filename;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

//
//  PictureTableViewController.h
//  Kvitt
//
//  Created by Viktor Kjartansson on 05/04/14.
//  Copyright (c) 2014 Geysir It AS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Kvittering.h"

@interface PictureTableViewController : UITableViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

- (IBAction)btnPic:(id)sender;
@property (strong, nonatomic) NSMutableArray<Kvittering> *kvitteringer;

@end

@interface UIImage (UIImageFunctions)
- (void) saveToDisk: (UIImage *)newImage picName:(NSString *)picName;
- (UIImage *) scaleToSize: (CGSize)size;
- (UIImage *) scaleProportionalToSize: (CGSize)size;
@end
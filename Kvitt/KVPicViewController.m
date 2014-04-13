//
//  KVPicViewController.m
//  Kvitt
//
//  Created by Viktor Kjartansson on 06/04/14.
//  Copyright (c) 2014 Geysir It AS. All rights reserved.
//

#import "KVPicViewController.h"
#import <AFNetworking.h>

@interface KVPicViewController ()

@end

@implementation KVPicViewController

@synthesize filename;

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSString *url = @"http://kvitt.al.is/pic/";
    NSString *photoUrl = [url stringByAppendingString:filename];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:photoUrl]];
    
    //CGRect screenRect = [[UIScreen mainScreen] bounds];
    //CGFloat screenWidth = screenRect.size.width;
    //CGFloat screenHeight = screenRect.size.height;
    
    AFHTTPRequestOperation *requestOperation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    requestOperation.responseSerializer = [AFImageResponseSerializer serializer];
    [requestOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Response: %@", responseObject);
        _imageView.image = responseObject;
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Image error: %@", error);
    }];
    [requestOperation start];

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

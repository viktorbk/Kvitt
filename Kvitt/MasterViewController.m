//
//  MasterViewController.m
//  iOS7Sampler
//
//  Created by shuichi on 9/21/13.
//  Copyright (c) 2013 Shuichi Tsutsumi. All rights reserved.
//

#import "MasterViewController.h"


#define kItemKeyTitle       @"title"
#define kItemKeyDescription @"description"
#define kItemKeyClassPrefix @"prefix"


@interface MasterViewController ()
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSString *currentClassName;
@end


@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.items = @[
                   // Dynamic Behaviors
                   @{kItemKeyTitle: @"Privat",
                     kItemKeyDescription: @"Selska, etc...",
                     kItemKeyClassPrefix: @"DynamicBehaviors",
                     },
                   
                   // Speech Synthesis
                   @{kItemKeyTitle: @"Speech Synthesis",
                     kItemKeyDescription: @"Synthesized speech from text using AVSpeechSynthesizer and AVSpeechUtterance.",
                     kItemKeyClassPrefix: @"SpeechSynthesis",
                     },

                   // Custom Transition
                   @{kItemKeyTitle: @"Custom Transition",
                     kItemKeyDescription: @"UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate",
                     kItemKeyClassPrefix: @"CustomTransition",
                     }
                   ];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    // Needed after custome transition
    self.navigationController.delegate = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


// =============================================================================
#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CellIdentifier];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.textColor = [UIColor colorWithRed:51./255.
                                                   green:153./255.
                                                    blue:204./255.
                                                   alpha:1.0];
        cell.detailTextLabel.numberOfLines = 0;
    }
    
	NSDictionary *info = [self.items objectAtIndex:indexPath.row];
    cell.textLabel.text = info[kItemKeyTitle];
    cell.detailTextLabel.text = info[kItemKeyDescription];
    
    return cell;
}


// =============================================================================
#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50.0;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

//    NSDictionary *item = self.items[indexPath.row];
//    NSString *className = [item[kItemKeyClassPrefix] stringByAppendingString:@"ViewController"];
//    
//    if (NSClassFromString(className)) {
//
//        Class aClass = NSClassFromString(className);
//        id instance = [[aClass alloc] init];
//        
//        if ([instance isKindOfClass:[UIViewController class]]) {
//            
//            self.currentClassName = className;
//            
//            UIBarButtonItem *barBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"ViewCode"
//                                                                           style:UIBarButtonItemStylePlain
//                                                                          target:self
//                                                                          action:@selector(viewCodeButtonTapped:)];
//            [(UIViewController *)instance navigationItem].rightBarButtonItem = barBtnItem;
//            [(UIViewController *)instance setTitle:item[kItemKeyTitle]];
//            [self.navigationController pushViewController:(UIViewController *)instance
//                                                 animated:YES];
//        }
//    }
//    
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//}


// =============================================================================
#pragma mark - Actions

- (void)viewCodeButtonTapped:(id)sender {

    NSString *urlStr = [NSString stringWithFormat:@"http://github.com/shu223/iOS7-Sampler/blob/master/iOS7Sampler/SampleViewControllers/%@.m",
                        self.currentClassName];
    NSLog(@"url:%@", urlStr);
    
//    BrowseCodeViewController *codeCtr = [[BrowseCodeViewController alloc] init];
//
//    [codeCtr setTitle:self.currentClassName];
//    [codeCtr setUrlString:urlStr];
//
//    [self.navigationController pushViewController:codeCtr
//                                         animated:YES];
}

@end

//
//  Notifications.m
//  Kvitt
//
//  Created by Viktor Kjartansson on 13/04/14.
//  Copyright (c) 2014 Geysir It AS. All rights reserved.
//

#import "Notifications.h"

@implementation Notifications

- (void)new {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receivedNotification:)
                                                 name:@"Address Found"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receivedNotification:)
                                                 name:@"Not Found"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Address Found" object:self];
}

- (void)receivedNotification:(NSNotification *) notification {
    if ([[notification name] isEqualToString:@"Address Found"]) {
        ;
    } else if ([[notification name] isEqualToString:@"Not Found"]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"No Results Found"
                                                            message:nil delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil, nil];
        [alertView show];
    }
}

@end

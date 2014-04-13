//
//  Kvittering.h
//  Kvitt
//
//  Created by Viktor Kjartansson on 05/04/14.
//  Copyright (c) 2014 Geysir It AS. All rights reserved.
//

#import "JSONModel.h"

@protocol Kvittering @end

@interface Kvittering : JSONModel

@property (assign, nonatomic) NSString* _id;
@property (strong, nonatomic) NSString* date;
@property (strong, nonatomic) NSString* user;
@property (assign, nonatomic) int type;
@property (strong, nonatomic) NSString* filename;

@end

//
//  MMAMainDish.m
//  Homework1
//
//  Created by Student22 on 3/26/15.
//  Copyright (c) 2015 Student22. All rights reserved.
//

#import "MMAMainDish.h"

@implementation MMAMainDish

-(id) init {
    if (self = [super init]){
        self.productName = @"Main dish";
        self.productPrice = [NSNumber numberWithDouble:4.5];
    }
    return self;
}

@end

//
//  MMADessert.m
//  Homework1
//
//  Created by Student22 on 3/26/15.
//  Copyright (c) 2015 Student22. All rights reserved.
//

#import "MMADessert.h"

@implementation MMADessert

-(id) init {
    if (self = [super init]){
        self.productName = @"Dessert";
        self.productPrice = [NSNumber numberWithDouble:1.5];
    }
    return self;
}

@end

//
//  MMACoke.m
//  Homework1
//
//  Created by Student22 on 3/26/15.
//  Copyright (c) 2015 Student22. All rights reserved.
//

#import "MMACoke.h"

@implementation MMACoke

-(id)init {
    if (self = [super init]){
        self.productName = @"Coke";
        self.productPrice = [NSNumber numberWithDouble:2];
    }
    return self;
}

@end

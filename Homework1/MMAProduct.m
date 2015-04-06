//
//  MMAProduct.m
//  Homework1
//
//  Created by Student22 on 3/26/15.
//  Copyright (c) 2015 Student22. All rights reserved.
//

#import "MMAProduct.h"

@implementation MMAProduct

-(NSNumber*)priceInUSD {
    return [NSNumber numberWithDouble:[self.productPrice doubleValue] * 1.09];
}

-(NSNumber*)priceInBGN {
    return [NSNumber numberWithDouble:[self.productPrice doubleValue] * 1.95];
}

@end

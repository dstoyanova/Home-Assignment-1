//
//  MMAProduct.h
//  Homework1
//
//  Created by Student22 on 3/26/15.
//  Copyright (c) 2015 Student22. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMAProduct : NSObject

@property NSString* productName;
@property NSNumber* productPrice;

-(NSNumber*)priceInUSD;
-(NSNumber*)priceInBGN;

@end

//
//  ViewController.h
//  Homework1
//
//  Created by Student22 on 3/26/15.
//  Copyright (c) 2015 Student22. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMAProduct.h"
#import "MMASoup.h"
#import "MMAMainDish.h"
#import "MMADessert.h"
#import "MMACoke.h"

#define HOME_DELIVERY_PRICE 10
#define HOME_DELIVERY_PRICE_USD 10*1.09
#define HOME_DELIVERY_PRICE_BGN 10*1.95

@interface ViewController : UIViewController

/*
 *
 * Properties
 *
 */
@property (weak, nonatomic) IBOutlet UILabel *soup;
@property (weak, nonatomic) IBOutlet UILabel *mainDish;
@property (weak, nonatomic) IBOutlet UILabel *dessert;
@property (weak, nonatomic) IBOutlet UILabel *coke;

@property (weak, nonatomic) IBOutlet UILabel *soupPrice;
@property (weak, nonatomic) IBOutlet UILabel *mainDishPrice;
@property (weak, nonatomic) IBOutlet UILabel *dessertPrice;
@property (weak, nonatomic) IBOutlet UILabel *cokePrice;

@property (weak, nonatomic) IBOutlet UITextField *soupQuantity;
@property (weak, nonatomic) IBOutlet UITextField *mainDishQuantity;
@property (weak, nonatomic) IBOutlet UITextField *dessertQuantity;

@property (weak, nonatomic) IBOutlet UISlider *cokeSlider;

@property (weak, nonatomic) IBOutlet UILabel *homeDeliveryPrice;

@property (weak, nonatomic) IBOutlet UISwitch *homeDeliverySwitch;

@property (weak, nonatomic) IBOutlet UILabel *totalPrice;
/*
 *
 * Methods
 *
 */
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;
- (IBAction)convertToUSD:(id)sender;
- (IBAction)convertInEUR:(id)sender;
- (IBAction)convertToBGN:(id)sender;
- (IBAction)increaseSoupQuantity:(id)sender;
- (IBAction)decreaseSoupQuantity:(id)sender;
- (IBAction)increaseMainDishQuantity:(id)sender;
- (IBAction)decreaseMainDishQuantity:(id)sender;
- (IBAction)increaseDessertQuantity:(id)sender;
- (IBAction)decreaseDessertQuantity:(id)sender;
- (IBAction)cokeSliderChanged:(id)sender;
- (IBAction)calculateTotalPrice:(id)sender;

@end

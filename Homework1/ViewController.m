//
//  ViewController.m
//  Homework1
//
//  Created by Student22 on 3/26/15.
//  Copyright (c) 2015 Student22. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate> {
    MMASoup* pSoup;
    MMAMainDish* pMainDish;
    MMADessert* pDessert;
    MMACoke* pCoke;
    
    // This flag is used basically to determine whether the currency,
    // which has been chosen is EUR (default one), USD or BGN
    int flag;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    flag = 0;
    
    pSoup = [[MMASoup alloc] init];
    pMainDish = [[MMAMainDish alloc] init];
    pDessert = [[MMADessert alloc] init];
    pCoke = [[MMACoke alloc] init];
    
    self.soup.text = [pSoup productName];
    self.mainDish.text = [pMainDish productName];
    self.dessert.text = [pDessert productName];
    self.coke.text = [pCoke productName];
    
    self.soupPrice.text = [NSString stringWithFormat:@"%0.2f EUR", [[pSoup productPrice] doubleValue]];
    self.mainDishPrice.text = [NSString stringWithFormat:@"%0.2f EUR", [[pMainDish productPrice] doubleValue]];
    self.dessertPrice.text = [NSString stringWithFormat:@"%0.2f EUR",[[pDessert productPrice] doubleValue]];
    self.cokePrice.text = [NSString stringWithFormat:@"%0.2f EUR/litre",[[pCoke productPrice] doubleValue]];
    
    self.soupQuantity.text = @"0";
    self.mainDishQuantity.text = @"0";
    self.dessertQuantity.text = @"0";
    
    // User interaction has been disabled in order to
    // prevent typing of incorrect data
    self.soupQuantity.enabled = NO;
    self.mainDishQuantity.enabled = NO;
    self.dessertQuantity.enabled = NO;
    
    self.cokeSlider.minimumValue = 0;
    self.cokeSlider.maximumValue = 2;
    [self.cokeSlider setValue:0 animated:YES];
    
    self.homeDeliveryPrice.text = [NSString stringWithFormat:@"%d EUR", HOME_DELIVERY_PRICE];
    
    self.totalPrice.text = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"Waiting for quantity to be selected.");
    return YES;
}

- (IBAction)convertToUSD:(id)sender {
    flag = 1;
    
    self.soupPrice.text = [NSString stringWithFormat:@"%0.2f USD", [[pSoup priceInUSD] doubleValue]];
    self.mainDishPrice.text = [NSString stringWithFormat:@"%0.2f USD", [[pMainDish priceInUSD] doubleValue]];
    self.dessertPrice.text = [NSString stringWithFormat:@"%0.2f USD",[[pDessert priceInUSD] doubleValue]];
    self.cokePrice.text = [NSString stringWithFormat:@"%0.2f USD/litre",[[pCoke priceInUSD] doubleValue]];
    self.homeDeliveryPrice.text = [NSString stringWithFormat:@"%0.2f USD", HOME_DELIVERY_PRICE_USD];
    
    // If our user changes the currency, which they would like to use,
    // after calculating their final bill, the total sum will be recalculated
    if (![self.totalPrice.text isEqual:@""]) {
        [self calculateTotalPrice:nil];
    }
}

- (IBAction)convertInEUR:(id)sender {
    flag = 0;
    
    self.soupPrice.text = [NSString stringWithFormat:@"%0.2f EUR", [[pSoup productPrice] doubleValue]];
    self.mainDishPrice.text = [NSString stringWithFormat:@"%0.2f EUR", [[pMainDish productPrice] doubleValue]];
    self.dessertPrice.text = [NSString stringWithFormat:@"%0.2f EUR",[[pDessert productPrice] doubleValue]];
    self.cokePrice.text = [NSString stringWithFormat:@"%0.2f EUR/litre",[[pCoke productPrice] doubleValue]];
    self.homeDeliveryPrice.text = [NSString stringWithFormat:@"%0.2d EUR", HOME_DELIVERY_PRICE];
    
    // If our user changes the currency, which they would like to use,
    // after calculating their final bill, the total sum will be recalculated
    if (![self.totalPrice.text isEqual:@""]) {
        [self calculateTotalPrice:nil];
    }
}

- (IBAction)convertToBGN:(id)sender {
    flag = 2;
    
    self.soupPrice.text = [NSString stringWithFormat:@"%0.2f BGN", [[pSoup priceInBGN] doubleValue]];
    self.mainDishPrice.text = [NSString stringWithFormat:@"%0.2f BGN", [[pMainDish priceInBGN] doubleValue]];
    self.dessertPrice.text = [NSString stringWithFormat:@"%0.2f BGN",[[pDessert priceInBGN] doubleValue]];
    self.cokePrice.text = [NSString stringWithFormat:@"%0.2f BGN/litre",[[pCoke priceInBGN] doubleValue]];
    self.homeDeliveryPrice.text = [NSString stringWithFormat:@"%0.2f BGN", HOME_DELIVERY_PRICE_BGN];
    
    // If our user changes the currency, which they would like to use,
    // after calculating their final bill, the total sum will be recalculated
    if (![self.totalPrice.text isEqual:@""]) {
        [self calculateTotalPrice:nil];
    }
}

- (IBAction)increaseSoupQuantity:(id)sender {
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    NSNumber* currentSoupQuantity = [f numberFromString:self.soupQuantity.text];
    if ([currentSoupQuantity intValue] < 10) {
        currentSoupQuantity = [NSNumber numberWithInt:[currentSoupQuantity intValue] + 1];
        self.soupQuantity.text = [NSString stringWithFormat:@"%i",[currentSoupQuantity intValue]];
    }
}

- (IBAction)decreaseSoupQuantity:(id)sender {
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    NSNumber* currentSoupQuantity = [f numberFromString:self.soupQuantity.text];
    if ([currentSoupQuantity intValue] > 0) {
        currentSoupQuantity = [NSNumber numberWithInt:[currentSoupQuantity intValue] - 1];
        self.soupQuantity.text = [NSString stringWithFormat:@"%i",[currentSoupQuantity intValue]];
    }

}

- (IBAction)increaseMainDishQuantity:(id)sender {
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    NSNumber* currentMainDishQuantity = [f numberFromString:self.mainDishQuantity.text];
    if ([currentMainDishQuantity intValue] < 10) {
        currentMainDishQuantity = [NSNumber numberWithInt:[currentMainDishQuantity intValue] + 1];
        self.mainDishQuantity.text = [NSString stringWithFormat:@"%i",[currentMainDishQuantity intValue]];
    }
}

- (IBAction)decreaseMainDishQuantity:(id)sender {
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    NSNumber* currentMainDishQuantity = [f numberFromString:self.mainDishQuantity.text];
    if ([currentMainDishQuantity intValue] > 0) {
        currentMainDishQuantity = [NSNumber numberWithInt:[currentMainDishQuantity intValue] - 1];
        self.mainDishQuantity.text = [NSString stringWithFormat:@"%i",[currentMainDishQuantity intValue]];
    }
}

- (IBAction)increaseDessertQuantity:(id)sender {
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    NSNumber* currentDessertQuantity = [f numberFromString:self.dessertQuantity.text];
    if ([currentDessertQuantity intValue] < 10) {
        currentDessertQuantity = [NSNumber numberWithInt:[currentDessertQuantity intValue] + 1];
        self.dessertQuantity.text = [NSString stringWithFormat:@"%i",[currentDessertQuantity intValue]];
    }
}

- (IBAction)decreaseDessertQuantity:(id)sender {
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    NSNumber* currentDessertQuantity = [f numberFromString:self.dessertQuantity.text];
    if ([currentDessertQuantity intValue] > 0) {
        currentDessertQuantity = [NSNumber numberWithInt:[currentDessertQuantity intValue] - 1];
        self.dessertQuantity.text = [NSString stringWithFormat:@"%i",[currentDessertQuantity intValue]];
    }
}

- (IBAction)cokeSliderChanged:(id)sender {
    // We want only rounded values for our slider,
    // in our case 0, 1, 2 litres of coke
    long roundedValue = lroundf([self.cokeSlider value]);
    [self.cokeSlider setValue:roundedValue animated:YES];
}

- (IBAction)calculateTotalPrice:(id)sender {
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    
    if (flag == 0) {
        double soupPrice = [[pSoup productPrice] doubleValue];
        int soupQuantity = [[f numberFromString:self.soupQuantity.text] intValue];
        double soupTotal = soupQuantity * soupPrice;
        
        double mainDishPrice = [[pMainDish productPrice] doubleValue];
        int mainDishQuantity = [[f numberFromString:self.mainDishQuantity.text] intValue];
        double mainDishTotal = mainDishQuantity * mainDishPrice;
        
        double dessertPrice = [[pDessert productPrice] doubleValue];
        int dessertQuantity = [[f numberFromString:self.dessertQuantity.text] intValue];
        double dessertTotal = dessertQuantity * dessertPrice;
        
        double cokePrice = [[pCoke productPrice] doubleValue];
        int cokeQuantity = [self.cokeSlider value];
        double cokeTotal = cokeQuantity * cokePrice;
        
        double homeDelivery = 0;
        
        if ([self.homeDeliverySwitch isOn]) {
            homeDelivery = HOME_DELIVERY_PRICE;
        }
        
        double total = soupTotal + mainDishTotal + dessertTotal + cokeTotal + homeDelivery;
        
        self.totalPrice.text = [NSString stringWithFormat:@"%0.2f EUR", total];
    }
    else if (flag == 1) {
        double soupPrice = [[pSoup priceInUSD] doubleValue];
        int soupQuantity = [[f numberFromString:self.soupQuantity.text] intValue];
        double soupTotal = soupQuantity * soupPrice;
        
        double mainDishPrice = [[pMainDish priceInUSD] doubleValue];
        int mainDishQuantity = [[f numberFromString:self.mainDishQuantity.text] intValue];
        double mainDishTotal = mainDishQuantity * mainDishPrice;
        
        double dessertPrice = [[pDessert priceInUSD] doubleValue];
        int dessertQuantity = [[f numberFromString:self.dessertQuantity.text] intValue];
        double dessertTotal = dessertQuantity * dessertPrice;
        
        double cokePrice = [[pCoke priceInUSD] doubleValue];
        int cokeQuantity = [self.cokeSlider value];
        double cokeTotal = cokeQuantity * cokePrice;
        
        double homeDelivery = 0;
        
        if ([self.homeDeliverySwitch isOn]) {
            homeDelivery = HOME_DELIVERY_PRICE_USD;
        }
        
        double total = soupTotal + mainDishTotal + dessertTotal + cokeTotal + homeDelivery;
        
        self.totalPrice.text = [NSString stringWithFormat:@"%0.2f USD", total];
    }
    else if (flag == 2) {
        double soupPrice = [[pSoup priceInBGN] doubleValue];
        int soupQuantity = [[f numberFromString:self.soupQuantity.text] intValue];
        double soupTotal = soupQuantity * soupPrice;
        
        double mainDishPrice = [[pMainDish priceInBGN] doubleValue];
        int mainDishQuantity = [[f numberFromString:self.mainDishQuantity.text] intValue];
        double mainDishTotal = mainDishQuantity * mainDishPrice;
        
        double dessertPrice = [[pDessert priceInBGN] doubleValue];
        int dessertQuantity = [[f numberFromString:self.dessertQuantity.text] intValue];
        double dessertTotal = dessertQuantity * dessertPrice;
        
        double cokePrice = [[pCoke priceInBGN] doubleValue];
        int cokeQuantity = [self.cokeSlider value];
        double cokeTotal = cokeQuantity * cokePrice;
        
        double homeDelivery = 0;
        
        if ([self.homeDeliverySwitch isOn]) {
            homeDelivery = HOME_DELIVERY_PRICE_BGN;
        }
        
        double total = soupTotal + mainDishTotal + dessertTotal + cokeTotal + homeDelivery;
        
        self.totalPrice.text = [NSString stringWithFormat:@"%0.2f BGN", total];
    }
    else {
        self.totalPrice.text = @"";
    }
}

@end

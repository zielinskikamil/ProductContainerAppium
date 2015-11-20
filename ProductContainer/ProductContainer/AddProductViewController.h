//
//  AddProductViewController.h
//  ProductContainer
//
//  Created by Kamil Zielinski on 12/11/15.
//  Copyright © 2015 Kamil Zielinski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddProductViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *productNameTextField;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UISwitch *isActiveSwitch;
@property (weak, nonatomic) IBOutlet UISlider *valueSlider;
@property (weak, nonatomic) IBOutlet UILabel *sliderValueTextField;

@end

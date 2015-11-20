//
//  MenuViewController.m
//  ProductContainer
//
//  Created by Kamil Zielinski on 12/11/15.
//  Copyright © 2015 Kamil Zielinski. All rights reserved.
//

#import "MenuViewController.h"
#import "AddProductViewController.h"
#import "ProductsViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface MenuViewController ()

@property (weak, nonatomic) IBOutlet UIButton *productButton;
@property (weak, nonatomic) IBOutlet UIButton *addProductButton;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO ;
    self.title = @"Menu";
    
    self.productButton.layer.borderWidth = 1.0f;
    self.addProductButton.layer.borderWidth = 1.0f;
    
    self.productButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.addProductButton.layer.borderColor = [UIColor blackColor].CGColor;
    
    self.productButton.layer.cornerRadius = 4.0f;
    self.addProductButton.layer.cornerRadius = 4.0f;
}

- (IBAction)productButtonClicked:(id)sender {
    ProductsViewController *productsVC = [[ProductsViewController alloc] init];
    [self.navigationController pushViewController:productsVC animated:YES];
}

- (IBAction)addProductButtonClicked:(id)sender {
    AddProductViewController *addProductVC = [AddProductViewController new];
    [self.navigationController pushViewController:addProductVC animated:YES];
}

@end

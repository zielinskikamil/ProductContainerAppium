//
//  AddProductViewController.m
//  ProductContainer
//
//  Created by Kamil Zielinski on 12/11/15.
//  Copyright © 2015 Kamil Zielinski. All rights reserved.
//

#import "AddProductViewController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "Product.h"

@interface AddProductViewController ()
{
    NSManagedObjectContext *_managedObjectContext;
    int count;
    BOOL isActive;
    double sliderValue;
}
@end

@implementation AddProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Add Product";
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(addProduct)];
    self.navigationItem.rightBarButtonItem = doneButton;
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    _managedObjectContext = appDelegate.managedObjectContext;
    
    count = 0;
    isActive = NO;
    sliderValue = 0.0;
}

- (void)refreshControlls {
    self.countLabel.text = [NSString stringWithFormat:@"%d", count];
    [self.isActiveSwitch setOn:isActive animated:YES];
    self.sliderValueTextField.text = [NSString stringWithFormat:@"%f", sliderValue];
}

- (IBAction)segmentControlValueChanged:(UIStepper *)sender {
    count = sender.value;
    [self refreshControlls];
}

- (IBAction)isActiveSwitchValueChanged:(id)sender {
    if([sender isOn]) {
        isActive = YES;
        NSLog(@"Switch is ON");
    } else{
        isActive = NO;
    }
    [self refreshControlls];
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
    sliderValue = sender.value;
    [self refreshControlls];
}

- (void)addProduct {
    NSLog(@"Add products fired");
    
    NSString *name = self.productNameTextField.text;
    
    if (!name || !name.length) {
        [[[UIAlertView alloc] initWithTitle:@"Warning" message:@"Your product needs a name." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    } else {
        
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Product" inManagedObjectContext:_managedObjectContext];
        
        Product *product = (Product *)[[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:_managedObjectContext];
        
        product.name = name;
        product.count = @(count);
        product.isActive = @(isActive);
        product.value = @(sliderValue);
        
        NSError *error = nil;
        
        if ([_managedObjectContext save:&error]) {
             NSLog(@"Added");
            [self.navigationController popViewControllerAnimated:YES];
        } else {
            if (error) {
                NSLog(@"Unable to save product.");
                NSLog(@"%@, %@", error, error.localizedDescription);
            }
            
            [[[UIAlertView alloc] initWithTitle:@"Warning" message:@"Your product could not be saved." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        }
    }
}

@end

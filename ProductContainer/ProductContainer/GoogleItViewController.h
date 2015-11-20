//
//  GoogleItViewController.h
//  ProductContainer
//
//  Created by Kamil Zielinski on 13/11/15.
//  Copyright © 2015 Kamil Zielinski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@interface GoogleItViewController : UIViewController <UIWebViewDelegate>

-(instancetype)initWithProduct:(Product *)product;

@end

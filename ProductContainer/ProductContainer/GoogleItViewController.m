//
//  GoogleItViewController.m
//  ProductContainer
//
//  Created by Kamil Zielinski on 13/11/15.
//  Copyright © 2015 Kamil Zielinski. All rights reserved.
//

#import "GoogleItViewController.h"
#import "Product.h"

@interface GoogleItViewController ()
{
    Product *_product;
}

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation GoogleItViewController

- (id)initWithProduct:(Product *)product {
    self = [super init];
    if(self){
        _product = product;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSString *fullURL = [NSString stringWithFormat:@"https://www.google.co.uk/search?q=%@", _product.name];
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:requestObj];
}
@end

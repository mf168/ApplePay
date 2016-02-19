//
//  PayViewController.m
//  ApplePay
//
//  Created by apple on 16/2/19.
//  Copyright © 2016年 wff. All rights reserved.
//

#import "PayViewController.h"

@interface PayViewController ()

@end

@implementation PayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"支付" style:UIBarButtonItemStyleDone target:self action:@selector(payClick)];
    self.navigationItem.rightBarButtonItem = addButton;
}


- (void)payClick{
    if([PKPaymentAuthorizationViewController canMakePayments]) {
        PKPaymentSummaryItem *widget = [PKPaymentSummaryItem summaryItemWithLabel:@"Widget"
                                                                            amount:[NSDecimalNumber decimalNumberWithString:@"0.99"]];
        
        PKPaymentRequest *request = [[PKPaymentRequest alloc] init];
        request.countryCode = @"CH";
        request.currencyCode = @"CNY";
        request.supportedNetworks = @[PKPaymentNetworkAmex,PKPaymentNetworkMasterCard,PKPaymentNetworkVisa];
        request.merchantCapabilities = PKMerchantCapabilityEMV;
        request.merchantIdentifier = @"merchant.gn.ApplePay";
        request.paymentSummaryItems = @[widget];
        
        PKPaymentAuthorizationViewController *payMentVc = [[PKPaymentAuthorizationViewController alloc] initWithPaymentRequest:request];
        payMentVc.delegate = self;
        [self presentViewController:payMentVc animated:TRUE completion:nil];
    }else{
        NSLog(@"不支持ApplePay");
    }
}

- (void)paymentAuthorizationViewController:(PKPaymentAuthorizationViewController *)controller
                       didAuthorizePayment:(PKPayment *)payment
                                completion:(void (^)(PKPaymentAuthorizationStatus status))completion
{
    BOOL asyncSuccessful = FALSE;
    
    if(asyncSuccessful) {
        completion(PKPaymentAuthorizationStatusSuccess);
        NSLog(@"Payment was successful");
    } else {
        completion(PKPaymentAuthorizationStatusFailure);
        NSLog(@"Payment was unsuccessful");
    }
}



- (void)paymentAuthorizationViewControllerDidFinish:(PKPaymentAuthorizationViewController *)controller{
    [controller dismissViewControllerAnimated:TRUE completion:nil];
}

//- (void)paymentAuthorizationViewController:(PKPaymentAuthorizationViewController *)controller didSelectPaymentMethod:(PKPaymentMethod *)paymentMethod completion:(void (^)(NSArray<PKPaymentSummaryItem *> * _Nonnull))completion{
//    
//}
//
//- (void) paymentAuthorizationViewController:(PKPaymentAuthorizationViewController *)controller didSelectShippingMethod:(nonnull PKShippingMethod *)shippingMethod completion:(nonnull void (^)(PKPaymentAuthorizationStatus, NSArray<PKPaymentSummaryItem *> * _Nonnull))completion{
//    
//}

@end

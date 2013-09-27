//
//  AccountViewController.h
//  virtualStore
//
//  Created by ioschen on 9/12/13.
//  Copyright (c) 2013 ioschen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountViewController : UIViewController<UIAlertViewDelegate>
{
    UIButton *buttonLeft;
    UIButton *buttonCenter;
    UIButton *buttonRight;
    UILabel *money;
    UILabel *moneyValue;
    UIButton *recharge;//充值按钮
    
    UILabel *label;
    UILabel *label2;
    UIButton *button;
    UIButton *button2;
    NSString *date;
}
@end

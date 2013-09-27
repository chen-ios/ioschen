//
//  OrderFormViewController.h
//  virtualStore
//
//  Created by ioschen on 9/12/13.
//  Copyright (c) 2013 ioschen. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface OrderFormViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *basketTableView;
    
    CGRect frame;
    UIButton *button;
    
    NSMutableDictionary *twoDictionary;
}
@property (strong, nonatomic) NSMutableArray *values;
@end

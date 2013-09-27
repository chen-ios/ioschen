//
//  HomePageViewController.h
//  virtualStore
//
//  Created by ioschen on 9/12/13.
//  Copyright (c) 2013 ioschen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@interface HomePageViewController : UIViewController<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,MBProgressHUDDelegate>
{
//    MBProgressHUD *HUD;
//    MBProgressHUD *HUD2;//本来用的是一个，但是两个容易
//    
//    HUD = [[MBProgressHUD alloc] initWithView:self.view];
//    [self.view addSubview:HUD];
//    HUD.labelText = @"已经放入菜篮";
//    HUD.mode = MBProgressHUDModeText;
//    HUD.xOffset = 0.0f;
//    HUD.yOffset = 150.0f;
//    [HUD showAnimated:YES whileExecutingBlock:^{
//        sleep(1);
//    } completionBlock:^{
//        [HUD removeFromSuperview];
//        HUD = nil;
//    }];
    
    UIScrollView *scrollView;
    UITableView *MytableView;
    NSString *buttonName;//滑动按钮的名字
    UIButton *button;
    
    NSMutableArray *iquantityArray;
}
//上面和下面的申明需要理解,有什么区别
@property (strong, nonatomic) NSMutableArray *listPrice;
@property (strong, nonatomic) NSMutableArray *unitList;
@property (strong, nonatomic) NSMutableArray *imageList;

@property (strong, nonatomic) NSMutableDictionary *testDictTag;

@end
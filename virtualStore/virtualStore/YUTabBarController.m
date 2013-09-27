//
//  YUTabBarController.m
//  virtualStore
//
//  Created by ioschen on 9/13/13.
//  Copyright (c) 2013 ioschen. All rights reserved.
//

#import "YUTabBarController.h"
#import "HomePageViewController.h"
#import "OrderFormViewController.h"
#import "AccountViewController.h"
#import "ElseViewController.h"
@interface YUTabBarController ()

@end

@implementation YUTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    HomePageViewController *home=[[HomePageViewController alloc]init];
//    home.tabBarItem=[[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemDownloads tag:0];
//    home.tabBarItem.badgeValue=@"10";
    
    //    SecondNav * vc2 = [[SecondNav alloc] init];
    //    vc2.tabBarItem=[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:1];
    //    UINavigationController * nav2=[[UINavigationController alloc] initWithRootViewController:vc2];
    
    OrderFormViewController *order=[[OrderFormViewController alloc]init];
    AccountViewController *account=[[AccountViewController alloc]init];
    ElseViewController *elseView=[[ElseViewController alloc]init];
    
    //加入一个数组
    //NSArray *controllers=[NSArray arrayWithObjects:home,order,account,elseView, nil];
    NSArray *controllerArray=[[NSArray alloc]initWithObjects:home,order,account,elseView, nil];
    
    //设置UITabBarController控制器的viewControllers属性为我们之前生成的数组controllerArray
    self.viewControllers=controllerArray;
    //默认选择第2个视图选项卡（索引从0开始的）
    self.selectedIndex=1;
}

//当点击相应得UITabBarItem时被调用
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    switch (item.tag) {
        case 0:
            NSLog(@"0");
            break;
        case 1:
            NSLog(@"1");
            break;
        case 2:
            NSLog(@"2");
            break;
        case 3:
            NSLog(@"3");
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
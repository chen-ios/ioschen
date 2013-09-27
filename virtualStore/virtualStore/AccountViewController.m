//
//  AccountViewController.m
//  virtualStore
//
//  Created by ioschen on 9/12/13.
//  Copyright (c) 2013 ioschen. All rights reserved.
//

#import "AccountViewController.h"
#import "PickerAlertView.h"
@interface AccountViewController ()

@end

@implementation AccountViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"accountGreen.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"accountGray.png"]];
        //self.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"账户" image:[UIImage imageNamed:@"Setting"] tag:2];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self CGRectMakeNavBar];
    [self CGRectMakeButton];
    
    [self CGRectMakeLabel];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(10, 132, 120, 40)];
	label.text = @"开始日期";
	[self.view addSubview:label];
	
	button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	button.frame = CGRectMake(10, 132, 230, 40);
    button.tag=1;
	[button addTarget:self action:@selector(pickerAction) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
    
    label2 = [[UILabel alloc] initWithFrame:CGRectMake(140, 132, 120, 40)];
	label2.text = @"结束日期";
	[self.view addSubview:label2];
	
	button2 = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	button2.frame = CGRectMake(140, 132, 230, 40);
    button2.tag=2;
	[button2 addTarget:self action:@selector(pickerAction2) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button2];
}
#pragma mark -创建View
#pragma mark 创建navbar
-(void)CGRectMakeNavBar
{
    //之所以创建不用320是因为哪天苹果发布大于320的就坑爹了
    CGRect aScreenRect = [[UIScreen mainScreen] bounds];
    UINavigationBar *nav = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, aScreenRect.size.width, 44)];
    UINavigationItem *NavTitle = [[UINavigationItem alloc] initWithTitle:@"虚拟菜场"];
    [nav pushNavigationItem:NavTitle animated:YES];
    [self.view addSubview:nav];
}
-(void)CGRectMakeButton
{
    buttonLeft=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonLeft.frame=CGRectMake(0, 44, self.view.frame.size.width/3, 44);
    [buttonLeft setTitle:@"全部" forState:UIControlStateNormal];
    [buttonLeft addTarget:self action:@selector(touchLeft) forControlEvents:UIControlEventTouchUpInside];
    buttonLeft.backgroundColor=[UIColor redColor];
    [self.view addSubview:buttonLeft];
    
    buttonCenter=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonCenter.frame=CGRectMake(self.view.frame.size.width/3, 44, self.view.frame.size.width/3, 44);
    [buttonCenter setTitle:@"充值记录" forState:UIControlStateNormal];
    [buttonCenter addTarget:self action:@selector(touchCenter) forControlEvents:UIControlEventTouchUpInside];
    buttonCenter.backgroundColor=[UIColor redColor];
    [self.view addSubview:buttonCenter];
    
    buttonRight=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonRight.frame=CGRectMake(2*self.view.frame.size.width/3, 44, self.view.frame.size.width/3, 44);
    [buttonRight setTitle:@"消费记录" forState:UIControlStateNormal];
    [buttonRight addTarget:self action:@selector(touchRight) forControlEvents:UIControlEventTouchUpInside];
    buttonRight.backgroundColor=[UIColor redColor];
    [self.view addSubview:buttonRight];
}
-(void)touchLeft
{
    money.text=@"余额:";
    moneyValue.text=@"495";
}

-(void)touchCenter
{
    money.text=@"总额:";
    moneyValue.text=@"1000";
}
-(void)touchRight
{
    money.text=@"总额:";
    moneyValue.text=@"50";
}

#pragma mark 总额和充值按钮。。。
-(void)CGRectMakeLabel
{
    money=[[UILabel alloc]initWithFrame:CGRectMake(0, 88, self.view.frame.size.width/4, 44)];
    money.text=@"余额:";
    [money setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:money];
    
    moneyValue=[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/4, 88, self.view.frame.size.width/4, 44)];
    moneyValue.text=@"495";
    [moneyValue setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:moneyValue];
    
    recharge=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    recharge.frame=CGRectMake(self.view.frame.size.width/2, 88, self.view.frame.size.width/4, 44);
    [recharge setTitle:@"充值" forState:UIControlStateNormal];
    [self.view addSubview:recharge];
}

- (void)pickerAction {
	PickerAlertView *pickerAlertView = [[PickerAlertView alloc] initWithTitle:@" " message:@" " delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
	[pickerAlertView show];
    label.text=date;
}
- (void)pickerAction2 {
	PickerAlertView *pickerAlertView = [[PickerAlertView alloc] initWithTitle:@" " message:@" " delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
	[pickerAlertView show];
    label2.text=date;
}
#pragma mark UIAlertViewDelegate
- (void)alertView:(PickerAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	NSString *dateFromData = [NSString stringWithFormat:@"%@",alertView.datePickerView.date];
//	NSString *date
    date= [dateFromData substringWithRange:NSMakeRange(0, 10)];
    if (buttonIndex==1) {
        //label.text=date;
    label2.text=date;
//        if (button.state==UIControlStateSelected) {
//            label.text=date;
//            NSLog(@"1111111");
//        }else if (button2.state==UIControlEventTouchUpInside){
//            label2.text=date;
//            NSLog(@"222222");
//        }
    }
	NSLog(@"date %@...%@",date,alertView.datePickerView.date);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
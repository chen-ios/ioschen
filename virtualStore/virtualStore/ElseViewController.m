//
//  ElseViewController.m
//  virtualStore
//
//  Created by ioschen on 9/12/13.
//  Copyright (c) 2013 ioschen. All rights reserved.
//

#import "ElseViewController.h"

@interface ElseViewController ()

@end

@implementation ElseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"elseGreen.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"elseGray.png"]];
        //self.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"其他" image:[UIImage imageNamed:@"Setting"] tag:3];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect aScreenRect = [[UIScreen mainScreen] bounds];
    
    //创建navbar
    UINavigationBar *nav = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, aScreenRect.size.width, 44)];
    //创建navbaritem
    UINavigationItem *NavTitle = [[UINavigationItem alloc] initWithTitle:@"虚拟菜场"];
    
    [nav pushNavigationItem:NavTitle animated:YES];
    
    [self.view addSubview:nav];
    
//    //创建barbutton 创建系统样式的
//    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(navBackBt:)];
//    
//    //设置barbutton
//    NavTitle.leftBarButtonItem = item;
//    [nav setItems:[NSArray arrayWithObject:NavTitle]];
    
    
    otherArray=[NSArray arrayWithObjects:@"个人信息设置",@"消息通知",@"软件升级",@"关于",@"退出登陆", nil];
    otherTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 44, 320, self.view.frame.size.height-44) style:UITableViewStylePlain];
    
    otherTableView.delegate=self;
    otherTableView.dataSource=self;
    [self.view addSubview:otherTableView];
}

#pragma mark -delegate
#pragma mark ....
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [otherArray count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//创建并设置每行显示的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellWithIdentifier];
    }
    NSUInteger row = [indexPath row];
    cell.textLabel.text =[otherArray objectAtIndex:row];
    cell.textLabel.font=[UIFont systemFontOfSize:15];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
//UITableViewCell的样式也是可以进行设置的,如果不能满足项目的需要，可以自定义UITableViewCell的样式
//UITableViewCellStyleDefault

//设置内容缩进
- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [indexPath row];
}
//设置cell的行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

//设置cell的隔行换色
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath row] % 2 == 0) {
        cell.backgroundColor = [UIColor blueColor];
    } else {
        cell.backgroundColor = [UIColor greenColor];
    }
}
////滑动选择的行后删除
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSLog(@"执行删除操作");
//}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

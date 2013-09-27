//
//  HomePageViewController.m
//  virtualStore
//
//  Created by ioschen on 9/12/13.
//  Copyright (c) 2013 ioschen. All rights reserved.
//

#import "HomePageViewController.h"
#import "YUCell.h"
#import "YUAppDelegate.h"//////
@interface HomePageViewController ()

@end

@implementation HomePageViewController
@synthesize unitList;
@synthesize listPrice;
@synthesize imageList;

@synthesize testDictTag;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //[self.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"homeGreen.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"homeGray.png"]];
        
        self.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"选菜" image:[UIImage imageNamed:@"homeGray.png"] tag:0];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.title=@"fddfw";////////
    [self CGRectMakeNavBar];
    [self CGRectMakeButton];
    [self CGRectMakeTabView];
    testDictTag=[[NSMutableDictionary alloc]init];
    iquantityArray=[NSMutableArray arrayWithObjects:@"0",@"0",@"0",@"0",@"0", nil];
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
#pragma mark 创建滑动按钮
-(void)CGRectMakeButton
{
    //设置ScrollView的整体触摸与显示区域,注意 宽 高不要超过 320X480否则会出现无法滚动的情况
    scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 44, self.view.frame.size.width, 44)];
    //设置ScrollView滚动内容的区域,它通常是需要大于ScrollerView的显示区域的
    //这样才有必要在ScrollerView中滚动它      //大小根据button的多少修改
    [scrollView setContentSize:CGSizeMake(320 * 5, 240)];
    //开启滚动分页功能，如果不需要这个功能关闭即可
    [scrollView setPagingEnabled:YES];
    scrollView.backgroundColor=[UIColor redColor];
    //隐藏横向与纵向的滚动条,是否显示水平拖动条,是否显示竖直拖动条
    [scrollView setShowsVerticalScrollIndicator:NO];
    [scrollView setShowsHorizontalScrollIndicator:NO];
    //在本类中代理scrollView的整体事件
    [scrollView setDelegate:self];
    //ContentSize的意思就是它所有内容的大小，这个和它的Frame是不一样的，只有ContentSize的大小大于Frame这样才可以支持拖动。
    CGSize newSize = CGSizeMake(600,0);
    [scrollView setContentSize:newSize];
    [self.view addSubview:scrollView];
    
    for (int i=0; i<10; i++) {
        buttonName=[[NSString alloc]initWithString:[NSString stringWithFormat:@"button%d",i]];
        button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame=CGRectMake(101*i, 0, 100, 44);
        [button setTitle:buttonName forState:UIControlStateNormal];
        button.tag=i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button];
    }
}
-(void)buttonClick:(id)sender
{
    //其他的只需要在这里换数组就行了。数据放在这里，解析成数组。。
    NSLog(@"%d",((UIButton *)sender).tag);
    NSLog(@"ok");
    switch (((UIButton *)sender).tag)
    {
        case 0:
            NSLog(@"%d",((UIButton *)sender).tag);
            break;
        case 1:
            NSLog(@"%d",((UIButton *)sender).tag);
            break;
        case 2:
            NSLog(@"%d",((UIButton *)sender).tag);
            break;
        case 3:
            NSLog(@"%d",((UIButton *)sender).tag);
            break;
        case 4:
            NSLog(@"%d",((UIButton *)sender).tag);
            break;
        default:
            break;
    }

}

#pragma mark 创建变换TabView
-(void)CGRectMakeTabView
{
    MytableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height-132) style:UITableViewStylePlain];
    [MytableView setDelegate:self];
    [MytableView setDataSource:self];
    [self.view addSubview:MytableView];
    
    unitList=[NSMutableArray arrayWithObjects:@"kg",@"g",@"kg",@"g",@"kg", nil];//中文需要看编码
    listPrice=[NSMutableArray arrayWithObjects:@"2",@"4",@"3",@"5",@"6", nil];
    //self.imageList
    
    [self.view addSubview:MytableView];
    MytableView.allowsSelection=NO;//点击没有高亮显示，有时候必须有点击，就要高亮1秒立即灰掉
}

#pragma mark -uitable
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [unitList count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//指定顶部的高度,,heightForFooter
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 95;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *YUCellIdentifier = @"YUCellIdentifier";
    
    static BOOL nibsRegistered = NO;
    if (!nibsRegistered) {
        UINib *nib = [UINib nibWithNibName:@"YUCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:YUCellIdentifier];
        nibsRegistered = YES;
    }
    
    YUCell *cell = [tableView dequeueReusableCellWithIdentifier:YUCellIdentifier];
    if (cell == nil) {
        cell = [[YUCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:YUCellIdentifier];
    }
    cell.yuCellnumber.tag=[indexPath row];
    [cell.yuCellnumber addTarget:self action:@selector(multipleTap:withEvent:) forControlEvents:UIControlEventTouchDown];
    [cell.yuCellnumber addTarget:self action:@selector(multipleTap:withEvent:) forControlEvents:UIControlEventTouchDownRepeat];
    //button长按事件
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(btnLong:)];
    longPress.minimumPressDuration = 0.3; //定义按的时间
    [cell.yuCellnumber addGestureRecognizer:longPress];
    
    cell.name=[listPrice objectAtIndex:indexPath.row];
    cell.dec=[unitList objectAtIndex: indexPath.row];
    cell.image=[UIImage imageNamed:@"sc.png"];
    return cell;
}
-(void)multipleTap:(id)sender withEvent:(UIEvent*)event
{
    UIButton *buttona = (UIButton *)sender;
    UITouch* touch = [[event allTouches] anyObject];
    int number=[[iquantityArray objectAtIndex:buttona.tag]intValue];
    if (touch.tapCount == 2) {
        if (number!=0) {
            number--;
            [iquantityArray removeObjectAtIndex:buttona.tag];
            [iquantityArray insertObject:[NSString stringWithFormat:@"%d",number] atIndex:buttona.tag];
            [testDictTag setObject:[NSString stringWithFormat:@"%d",number] forKey:[NSString stringWithFormat:@"%d",buttona.tag]];
        }
    }else if (touch.tapCount==1){
        number++;
        [iquantityArray removeObjectAtIndex:buttona.tag];
        [iquantityArray insertObject:[NSString stringWithFormat:@"%d",number] atIndex:buttona.tag];
        
        [testDictTag setObject:[NSString stringWithFormat:@"%d",number] forKey:[NSString stringWithFormat:@"%d",buttona.tag]];
    }
    YUAppDelegate *appDelegate=[[UIApplication sharedApplication]delegate];
    
    if ([[testDictTag objectForKey:[NSString stringWithFormat:@"%d",buttona.tag]]isEqualToString:@"0"]) {
        [testDictTag removeObjectForKey:[NSString stringWithFormat:@"%d",buttona.tag]];
    }
    
    appDelegate.myappDictionary=testDictTag;
    NSLog(@"testDictTag %@",appDelegate.myappDictionary);
    
    appDelegate.myapparray=iquantityArray;
    //NSLog(@"*appDelegate %@",appDelegate.myapparray);
    //向通知中心发送消息，因为注册中心是全局的，所以可以向其他类发送注册消息
	[[NSNotificationCenter defaultCenter] postNotificationName:@"cly" object:nil];
}

-(void)btnLong:(UILongPressGestureRecognizer *)gestureRecognizer
{
    if ([gestureRecognizer state] == UIGestureRecognizerStateBegan)
    {
        NSLog(@"长按事件");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
//
//  OrderFormViewController.m
//  virtualStore
//
//  Created by ioschen on 9/12/13.
//  Copyright (c) 2013 ioschen. All rights reserved.
//

#import "OrderFormViewController.h"
#import "YUAppDelegate.h"
@interface OrderFormViewController ()

@end

@implementation OrderFormViewController
@synthesize values;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"orderGreen.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"orderGray.png"]];
        //self.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"菜篮" image:[UIImage imageNamed:@"Setting"] tag:1];
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self CGRectMakeNavBar];
    values=[[NSMutableArray alloc]init];
    
    //设置通知中心
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(test:)
                                                 name:@"cly" object:nil];
    [self CGRectMakeTableView];
    [self CGRectMakeButton];
}
//通知中心接受到消息后，响应该方法
- (void)test:(NSNotification*)notify
{
    YUAppDelegate *appDelegate=[[UIApplication sharedApplication]delegate];
    //twoDictionary=appDelegate.myappDictionary;
    NSLog(@"twoDictionary %@",appDelegate.myappDictionary);
    values=[twoDictionary allValues];
    
    int sum=0;
    //这个循环有点小问题
    for (int i=0; i<[[appDelegate.myappDictionary allValues] count]; i++) {
//        if ([[test objectAtIndex:i]intValue]==0) {
//            [test removeObjectAtIndex:i];
//        }
        //sum=sum+[[twoDictionary objectForKey:[NSString stringWithFormat:@"%d",i]]intValue];
        sum=sum+[[[appDelegate.myappDictionary allValues] objectAtIndex:i]intValue];
    }
    [basketTableView reloadData];
    if (sum==0) {
        self.tabBarItem.badgeValue = nil;
    }else{
        self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",sum];
    }
}

#pragma mark -创建View
#pragma mark 创建navbar
-(void)CGRectMakeNavBar
{
    //之所以创建不用320是因为哪天苹果发布大于320的就坑爹了
    CGRect aScreenRect = [[UIScreen mainScreen] bounds];
    UINavigationBar *nav = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, aScreenRect.size.width, 44)];
    UINavigationItem *NavTitle = [[UINavigationItem alloc] initWithTitle:@"今日菜篮"];
    [nav pushNavigationItem:NavTitle animated:YES];
    [self.view addSubview:nav];
}
-(void)CGRectMakeTableView
{
    frame=CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height);
    basketTableView=[[UITableView alloc]initWithFrame:frame style:UITableViewStylePlain];
    basketTableView.dataSource=self;
    basketTableView.delegate=self;
    basketTableView.allowsSelection=NO;//点击没有高亮显示
//    test;
    [self.view addSubview:basketTableView];
}
-(void)CGRectMakeButton
{
    button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    frame=CGRectMake(100, basketTableView.frame.size.height+100, 120, 44);
    NSLog(@"%f",basketTableView.frame.size.height);
    button.frame=frame;
    [button setTitle:@"下单" forState:UIControlStateNormal];
    [self.view addSubview:button];
}

#pragma mark -tableview
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return [values count];
    YUAppDelegate *appDelegate=[[UIApplication sharedApplication]delegate];
    return [[appDelegate.myappDictionary allValues]count];
    //return [[twoDictionary allValues]count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSUInteger row = [indexPath row];
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        //cell.selectionStyle	= UITableViewCellSelectionStyleNone;
        //	cell.backgroundColor = [UIColor whiteColor];
        
        UIImageView *img = [[UIImageView alloc] init];
        img.frame = CGRectMake(15, 5, 85, 81);
        //img.tag = kImage;
        img.image=[UIImage imageNamed:@"sc.png"];
        [cell.contentView addSubview:img];
        
        UILabel *pricenameLbl = [[UILabel alloc] initWithFrame:CGRectMake(108, 14, 51, 21)];
        pricenameLbl.font = [UIFont systemFontOfSize:14];
        pricenameLbl.text=@"价格";
        [cell.contentView addSubview:pricenameLbl];
        
        UILabel *priceLbl=[[UILabel alloc] initWithFrame:CGRectMake(160, 14, 235, 20)];
        priceLbl.font = [UIFont systemFontOfSize:14];
        priceLbl.text=@"3";
        priceLbl.tag=indexPath.row;
        [cell.contentView addSubview:priceLbl];
        
        UILabel *dwnameeLbl=[[UILabel alloc] initWithFrame:CGRectMake(102, 53, 44, 21)];
        dwnameeLbl.font = [UIFont systemFontOfSize:14];
        dwnameeLbl.text=@"单位";
        [cell.contentView addSubview:dwnameeLbl];
        
        UILabel *dwLbl = [[UILabel alloc] initWithFrame:CGRectMake(160, 54, 235, 20)];
        dwLbl.font = [UIFont systemFontOfSize:14];
        //dwLbl.text=
        dwLbl.tag=indexPath.row;
        [cell.contentView addSubview:dwLbl];
        
        UIButton *NumberBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        NumberBtn.frame=CGRectMake(253, 8, 60, 81);
        NumberBtn.tag=[indexPath row];
        [NumberBtn setTitle:[values objectAtIndex:indexPath.row] forState:UIControlStateNormal];
        [NumberBtn addTarget:self action:@selector(multipleTap:withEvent:) forControlEvents:UIControlEventTouchDown];
        [NumberBtn addTarget:self action:@selector(multipleTap:withEvent:) forControlEvents:UIControlEventTouchDownRepeat];
        //button长按事件
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(btnLong:)];
        longPress.minimumPressDuration = 0.3; //定义按的时间
        [NumberBtn addGestureRecognizer:longPress];
        [cell.contentView addSubview:NumberBtn];
		
    }
	//cell.tag = 1 + [indexPath row];
    
	UILabel *dwLbl = (UILabel *)[cell.contentView viewWithTag:[indexPath row]];
    dwLbl.text=@"kg";
	//dwLbl.text = [theObj valueForKey:@"type"];
	
	//UILabel *priceLbl = (UILabel *)[cell.contentView viewWithTag:[indexPath.row]];
    //priceLbl.text=@"3";
//	NSNumber *nPrice = [theObj valueForKey:@"price"];
//	priceLbl.text = [NSString stringWithFormat:@"￥%d",[nPrice intValue]];
    
    return cell;
        //YUAppDelegate *appDelegate=[[UIApplication sharedApplication]delegate];
    
    //--------------------------从这里就错误了-----------------------------//
    //[cell.clzNumberBtn setTitle:[appDelegate.myappDictionary objectForKey:[NSString stringWithFormat:@"%d",cell.clzNumberBtn.tag]] forState:UIControlStateNormal];
    //-------------------------------------------------------//
    
    
    //if ([NumberBtn.currentTitle isEqual: @"0"])
    //{
//        //获取选中删除行索引值
//        NSInteger row = [indexPath row];
//        //通过获取的索引值删除数组中的值
        
//        [test removeObjectAtIndex:row];
//        //        删除单元格的某一行时，在用动画效果实现删除过程
//        [basketTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        
        //[cell.contentView setHidden:TRUE];
        ////[basketTableView reloadData];
    //}
}
-(void)multipleTap:(id)sender withEvent:(UIEvent*)event
{
    //YUAppDelegate *appDelegate=[[UIApplication sharedApplication]delegate];
    UIButton *buttona = (UIButton *)sender;
    UITouch* touch = [[event allTouches] anyObject];
    NSString *name=buttona.currentTitle;
    int number=[name intValue];
    //int number=[[appDelegate.myappDictionary objectForKey:[NSString stringWithFormat:@"%d",buttona.tag]]intValue];
    if (touch.tapCount == 2) {
        if (number!=0) {
            number--;
            
            //--------------------------从这里就错误了-----------------------------//
            //[appDelegate.myappDictionary setObject:[NSString stringWithFormat:@"%d",number] forKey:[NSString stringWithFormat:@"%d",buttona.tag]];
            [values removeObjectAtIndex:buttona.tag];
            [values insertObject:[NSString stringWithFormat:@"%d",number] atIndex:buttona.tag];
            int badgeValue = [self.tabBarItem.badgeValue intValue];
            if (badgeValue==1) {
                self.tabBarItem.badgeValue = nil;
            }else{
                self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",badgeValue-1];
            }
        }
        [buttona setTitle:[NSString stringWithFormat:@"%d",number] forState:UIControlStateNormal];
        //[buttona setTitle:[appDelegate.myappDictionary objectForKey:[NSString stringWithFormat:@"%d",buttona.tag]] forState:UIControlStateNormal];
    }else if (touch.tapCount==1){
        number++;
        //[muArray replaceObjectAtIndex:3 withObject:@"字符串替换回来"];
        //[appDelegate.myappDictionary setObject:[NSString stringWithFormat:@"%d",number] forKey:[NSString stringWithFormat:@"%d",buttona.tag]];
        
        [values removeObjectAtIndex:buttona.tag];
        [values insertObject:[NSString stringWithFormat:@"%d",number] atIndex:buttona.tag];
        
        [buttona setTitle:[NSString stringWithFormat:@"%d",number] forState:UIControlStateNormal];
        //[buttona setTitle:[appDelegate.myappDictionary objectForKey:[NSString stringWithFormat:@"%d",buttona.tag]] forState:UIControlStateNormal];
        
        int badgeValue = [self.tabBarItem.badgeValue intValue];
        self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",badgeValue+1];
    }

    //判断是否为0
    if ([values containsObject:@"0"]) {
        [values removeObject:@"0"];
    }
    else{
        NSLog(@"没有0");
    }
//    if ([[appDelegate.myappDictionary objectForKey:[NSString stringWithFormat:@"%d",buttona.tag]]isEqualToString:@"0"]) {
//        [appDelegate.myappDictionary removeObjectForKey:[NSString stringWithFormat:@"%d",buttona.tag]];
//    }
    [basketTableView reloadData];
    
    
//[testDictTag setObject:[NSString stringWithFormat:@"%d",number] forKey:[NSString stringWithFormat:@"%d",buttona.tag]];
//}
//if ([[testDictTag objectForKey:[NSString stringWithFormat:@"%d",buttona.tag]]isEqualToString:@"0"]) {
//    [testDictTag removeObjectForKey:[NSString stringWithFormat:@"%d",buttona.tag]];
//}

    
//    YUAppDelegate *appDelegate=[[UIApplication sharedApplication]delegate];
//    //appDelegate.myapparray=[NSMutableArray arrayWithArray:iquantityArray];
//    appDelegate.myapparray=iquantityArray;
//    NSLog(@"*appDelegate %@",appDelegate.myapparray);
//    
//    //向通知中心发送消息，因为注册中心是全局的，所以可以向其他类发送注册消息
//	[[NSNotificationCenter defaultCenter] postNotificationName:@"wangsong" object:nil];
}
    
-(void)btnLong:(UILongPressGestureRecognizer *)gestureRecognizer
{
    if ([gestureRecognizer state] == UIGestureRecognizerStateBegan)
    {
        NSLog(@"长按事件");
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 93;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

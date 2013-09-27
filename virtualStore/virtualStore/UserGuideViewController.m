//
//  UserGuideViewController.m
//  virtualStore
//
//  Created by ioschen on 9/12/13.
//  Copyright (c) 2013 ioschen. All rights reserved.
//

#import "UserGuideViewController.h"
#import "YUTabBarController.h"
@interface UserGuideViewController ()

@end

@implementation UserGuideViewController

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
    //设置ScrollView的整体触摸与显示区域,注意 宽 高不要超过 320X480(4s,4)否则会出现无法滚动的情况
    _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 640)];//iphone5
    //ContentSize的意思就是它所有内容的大小
    [_scrollView setContentSize:CGSizeMake(1280, 640)];
    //开启滚动分页功能，如果不需要这个功能关闭即可
    [_scrollView setPagingEnabled:YES];//视图整页显示
    //[scrollView setBounces:NO]; //避免弹跳效果,避免把根视图露出来
    
    //隐藏横向与纵向的滚动条,是否显示水平拖动条,是否显示竖直拖动条
    [_scrollView setShowsVerticalScrollIndicator:NO];
    [_scrollView setShowsHorizontalScrollIndicator:NO];
    
    //在本类中代理scrollView的整体事件
    [_scrollView setDelegate:self];
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    [imageview setImage:[UIImage imageNamed:@"1.jpg"]];
    [_scrollView addSubview:imageview];
    
    UIImageView *imageview1 = [[UIImageView alloc] initWithFrame:CGRectMake(320, 0, 320, 460)];
    [imageview1 setImage:[UIImage imageNamed:@"2.jpg"]];
    [_scrollView addSubview:imageview1];
    
    UIImageView *imageview2 = [[UIImageView alloc] initWithFrame:CGRectMake(640, 0, 320, 460)];
    [imageview2 setImage:[UIImage imageNamed:@"3.jpg"]];
    [_scrollView addSubview:imageview2];
    
    UIImageView *imageview3 = [[UIImageView alloc] initWithFrame:CGRectMake(960, 0, 320, 460)];
    [imageview3 setImage:[UIImage imageNamed:@"4.jpg"]];
    imageview3.userInteractionEnabled = YES;    //打开imageview3的用户交互;否则下面的button无法响应
    [_scrollView addSubview:imageview3];
    
    //添加图片点击事件，可以看我前面博客http://www.cnblogs.com/ioschen/p/3316593.html
//    UITapGestureRecognizer *tapRecognizer=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ClickEventOnImage:)];
//    imageview3.userInteractionEnabled=YES;
//    [imageview3 addGestureRecognizer:tapRecognizer];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];//在imageview3上加载一个透明的button
    [button setTitle:@"go" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(100, 100, 100, 100)];
    [button setBackgroundColor:[UIColor redColor]];
    [button addTarget:self action:@selector(firstpressed) forControlEvents:UIControlEventTouchUpInside];
    [imageview3 addSubview:button];
    
    [self.view addSubview:_scrollView];
    
    //(还可以配合pagecontroller使用)
}
//-(void) ClickEventOnImage:(id)sender
//{
//    NSLog(@"imageview点击事件ok");
//    HomePageViewController *home=[[HomePageViewController alloc]init];
//    [self presentModalViewController:home animated:YES];
//}
- (void)firstpressed
{
    NSLog(@"ok");
    //点击button跳转到根视图
    YUTabBarController *yu=[[YUTabBarController alloc]init];
    yu.modalPresentationStyle=UIModalPresentationFormSheet;//
    //[self presentModalViewController:home animated:YES];//淘汰了，用什么方法呢
    [self presentViewController:yu animated:YES completion:nil];
}
//------------------
//手指离开屏幕后ScrollView还会继续滚动一段时间只到停止
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"结束滚动后缓冲滚动彻底结束时调用");
}
-(void) scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"结束滚动后开始缓冲滚动时调用");
}
-(void)scrollViewDidScroll:(UIScrollView*)scrollView
{
    NSLog(@"视图滚动中X轴坐标%f",scrollView.contentOffset.x);
    NSLog(@"视图滚动中X轴坐标%f",scrollView.contentOffset.y);
}
-(void)scrollViewWillBeginDragging:(UIScrollView*)scrollView
{
    NSLog(@"滚动视图开始滚动，它只调用一次");
}
-(void)scrollViewDidEndDragging:(UIScrollView*)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"滚动视图结束滚动，它只调用一次");
}
- (void)viewDidUnload
{
    [super viewDidUnload];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
//----------------------------
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
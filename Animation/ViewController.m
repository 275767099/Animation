//
//  ViewController.m
//  Animation
//
//  Created by YSH on 15/7/28.
//  Copyright (c) 2015年 MMXCOO. All rights reserved.
//

#import "ViewController.h"
#import "CATextLayer+NumberJump.h"
#import "POP.h"
#import "Chameleon.h"
#import "TabViewController.h"


#define SCREEN_H [[UIScreen mainScreen]bounds].size.height
#define SCREEN_W [[UIScreen mainScreen]bounds].size.width

#define UPLINE 64
#define DOWNLINE [[UIScreen mainScreen]bounds].size.height

#define VIEW_COLOR [UIColor colorWithRed:37/255.0 green:41/255.0 blue:40/255.0 alpha:1];
#define TEXT_COLOR [UIColor colorWithRed:179/255.0 green:187/255.0 blue:189/255.0 alpha:1];
#define TEXT_COLOR_BG [UIColor colorWithRed:198/255.0 green:176/255.0 blue:255/255.0 alpha:1];
#define TEXT_COLOR_L11 [UIColor colorWithRed:173/255.0 green:229/255.0 blue:254/255.0 alpha:1];
#define TEXT_COLOR_L12 [UIColor colorWithRed:247/255.0 green:192/255.0 blue:181/255.0 alpha:1];
#define TEXT_COLOR_bgL11 [UIColor colorWithRed:53/255.0 green:63/255.0 blue:67/255.0 alpha:1];
#define TEXT_COLOR_bgL12 [UIColor colorWithRed:64/255.0 green:64/255.0 blue:64/255.0 alpha:1];
#define TEXT_COLOR_bgL9 [UIColor colorWithRed:63/255.0 green:64/255.0 blue:84/255.0 alpha:1];

@interface ViewController ()<UIScrollViewDelegate>
{
    UIScrollView * BGScroll;
    NSTimer * myTimer;
    NSMutableArray * array1;
    
    UIImageView * img03;UIImageView * img04;
    UIImageView * img0_3;UIImageView * img0_4;
     UIImageView * img0_03;UIImageView * img0_04;
    UIImageView * img6;UIImageView * img7;
    UIImageView * img_7;UIImageView * img_07;UIImageView * img_007;
//    CGFloat contentOffsetY;
//    CGFloat oldContentOffsetY;
//    CGFloat newContentOffsetY;
//     CATextLayer * lab1;
//     CATextLayer * lab2;
    UILabel * lb19;
    UILabel * lab1;  UILabel * lab2;UILabel * lab3;  UILabel * lab4;
    UILabel * lab5;  UILabel * lab6;UILabel * lab7;  UILabel * lab8;
    UILabel * lab9;  UILabel * lab10;UILabel * lab11; UILabel * lab12;
    
    UIView * View1; UIView * View6;
    UIView * View2; UIView * View7;UIView * View3; UIView * View8;
    UIView * View4; UIView * View9;UIView * View5; UIView * View10;
    UIView * colorView;  UIView * bgColorView; UIView * navView;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:45/255.0 green:49/255.0 blue:52/255.0 alpha:1];
    [self initUI];
    
//    [self animationBegin];
    

}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
     [self animationBegin];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    [self loadAnimation];
    });
    
}

- (void)animationBegin{
    
    [UIView animateWithDuration:0.6 animations:^{
        CGRect rect = BGScroll.frame;
        rect.origin.y = 64;
        BGScroll.frame = rect;
    }];
    
    
    
}
- (void)backBtnClick{
    UIStoryboard * story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController * vc = [story instantiateInitialViewController];
//    TabViewController * vc = [TabViewController new];
          [UIView beginAnimations:@"View Flip" context:nil];
        //动画持续时间
        [UIView setAnimationDuration:1];
        //设置动画的回调函数，设置后可以使用回调方法
        [UIView setAnimationDelegate:nil];
        //设置动画曲线，控制动画速度
        [UIView  setAnimationCurve: UIViewAnimationCurveEaseInOut];
        //设置动画方式，并指出动画发生的位置
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:[[[UIApplication sharedApplication]delegate]window]  cache:YES];
        //提交UIView动画
        [UIView commitAnimations];
    [[[UIApplication sharedApplication]delegate]window].rootViewController = vc;
}


- (void)initUI{
    //    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(chang) name:@"chang" object:nil];
    //    array1 = [NSMutableArray array];
    
    
    
    BGScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, SCREEN_H, SCREEN_W, SCREEN_H)];
    BGScroll.delegate = self;
    
    navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 64)];
    navView.backgroundColor = [UIColor colorWithRed:45/255.0 green:49/255.0 blue:52/255.0 alpha:1];
    //    navView.layer.borderWidth = 0.5;
    navView.layer.borderColor = [UIColor blackColor].CGColor;
    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(10, 20, 50, 30);
//    backBtn.backgroundColor = [UIColor redColor];
    [navView addSubview:backBtn];
    View1 = [[UIView alloc]initWithFrame:CGRectMake(10, 0, (SCREEN_W-30)/2, (SCREEN_W-30)/2-20)];
    View1.backgroundColor = VIEW_COLOR
    
    lab1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, View1.frame.size.width, View1.frame.size.height)];
    lab1.text = @"0";
    lab1.textColor = TEXT_COLOR
    lab1.textAlignment = NSTextAlignmentCenter;
    lab1.font = [UIFont boldSystemFontOfSize:40];
    [View1 addSubview:lab1];
    
    
    View2 = [[UIView alloc]initWithFrame:CGRectMake(View1.frame.size.width+20, 0, (SCREEN_W-30)/2, (SCREEN_W-30)/2-20)];
    View2.backgroundColor = VIEW_COLOR
    
    lab2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,View2.frame.size.width, View2.frame.size.height)];
    lab2.text = @"0";
    lab2.textColor = TEXT_COLOR
    lab2.textAlignment = NSTextAlignmentCenter;
    lab2.font = [UIFont boldSystemFontOfSize:40];
    [View2 addSubview:lab2];
    
    //
    View3 = [[UIView alloc]initWithFrame:CGRectMake(10, View1.frame.origin.y+View1.frame.size.height+10, SCREEN_W-20, View1.frame.size.height-30)];
    View3.backgroundColor = VIEW_COLOR
    
    bgColorView = [[UIView alloc]initWithFrame:CGRectMake(75, View3.frame.size.height/2+5, (SCREEN_W-170), View3.frame.size.height/4-5)];
    bgColorView.layer.masksToBounds = YES;
    bgColorView.layer.cornerRadius = (View3.frame.size.height/4-5)/2;
    
    bgColorView.backgroundColor = [UIColor colorWithGradientStyle:UIGradientStyleLeftToRight
                                                        withFrame:View3.bounds
                                                        andColors:@[[UIColor colorWithRed:0.3 green:0.6 blue:0.8 alpha:1], [UIColor colorWithRed:0.5 green:0.8 blue:0.2 alpha:1]]];
    [View3 addSubview:bgColorView];
    
    colorView = [[UIView alloc]initWithFrame:CGRectMake(75, View3.frame.size.height/2+5, (SCREEN_W-170), View3.frame.size.height/4-5)];
    colorView.layer.masksToBounds = YES;
    colorView.layer.cornerRadius = (View3.frame.size.height/4-5)/2;
    colorView.alpha = 0;
    colorView.backgroundColor = [UIColor colorWithGradientStyle:UIGradientStyleLeftToRight
                                                      withFrame:View3.bounds
                                                      andColors:@[[UIColor colorWithRed:0.3 green:0.2 blue:1 alpha:1], [UIColor colorWithRed:1 green:0.3 blue:0.2 alpha:1]]];
    [View3 addSubview:colorView];
    
    lab3 = [[UILabel alloc]initWithFrame:CGRectMake(35, colorView.frame.origin.y,View3.frame.size.height/4, View3.frame.size.height/4-5)];
    lab3.text = @"0";
    lab3.textColor = [UIColor colorWithRed:0.3 green:0.2 blue:1 alpha:1];
    lab3.textAlignment = NSTextAlignmentCenter;
    lab3.font = [UIFont boldSystemFontOfSize:26];
    [View3 addSubview:lab3];
    
    lab4 = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_W-55-(View3.frame.size.height/4), colorView.frame.origin.y,View3.frame.size.height/4, View3.frame.size.height/4-5)];
    lab4.text = @"0";
    lab4.textColor = [UIColor colorWithRed:0.8 green:0.2 blue:0.4 alpha:1];
    lab4.textAlignment = NSTextAlignmentCenter;
    lab4.font = [UIFont boldSystemFontOfSize:26];
    [View3 addSubview:lab4];
    
    //
    View4 = [[UIView alloc]initWithFrame:CGRectMake(10, View3.frame.origin.y+View3.frame.size.height+10, SCREEN_W-20, View1.frame.size.height)];
    View4.backgroundColor = VIEW_COLOR
    
    lab11 = [[UILabel alloc]initWithFrame:CGRectMake(20, View4.frame.origin.x+View4.frame.size.height/4-10,View3.frame.size.height/4, View3.frame.size.height/4)];
    lab11.text = @"0";
    lab11.textColor = TEXT_COLOR_L11;
    lab11.textAlignment = NSTextAlignmentCenter;
    lab11.font = [UIFont boldSystemFontOfSize:26];
    [View4 addSubview:lab11];
    
    lab12 = [[UILabel alloc]initWithFrame:CGRectMake(20, View4.frame.origin.x+View4.frame.size.height/4*2+5,View3.frame.size.height/4, View3.frame.size.height/4)];
    lab12.text = @"0";
    lab12.textColor = TEXT_COLOR_L12;
    
    lab12.textAlignment = NSTextAlignmentCenter;
    lab12.font = [UIFont boldSystemFontOfSize:26];
    [View4 addSubview:lab12];
    
    
    View5 = [[UIView alloc]initWithFrame:CGRectMake(10, View4.frame.origin.y+View4.frame.size.height+10, (SCREEN_W-30)/2-20, (SCREEN_W-30)/2-30)];
    View5.backgroundColor = VIEW_COLOR
    lab5 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, View5.frame.size.width, View5.frame.size.height)];
    lab5.text = @"0";
    lab5.textColor = TEXT_COLOR
    lab5.textAlignment = NSTextAlignmentCenter;
    lab5.font = [UIFont boldSystemFontOfSize:40];
    [View5 addSubview:lab5];
    
    
    View6 = [[UIView alloc]initWithFrame:CGRectMake(View5.frame.size.width+20, View4.frame.origin.y+View4.frame.size.height+10, (SCREEN_W-30)/2+20, (SCREEN_W-30)/2-30)];
    View6.backgroundColor = VIEW_COLOR
    
    lab6 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,View6.frame.size.width, View6.frame.size.height)];
    lab6.text = @"0";
    lab6.textColor = TEXT_COLOR
    lab6.textAlignment = NSTextAlignmentCenter;
    lab6.font = [UIFont boldSystemFontOfSize:40];
    [View6 addSubview:lab6];
    
    View7 = [[UIView alloc]initWithFrame:CGRectMake(10, View5.frame.origin.y+View5.frame.size.height+10, (SCREEN_W-30)/2-20, (SCREEN_W-30)/2-30)];
    View7.backgroundColor = VIEW_COLOR
    lab7 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, View7.frame.size.width, View7.frame.size.height)];
    lab7.text = @"0";
    lab7.textColor = TEXT_COLOR
    lab7.textAlignment = NSTextAlignmentCenter;
    lab7.font = [UIFont boldSystemFontOfSize:40];
    [View7 addSubview:lab7];
    
    
    View8 = [[UIView alloc]initWithFrame:CGRectMake(View7.frame.size.width+20, View5.frame.origin.y+View5.frame.size.height+10, (SCREEN_W-30)/2+20, (SCREEN_W-30)/2-30)];
    View8.backgroundColor = VIEW_COLOR
    
    lab8 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,View8.frame.size.width, View8.frame.size.height)];
    lab8.text = @"0";
    lab8.textColor = TEXT_COLOR
    lab8.textAlignment = NSTextAlignmentCenter;
    lab8.font = [UIFont boldSystemFontOfSize:40];
    [View8 addSubview:lab8];
    
    View9 = [[UIView alloc]initWithFrame:CGRectMake(10, View7.frame.origin.y+View7.frame.size.height+10, SCREEN_W-20, SCREEN_W-20)];
    View9.backgroundColor = VIEW_COLOR
    
    View10 = [[UIView alloc]initWithFrame:CGRectMake(10, View9.frame.origin.y+View9.frame.size.height+10, SCREEN_W-20, View1.frame.size.height-20)];
    View10.backgroundColor = VIEW_COLOR
    
    lab10 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, View10.frame.size.width, View10.frame.size.height)];
    lab10.text = @"0";
    lab10.textColor = TEXT_COLOR
    lab10.textAlignment = NSTextAlignmentCenter;
    lab10.font = [UIFont boldSystemFontOfSize:40];
    [View10 addSubview:lab10];
    [self viewBorder];
    
    [self.view addSubview:navView];
    [self.view addSubview:BGScroll];
    [BGScroll addSubview:View1];
    [BGScroll addSubview:View2];
    [BGScroll addSubview:View3];
    [BGScroll addSubview:View4];
    [BGScroll addSubview:View5];
    [BGScroll addSubview:View6];
    [BGScroll addSubview:View7];
    [BGScroll addSubview:View8];
    [BGScroll addSubview:View9];
    [BGScroll addSubview:View10];
    //    [navView addGestureRecognizer:recognizerUp];
    //    [self.view addGestureRecognizer:recognizerDown];
    
    BGScroll.contentSize = CGSizeMake(SCREEN_W, View1.frame.size.height+View3.frame.size.height+View4.frame.size.height+View6.frame.size.height+View7.frame.size.height+View9.frame.size.height+View10.frame.size.height+134);
}

- (void)viewBorder{
View1.layer.borderWidth = 0.5;
View1.layer.borderColor = [UIColor blackColor].CGColor;
View1.layer.masksToBounds = YES;
View1.layer.cornerRadius = 5;

View2.layer.borderWidth = 0.5;
View2.layer.borderColor = [UIColor blackColor].CGColor;
View2.layer.masksToBounds = YES;
View2.layer.cornerRadius = 5;

View3.layer.borderWidth = 0.5;
View3.layer.borderColor = [UIColor blackColor].CGColor;
View3.layer.masksToBounds = YES;
View3.layer.cornerRadius = 5;

View4.layer.borderWidth = 0.5;
View4.layer.borderColor = [UIColor blackColor].CGColor;
View4.layer.masksToBounds = YES;
View4.layer.cornerRadius = 5;

View5.layer.borderWidth = 0.5;
View5.layer.borderColor = [UIColor blackColor].CGColor;
View5.layer.masksToBounds = YES;
View5.layer.cornerRadius = 5;

View6.layer.borderWidth = 0.5;
View6.layer.borderColor = [UIColor blackColor].CGColor;
View6.layer.masksToBounds = YES;
View6.layer.cornerRadius = 5;

View7.layer.borderWidth = 0.5;
View7.layer.borderColor = [UIColor blackColor].CGColor;
View7.layer.masksToBounds = YES;
View7.layer.cornerRadius = 5;

View8.layer.borderWidth = 0.5;
View8.layer.borderColor = [UIColor blackColor].CGColor;
View8.layer.masksToBounds = YES;
View8.layer.cornerRadius = 5;

View9.layer.borderWidth = 0.5;
View9.layer.borderColor = [UIColor blackColor].CGColor;
View9.layer.masksToBounds = YES;
View9.layer.cornerRadius = 5;

View10.layer.borderWidth = 0.5;
View10.layer.borderColor = [UIColor blackColor].CGColor;
View10.layer.masksToBounds = YES;
View10.layer.cornerRadius = 5;
    [self addAcc];
}

- (void)addAcc{
    UIImageView * img1 = [[UIImageView alloc]initWithFrame:CGRectMake(30, 10, 20, 15)];
    img1.image = [UIImage imageNamed:@"user-male-black-shape@2x.png"];
//    img1.backgroundColor = [UIColor redColor];
    UILabel * lb1 = [[UILabel alloc]initWithFrame:CGRectMake(img1.frame.origin.x+img1.frame.size.width+5, 10, 80, 20)];
    lb1.text = @"FOUNDED";
    lb1.font = [UIFont boldSystemFontOfSize:14];
    lb1.textColor = TEXT_COLOR
    UILabel * lb2 = [[UILabel alloc]initWithFrame:CGRectMake((View1.frame.size.width-40)/2,View1.frame.size.height-30, 40, 20)];
    lb2.text = @"AD";
    lb2.textAlignment = NSTextAlignmentCenter;
    lb2.font = [UIFont boldSystemFontOfSize:14];
    lb2.textColor = [UIColor colorWithWhite:0.5 alpha:1];
    [View1 addSubview:lb2];
    [View1 addSubview:lb1];
    [View1 addSubview:img1];
    
    UIImageView * img2 = [[UIImageView alloc]initWithFrame:CGRectMake(30, 10, 20, 15)];
    img2.image = [UIImage imageNamed:@"user-male-black-shape@2x.png"];
//    img2.backgroundColor = [UIColor redColor];
    UILabel * lb3 = [[UILabel alloc]initWithFrame:CGRectMake(img2.frame.origin.x+img2.frame.size.width+5, 10, 80, 20)];
    lb3.text = @"ELEVATION";
    lb3.font = [UIFont boldSystemFontOfSize:14];
    lb3.textColor = TEXT_COLOR
    UILabel * lb4 = [[UILabel alloc]initWithFrame:CGRectMake((View2.frame.size.width-40)/2, View2.frame.size.height-30, 40, 20)];
    lb4.text = @"FEET";
    lb4.textAlignment = NSTextAlignmentCenter;
    lb4.font = [UIFont boldSystemFontOfSize:14];
    lb4.textColor = [UIColor colorWithWhite:0.5 alpha:1];
    [View2 addSubview:lb4];
    [View2 addSubview:lb3];
    [View2 addSubview:img2];
    
    UIImageView * img3 = [[UIImageView alloc]initWithFrame:CGRectMake(80, 10, 20, 15)];
    img3.image = [UIImage imageNamed:@"user-male-black-shape@2x.png"];
//    img3.backgroundColor = [UIColor redColor];
    UILabel * lb5 = [[UILabel alloc]initWithFrame:CGRectMake(110, 10, 200, 20)];
    lb5.text = @"AVG. PRECIPITATION ( in )";
    lb5.textAlignment = NSTextAlignmentLeft;
    lb5.font = [UIFont boldSystemFontOfSize:14];
    lb5.textColor = TEXT_COLOR
    UILabel * lb6 = [[UILabel alloc]initWithFrame:CGRectMake(lab11.frame.origin.x,lab11.frame.origin.y+lab11.frame.size.height-5, lab11.frame.size.width, 15)];
    lb6.text = @"1月";
    lb6.textAlignment = NSTextAlignmentCenter;
    lb6.font = [UIFont boldSystemFontOfSize:10];
    lb6.textColor = [UIColor colorWithWhite:0.5 alpha:1];
    UILabel * lb7 = [[UILabel alloc]initWithFrame:CGRectMake(lab12.frame.origin.x,lab12.frame.origin.y+lab12.frame.size.height-5, lab12.frame.size.width, 15)];
    lb7.text = @"7月";
    lb7.textAlignment = NSTextAlignmentCenter;
    lb7.font = [UIFont boldSystemFontOfSize:10];
    lb7.textColor = [UIColor colorWithWhite:0.5 alpha:1];
    //3
    img03 = [[UIImageView alloc]initWithFrame:CGRectMake(lab11.frame.origin.x+lab11.frame.size.width+25, lab11.frame.origin.y+5, SCREEN_W-(lab11.frame.origin.x+lab11.frame.size.width+25)-70, lab11.frame.size.height-8)];
    img03.image = [UIImage imageNamed:@"water-drop-free-icon2@2x.png"];
    img04 = [[UIImageView alloc]initWithFrame:CGRectMake(lab12.frame.origin.x+lab12.frame.size.width+25, lab12.frame.origin.y+5, SCREEN_W-(lab12.frame.origin.x+lab12.frame.size.width+25)-70, lab12.frame.size.height-8)];
    img04.image = [UIImage imageNamed:@"water-drop-free-icon4@2x.png"];
    //2
    img0_3 = [[UIImageView alloc]initWithFrame:CGRectMake(lab11.frame.origin.x+lab11.frame.size.width+25, lab11.frame.origin.y+5, SCREEN_W-(lab11.frame.origin.x+lab11.frame.size.width+25)-70, lab11.frame.size.height-8)];
    img0_3.image = [UIImage imageNamed:@"2water-drop-free-icon2@2x.png"];
    img0_4 = [[UIImageView alloc]initWithFrame:CGRectMake(lab12.frame.origin.x+lab12.frame.size.width+25, lab12.frame.origin.y+5, SCREEN_W-(lab12.frame.origin.x+lab12.frame.size.width+25)-70, lab12.frame.size.height-8)];
    img0_4.image = [UIImage imageNamed:@"2water-drop-free-icon4@2x.png"];
    // 1
    img0_03 = [[UIImageView alloc]initWithFrame:CGRectMake(lab11.frame.origin.x+lab11.frame.size.width+25, lab11.frame.origin.y+5, SCREEN_W-(lab11.frame.origin.x+lab11.frame.size.width+25)-70, lab11.frame.size.height-8)];
    img0_03.image = [UIImage imageNamed:@"1water-drop-free-icon2@2x.png"];
    img0_04 = [[UIImageView alloc]initWithFrame:CGRectMake(lab12.frame.origin.x+lab12.frame.size.width+25, lab12.frame.origin.y+5, SCREEN_W-(lab12.frame.origin.x+lab12.frame.size.width+25)-70, lab12.frame.size.height-8)];
    img0_04.image = [UIImage imageNamed:@"1water-drop-free-icon4@2x.png"];

    
    // 0
    UIImageView * img003 = [[UIImageView alloc]initWithFrame:CGRectMake(lab11.frame.origin.x+lab11.frame.size.width+25, lab11.frame.origin.y+5, SCREEN_W-(lab11.frame.origin.x+lab11.frame.size.width+25)-70, lab11.frame.size.height-8)];
    img003.image = [UIImage imageNamed:@"water-drop-free-icon1@2x.png"];
    UIImageView * img004 = [[UIImageView alloc]initWithFrame:CGRectMake(lab12.frame.origin.x+lab12.frame.size.width+25, lab12.frame.origin.y+5, SCREEN_W-(lab12.frame.origin.x+lab12.frame.size.width+25)-70, lab12.frame.size.height-8)];
    img004.image = [UIImage imageNamed:@"water-drop-free-icon3@2x.png"];
    img0_3.alpha = 0;
    img0_4.alpha = 0;
    img03.alpha = 0;
    img04.alpha = 0;
    [View4 addSubview:lb5];[View4 addSubview:lb6];
    [View4 addSubview:lb7];[View4 addSubview:img3];
    [View4 addSubview:img003]; [View4 addSubview:img004];
    [View4 addSubview:img0_03]; [View4 addSubview:img0_04];
    [View4 addSubview:img0_3]; [View4 addSubview:img0_4];
    [View4 addSubview:img03]; [View4 addSubview:img04];
    
    
    UILabel * lb8 = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_W-200)/2, 10, 200, 20)];
    lb8.text = @"AVG TEMPERATURE( ℉ )";
    lb8.textAlignment = NSTextAlignmentLeft;
    lb8.font = [UIFont boldSystemFontOfSize:14];
    lb8.textColor = TEXT_COLOR
    UILabel * lb9 = [[UILabel alloc]initWithFrame:CGRectMake(lab3.frame.origin.x,lab3.frame.origin.y+lab3.frame.size.height-2, lab3.frame.size.width, 15)];
    lb9.text = @"1月";
    lb9.textAlignment = NSTextAlignmentCenter;
    lb9.font = [UIFont boldSystemFontOfSize:10];
    lb9.textColor = [UIColor colorWithWhite:0.5 alpha:1];
    UILabel * lb10 = [[UILabel alloc]initWithFrame:CGRectMake(lab4.frame.origin.x,lab4.frame.origin.y+lab4.frame.size.height-2, lab4.frame.size.width, 15)];
    lb10.text = @"7月";
    lb10.textAlignment = NSTextAlignmentCenter;
    lb10.font = [UIFont boldSystemFontOfSize:10];
    lb10.textColor = [UIColor colorWithWhite:0.5 alpha:1];
    [View3 addSubview:lb8];
    [View3 addSubview:lb9];
    [View3 addSubview:lb10];

    UIImageView * img4 = [[UIImageView alloc]initWithFrame:CGRectMake(40, 10, 20, 15)];
    img4.image = [UIImage imageNamed:@"user-male-black-shape@2x.png"];
//    img4.backgroundColor = [UIColor redColor];
    UILabel * lb11 = [[UILabel alloc]initWithFrame:CGRectMake(img4.frame.origin.x+img4.frame.size.width+5, 10, 60, 20)];
    lb11.text = @"AREA";
    lb11.font = [UIFont boldSystemFontOfSize:14];
    lb11.textColor = TEXT_COLOR
    UILabel * lb12 = [[UILabel alloc]initWithFrame:CGRectMake((View5.frame.size.width-60)/2, View5.frame.size.height-30, 60, 20)];
    lb12.text = @"SQ MI";
    lb12.textAlignment = NSTextAlignmentCenter;
    lb12.font = [UIFont boldSystemFontOfSize:14];
    lb12.textColor = [UIColor colorWithWhite:0.5 alpha:1];
    [View5 addSubview:lb11];
    [View5 addSubview:lb12];
    [View5 addSubview:img4];
    
    UIImageView * img5 = [[UIImageView alloc]initWithFrame:CGRectMake(40, 10, 20, 15)];
    img5.image = [UIImage imageNamed:@"user-male-black-shape@2x.png"];
//    img5.backgroundColor = [UIColor redColor];
    UILabel * lb13 = [[UILabel alloc]initWithFrame:CGRectMake(img5.frame.origin.x+img5.frame.size.width+5, 10, 100, 20)];
    lb13.text = @"CITY POP.";
    lb13.font = [UIFont boldSystemFontOfSize:14];
    lb13.textColor = TEXT_COLOR
    [View6 addSubview:lb13];
    [View6 addSubview:img5];
    
    UILabel * lb14 = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, View7.frame.size.width, 20)];
    lb14.text = @"GROWTH RATE";
    lb14.textAlignment = NSTextAlignmentCenter;
    lb14.font = [UIFont boldSystemFontOfSize:14];
    lb14.textColor = TEXT_COLOR
    UILabel * lb15 = [[UILabel alloc]initWithFrame:CGRectMake(0, View7.frame.size.height-30, View7.frame.size.width, 20)];
    lb15.text = @"％";
    lb15.textAlignment = NSTextAlignmentCenter;
    lb15.font = [UIFont boldSystemFontOfSize:14];
    lb15.textColor = [UIColor colorWithWhite:0.5 alpha:1];
    [View7 addSubview:lb14];
    [View7 addSubview:lb15];
    
    UILabel * lb16 = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, View8.frame.size.width, 20)];
    lb16.text = @"POP. DENSITY";
    lb16.textAlignment = NSTextAlignmentCenter;
    lb16.font = [UIFont boldSystemFontOfSize:14];
    lb16.textColor = TEXT_COLOR
    UILabel * lb17 = [[UILabel alloc]initWithFrame:CGRectMake(0, View8.frame.size.height-30, View8.frame.size.width, 20)];
    lb17.text = @"PER SQ MILE";
    lb17.textAlignment = NSTextAlignmentCenter;
    lb17.font = [UIFont boldSystemFontOfSize:14];
    lb17.textColor = [UIColor colorWithWhite:0.5 alpha:1];
    [View8 addSubview:lb16];
    [View8 addSubview:lb17];
    
    img6 = [[UIImageView alloc]initWithFrame:CGRectMake(40, 50, View9.frame.size.width-80, View9.frame.size.width-80)];
    img6.image = [UIImage imageNamed:@"round2@2x.png"];
    //4
    img7 = [[UIImageView alloc]initWithFrame:CGRectMake(70, 125, img6.frame.size.width-140, img6.frame.size.width-180)];
    img7.image = [UIImage imageNamed:@"menandwomen@2x.png"];
    //3
    img_7 = [[UIImageView alloc]initWithFrame:CGRectMake(70, 125, img6.frame.size.width-140, img6.frame.size.width-180)];
    img_7.image = [UIImage imageNamed:@"3menandwomen@2x.png"];
    //2
    img_07 = [[UIImageView alloc]initWithFrame:CGRectMake(70, 125, img6.frame.size.width-140, img6.frame.size.width-180)];
    img_07.image = [UIImage imageNamed:@"2menandwomen@2x.png"];
    //1
    img_007 = [[UIImageView alloc]initWithFrame:CGRectMake(70, 125, img6.frame.size.width-140, img6.frame.size.width-180)];
    img_007.image = [UIImage imageNamed:@"1menandwomen@2x.png"];
    
    UIImageView * img06 = [[UIImageView alloc]initWithFrame:CGRectMake(40, 50, View9.frame.size.width-80, View9.frame.size.width-80)];
    img06.image = [UIImage imageNamed:@"round@2x.png"];
    //0
    UIImageView * img07 = [[UIImageView alloc]initWithFrame:CGRectMake(70, 125, img6.frame.size.width-140, img6.frame.size.width-180)];
    img07.image = [UIImage imageNamed:@"menandwomen2@2x.png"];
    
    UILabel * lb18 = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, View9.frame.size.width, 20)];
    lb18.text = @"CITY POP. AS A ％ OF TOTAL COUNTRY";
    lb18.textAlignment = NSTextAlignmentCenter;
    lb18.font = [UIFont boldSystemFontOfSize:14];
    lb18.textColor = TEXT_COLOR
    lab9 = [[UILabel alloc]initWithFrame:CGRectMake(img7.frame.origin.x-5, img7.frame.origin.y-88, img6.frame.size.width-140, 80)];
//    lab9.backgroundColor = [UIColor redColor];
    lab9.textAlignment = NSTextAlignmentCenter;
    lab9.text = @"125";
    lab9.font = [UIFont boldSystemFontOfSize:80];
    lab9.textColor = TEXT_COLOR_BG
    [lab9 sizeToFit];
    lb19 = [[UILabel alloc]initWithFrame:CGRectMake(lab9.frame.origin.x+lab9.frame.size.width, lab9.frame.origin.y+20, 20, 20)];
    lb19.text = @"％";
    lb19.textAlignment = NSTextAlignmentLeft;
    lb19.font = [UIFont boldSystemFontOfSize:17];
    lb19.textColor = TEXT_COLOR_BG
    [View9 addSubview:lb18];
    [View9 addSubview:img06];[View9 addSubview:img6];
    [img06 addSubview:img07];[img06 addSubview:img_007];[img06 addSubview:img_07];
    [img06 addSubview:img_7];[img06 addSubview:img7];
    [img06 addSubview:lab9];[img06 addSubview:lb19];
    
    UIImageView * img8 = [[UIImageView alloc]initWithFrame:CGRectMake(90, 10, 20, 15)];
    img8.image = [UIImage imageNamed:@"user-male-black-shape@2x.png"];
    //    img3.backgroundColor = [UIColor redColor];
    UILabel * lb20 = [[UILabel alloc]initWithFrame:CGRectMake(120, 10, 200, 20)];
    lb20.text = @"TOTAL COUNTRY POP.";
    lb20.textAlignment = NSTextAlignmentLeft;
    lb20.font = [UIFont boldSystemFontOfSize:14];
    lb20.textColor = TEXT_COLOR
    [View10 addSubview:img8];
    [View10 addSubview:lb20];
}
//开始拖拽视图

//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
//
//{
//    contentOffsetY = scrollView.contentOffset.y;
//}
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
//
//{
    // NSLog(@"scrollViewDidEndDragging");
    
//    oldContentOffsetY = scrollView.contentOffset.y;
//    
//}
//
//- (void)imgAnimate{
//    img0_3.alpha = 1; img0_4.alpha = 1;
//    [self performSelector:@selector(imgAnimate1) withObject:self afterDelay:0.2];
//}
//- (void)imgAnimate1{
//    img0_03.alpha = 1; img0_04.alpha = 1;
//}
//
//- (void)img_Animate{
//    img0_3.alpha = 0; img0_4.alpha = 0;
//    [self performSelector:@selector(img_Animate1) withObject:self afterDelay:0.2];
//}
//- (void)img_Animate1{
//    img0_03.alpha = 0; img0_04.alpha = 0;
//}
- (void)loadAnimation{
    
    [self numberAnimation:@(0) TO:@(43) Lable:lab1 name:@"lab1"];
    [self numberAnimation:@(0) TO:@(200) Lable:lab2 name:@"lab2"];
    lab1.textColor = TEXT_COLOR;lab2.textColor = TEXT_COLOR;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self numberAnimation:@(0) TO:@(39) Lable:lab3 name:@"lab3"];
        [self numberAnimation:@(0) TO:@(69) Lable:lab4 name:@"lab4"];
        lab3.textColor = [UIColor colorWithRed:0.3 green:0.2 blue:1 alpha:1];
        lab4.textColor = [UIColor colorWithRed:0.8 green:0.2 blue:0.4 alpha:1];
        [UIView animateWithDuration:0.8 animations:^{
            colorView.alpha = 1;
        }];
     });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self numberAnimation:@(0) TO:@(52) Lable:lab11 name:@"lab11"];
        [self numberAnimation:@(0) TO:@(16) Lable:lab12 name:@"lab12"];
        [UIView animateWithDuration:0.3 animations:^{
            img0_04.alpha = 1;
            img0_03.alpha = 1;
        } completion:^(BOOL finished) {
            lab11.textColor = TEXT_COLOR_L11;
            lab12.textColor = TEXT_COLOR_L12;
            [UIView animateWithDuration:0.3 animations:^{
                img0_4.alpha = 1;
                img0_3.alpha = 1;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.2 animations:^{
                    img04.alpha = 1;
                    img03.alpha = 1;
  
                }];
              }];
        }];

    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self numberAnimation:@(0) TO:@(659) Lable:lab5 name:@"lab5"];
        [self numberAnimation:@(0) TO:@(7927008) Lable:lab6 name:@"lab6"];
        lab5.textColor = TEXT_COLOR lab6.textColor = TEXT_COLOR
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.35 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self numberAnimation:@(0) TO:@(14) Lable:lab7 name:@"lab7"];
        [self numberAnimation:@(0) TO:@(12036) Lable:lab8 name:@"lab8"];
        lab7.textColor = TEXT_COLOR lab8.textColor = TEXT_COLOR
    });
    

}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
//    newContentOffsetY = scrollView.contentOffset.y;
    
//    if (newContentOffsetY > oldContentOffsetY && oldContentOffsetY > contentOffsetY) {  // 向上滚动
//        NSLog(@"up");
//    } else if (newContentOffsetY < oldContentOffsetY && oldContentOffsetY < contentOffsetY) { // 向下滚动
//        NSLog(@"down");
//    }
    
    if (scrollView.contentOffset.y <= 2) {
        navView.layer.borderWidth = 0;
    }else {
         navView.layer.borderWidth = 0.8;
    }
//    NSLog(@"contentOffset000= %f",(SCREEN_W-30)/2-20);
    if (scrollView.contentOffset.y <= 40) {  // 第一部分
        CGRect rect1 = View1.frame;
        rect1.origin.x = 10;
        
        CGRect rect2 = View2.frame;
        rect2.origin.x = View1.frame.size.width+20;
        
        View1.frame = rect1;
        View2.frame = rect2;
        
    }
    // 数字 变化
    if (scrollView.contentOffset.y > 35 && scrollView.contentOffset.y<50 && [lab1.text isEqualToString:@"0"]) {
        [self numberAnimation:@(0) TO:@(43) Lable:lab1 name:@"lab1"];
        [self numberAnimation:@(0) TO:@(200) Lable:lab2 name:@"lab2"];
        lab1.textColor = TEXT_COLOR;lab2.textColor = TEXT_COLOR;
    }else if(scrollView.contentOffset.y > 35 && scrollView.contentOffset.y<50 && [lab1.text isEqualToString:@"43"]){
        
        [self numberAnimation:@(43) TO:@(0) Lable:lab1 name:@"lab1"];
        [self numberAnimation:@(200) TO:@(0) Lable:lab2 name:@"lab2"];
        lab1.textColor = [UIColor colorWithWhite:0.4 alpha:0.8];lab2.textColor = [UIColor colorWithWhite:0.4 alpha:0.8];
    }
    
//    NSLog(@"contentOffset111= %f",((SCREEN_W-30)/2-20)/3);
    if ( scrollView.contentOffset.y > 40) {
        
            CGRect rect1 = View1.frame;
            rect1.origin.x = 10-(scrollView.contentOffset.y-40);
            
            CGRect rect2 = View2.frame;
            rect2.origin.x = View1.frame.size.width+20+(scrollView.contentOffset.y-40);
            
            View1.frame = rect1;
            View2.frame = rect2;
        if (rect2.origin.x > View1.frame.size.width+20+80) {
            [UIView animateWithDuration:0.3 animations:^{
                View1.alpha = 0;
                View2.alpha = 0;
            }];
        }
        if (rect2.origin.x <= View1.frame.size.width+20+80) {
            [UIView animateWithDuration:0.3 animations:^{
                View1.alpha = 1;
                View2.alpha = 1;
            }];
           
        }
     }
    
    if (scrollView.contentOffset.y <= View3.frame.origin.y+20) { // 第二部分
        CGRect rect3 = View3.frame;
        rect3.origin.x = 10;
        View3.frame = rect3;
        
    }
     // 数字 变化
    if (scrollView.contentOffset.y > View3.frame.origin.y+15 && scrollView.contentOffset.y < View3.frame.origin.y+30 && [lab3.text isEqualToString:@"0"]) {
        [self numberAnimation:@(0) TO:@(39) Lable:lab3 name:@"lab3"];
        [self numberAnimation:@(0) TO:@(69) Lable:lab4 name:@"lab4"];
        lab3.textColor = [UIColor colorWithRed:0.3 green:0.2 blue:1 alpha:1];
        lab4.textColor = [UIColor colorWithRed:0.8 green:0.2 blue:0.4 alpha:1];
        [UIView animateWithDuration:0.8 animations:^{
            colorView.alpha = 1;
        }];
    }else if (scrollView.contentOffset.y > View3.frame.origin.y+15 && scrollView.contentOffset.y < View3.frame.origin.y+50 && [lab3.text isEqualToString:@"39"]){
        [self numberAnimation:@(39) TO:@(0) Lable:lab3 name:@"lab3"];
        [self numberAnimation:@(69) TO:@(0) Lable:lab4 name:@"lab4"];
        lab3.textColor = [UIColor colorWithRed:0.3 green:0.6 blue:0.8 alpha:1];
        lab4.textColor = [UIColor colorWithRed:0.5 green:0.8 blue:0.2 alpha:1];
        [UIView animateWithDuration:0.8 animations:^{
            colorView.alpha = 0;
        }];
    }
    
    if (scrollView.contentOffset.y > View3.frame.origin.y+20) {
        CGRect rect3 = View3.frame;
        rect3.origin.x = 10-((scrollView.contentOffset.y-(View3.frame.origin.y+20))*2.5);
        View3.frame = rect3;

        if (rect3.origin.x < 10-View3.frame.size.width/2) {
            [UIView animateWithDuration:0.3 animations:^{
                View3.alpha = 0;
            }];
        }
        if (rect3.origin.x >= 10-View3.frame.size.width/2) {
            [UIView animateWithDuration:0.3 animations:^{
                View3.alpha = 1;
            }];
        }
    }
    if (scrollView.contentOffset.y <= View4.frame.origin.y+30) { // 第三部分
        CGRect rect4 = View4.frame;
        rect4.origin.x = 10;
        View4.frame = rect4;
    }
    // 数字 变化
    if (scrollView.contentOffset.y > View4.frame.origin.y+30 && scrollView.contentOffset.y < View4.frame.origin.y+45 && [lab11.text isEqualToString:@"0"] ) {
        [self numberAnimation:@(0) TO:@(52) Lable:lab11 name:@"lab11"];
        [self numberAnimation:@(0) TO:@(16) Lable:lab12 name:@"lab12"];
        [UIView animateWithDuration:0.3 animations:^{
            img0_04.alpha = 1;
            img0_03.alpha = 1;
        } completion:^(BOOL finished) {
         lab11.textColor = TEXT_COLOR_L11;
         lab12.textColor = TEXT_COLOR_L12;
            [UIView animateWithDuration:0.3 animations:^{
                img0_4.alpha = 1;
                img0_3.alpha = 1;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.2 animations:^{
                    img04.alpha = 1;
                    img03.alpha = 1;
                }];
            }];
        }];
        
    }else if (scrollView.contentOffset.y > View4.frame.origin.y+30 && scrollView.contentOffset.y < View4.frame.origin.y+45 && [lab11.text isEqualToString:@"52"]){
        [self numberAnimation:@(52) TO:@(0) Lable:lab11 name:@"lab11"];
        [self numberAnimation:@(16) TO:@(0) Lable:lab12 name:@"lab12"];
        [UIView animateWithDuration:0.3 animations:^{
            img04.alpha = 0;
            img03.alpha = 0;
        } completion:^(BOOL finished) {
            lab11.textColor = TEXT_COLOR_bgL11;
            lab12.textColor = TEXT_COLOR_bgL12;
            [UIView animateWithDuration:0.3 animations:^{
                img0_4.alpha = 0;
                img0_3.alpha = 0;
            } completion:^(BOOL finished) {
                img0_04.alpha = 0;
                img0_03.alpha = 0;
            }];

        }];
       
    }

    
    if (scrollView.contentOffset.y > View4.frame.origin.y+30) {
        CGRect rect4 = View4.frame;
        rect4.origin.x = ((scrollView.contentOffset.y-(View4.frame.origin.y+20))*3);
        View4.frame = rect4;
        if (rect4.origin.x >= View4.frame.size.width/2+30) {
            [UIView animateWithDuration:0.3 animations:^{
                View4.alpha = 0;
            }];
        }
        if (rect4.origin.x < View4.frame.size.width/2+30) {
            [UIView animateWithDuration:0.3 animations:^{
                View4.alpha = 1;
            }];
        }

    }
    if (scrollView.contentOffset.y <= View5.frame.origin.y+20 && scrollView.contentOffset.y > View5.frame.origin.y - (SCREEN_H-64)) {  // 第四部分
        CGRect rect5 = View5.frame;
        rect5.origin.x = 10;
        
        CGRect rect6 = View6.frame;
        rect6.origin.x = View5.frame.size.width+20;
        
        View5.frame = rect5;
        View6.frame = rect6;
        
    }
    // 数字 变化
    if (scrollView.contentOffset.y > View5.frame.origin.y+15 && scrollView.contentOffset.y < View5.frame.origin.y+30 && [lab5.text isEqualToString:@"0"]) {
        
        [self numberAnimation:@(0) TO:@(659) Lable:lab5 name:@"lab5"];
        [self numberAnimation:@(0) TO:@(7927008) Lable:lab6 name:@"lab6"];
        lab5.textColor = TEXT_COLOR lab6.textColor = TEXT_COLOR
    }else if (scrollView.contentOffset.y > View5.frame.origin.y+15 && scrollView.contentOffset.y < View5.frame.origin.y+30 && [lab5.text isEqualToString:@"659"]){
        [self numberAnimation:@(659) TO:@(0) Lable:lab5 name:@"lab5"];
        [self numberAnimation:@(7927008) TO:@(0) Lable:lab6 name:@"lab6"];
        lab5.textColor = [UIColor colorWithWhite:0.4 alpha:1];lab6.textColor =
        [UIColor colorWithWhite:0.4 alpha:1];
    }
    
    
    
    if ( scrollView.contentOffset.y > View5.frame.origin.y+20) {
        CGRect rect5 = View5.frame;
        rect5.origin.x = 10-(scrollView.contentOffset.y-(View5.frame.origin.y+20));
        
        CGRect rect6 = View6.frame;
        rect6.origin.x = View5.frame.size.width+20+(scrollView.contentOffset.y-(View5.frame.origin.y+20));
        
        View5.frame = rect5;
        View6.frame = rect6;
        if (rect6.origin.x > View6.frame.size.width+20+50) {
            [UIView animateWithDuration:0.3 animations:^{
                View5.alpha = 0;
                View6.alpha = 0;
            }];
        }
        if (rect6.origin.x <= View6.frame.size.width+20+50) {
            [UIView animateWithDuration:0.3 animations:^{
                View5.alpha = 1;
                View6.alpha = 1;
            }];
            
        }
    }
    if (scrollView.contentOffset.y <= View5.frame.origin.y+20 - (SCREEN_H-64-20) && scrollView.contentOffset.y > View5.frame.origin.y - (SCREEN_H-64)) {
        CGRect rect5 = View5.frame;
        rect5.origin.x = (10 - (View5.frame.size.width/2+20)) ;
        View5.frame = rect5;
        [UIView animateWithDuration:0.3 animations:^{
            View5.alpha = 0;
        }];
        
        CGRect rect6 = View6.frame;
        rect6.origin.x = View5.frame.size.width+20+ (View6.frame.size.width/2+30);
        View6.frame = rect6;
        [UIView animateWithDuration:0.3 animations:^{
            View6.alpha = 0;
        }];
        
    }
    if (scrollView.contentOffset.y > (View5.frame.origin.y+20 - (SCREEN_H-64-20)) && scrollView.contentOffset.y <= View5.frame.origin.y - (SCREEN_H-64-View5.frame.size.height+20) ) {
        CGRect rect5 = View5.frame;
        rect5.origin.x = (10 - View5.frame.size.width/2)+(scrollView.contentOffset.y-(View5.frame.origin.y+20 - (SCREEN_H-64-20)));
        View5.frame = rect5;
        [UIView animateWithDuration:0.3 animations:^{
            View5.alpha = 1;
        }];
        if (View5.frame.origin.x >= 10) {
            CGRect rect5 = View5.frame;
            rect5.origin.x = 10;
            View5.frame = rect5;
            View5.alpha = 1;
        }
        
        CGRect rect6 = View6.frame;
        rect6.origin.x = (View5.frame.size.width+20+ (View6.frame.size.width/2))-(scrollView.contentOffset.y-(View5.frame.origin.y+20 - (SCREEN_H-64-20)));
        View6.frame = rect6;
        [UIView animateWithDuration:0.3 animations:^{
            View6.alpha = 1;
        }];
        if (View6.frame.origin.x <= View5.frame.size.width+20) {
            CGRect rect6 = View6.frame;
            rect6.origin.x = View5.frame.size.width+20;
            View6.frame = rect6;
            View6.alpha = 1;
        }
    }

    
    if (scrollView.contentOffset.y <= View7.frame.origin.y+20 && scrollView.contentOffset.y > View7.frame.origin.y - (SCREEN_H-64)) {  // 第五部分
        CGRect rect7 = View7.frame;
        rect7.origin.x = 10;
        
        CGRect rect8 = View8.frame;
        rect8.origin.x = View7.frame.size.width+20;
        
        View7.frame = rect7;
        View8.frame = rect8;
    }
    // 数字 变化 上
    if (scrollView.contentOffset.y > View7.frame.origin.y+20 && scrollView.contentOffset.y < View7.frame.origin.y+35 && [lab7.text isEqualToString:@"14"]) {
        [self numberAnimation:@(14) TO:@(0) Lable:lab7 name:@"lab7"];
        [self numberAnimation:@(12036) TO:@(0) Lable:lab8 name:@"lab8"];
        lab7.textColor = [UIColor colorWithWhite:0.4 alpha:0.8];lab8.textColor = [UIColor colorWithWhite:0.4 alpha:0.8];
    }else if (scrollView.contentOffset.y > View7.frame.origin.y+20 && scrollView.contentOffset.y < View7.frame.origin.y+35 && [lab7.text isEqualToString:@"0"]){
        [self numberAnimation:@(0) TO:@(14) Lable:lab7 name:@"lab7"];
        [self numberAnimation:@(0) TO:@(12036) Lable:lab8 name:@"lab8"];
        lab7.textColor = TEXT_COLOR lab8.textColor = TEXT_COLOR
    }
     // 数字 变化 下
    if (scrollView.contentOffset.y < (View7.frame.origin.y+View7.frame.size.height/3*2)-(SCREEN_H-64) && scrollView.contentOffset.y > (View7.frame.origin.y+View7.frame.size.height/2)-(SCREEN_H-64) && [lab7.text isEqualToString:@"14"]) {
        [self numberAnimation:@(14) TO:@(0) Lable:lab7 name:@"lab7"];
        [self numberAnimation:@(12036) TO:@(0) Lable:lab8 name:@"lab8"];
        lab7.textColor = [UIColor colorWithWhite:0.4 alpha:0.8];lab8.textColor = [UIColor colorWithWhite:0.4 alpha:0.8];
    }else if (scrollView.contentOffset.y < (View7.frame.origin.y+View7.frame.size.height/3*2)-(SCREEN_H-64) && scrollView.contentOffset.y > (View7.frame.origin.y+View7.frame.size.height/2)-(SCREEN_H-64) && [lab7.text isEqualToString:@"0"]){
        [self numberAnimation:@(0) TO:@(14) Lable:lab7 name:@"lab7"];
        [self numberAnimation:@(0) TO:@(12036) Lable:lab8 name:@"lab8"];
        lab7.textColor = TEXT_COLOR lab8.textColor = TEXT_COLOR
    }
    
    if ( scrollView.contentOffset.y > View7.frame.origin.y+20 ) {
        CGRect rect7 = View7.frame;
        rect7.origin.x = 10-(scrollView.contentOffset.y-(View7.frame.origin.y+20));
        
        CGRect rect8 = View8.frame;
        rect8.origin.x = View7.frame.size.width+20+(scrollView.contentOffset.y-(View7.frame.origin.y+20));
        
        View7.frame = rect7;
        View8.frame = rect8;
        if (rect8.origin.x > View8.frame.size.width+20+50) {
            [UIView animateWithDuration:0.3 animations:^{
                View7.alpha = 0;
                View8.alpha = 0;
            }];
        }
        if (rect8.origin.x <= View8.frame.size.width+20+50) {
            [UIView animateWithDuration:0.3 animations:^{
                View7.alpha = 1;
                View8.alpha = 1;
            }];
            
        }
        
    }
    
    //  7   ----  8  下去
    if (scrollView.contentOffset.y <= View7.frame.origin.y+20 - (SCREEN_H-64-20) && scrollView.contentOffset.y > View7.frame.origin.y - (SCREEN_H-64)) {
        CGRect rect7 = View7.frame;
        rect7.origin.x = (10 - (View7.frame.size.width/2+20)) ;
        View7.frame = rect7;
        [UIView animateWithDuration:0.3 animations:^{
            View7.alpha = 0;
        }];
        
        CGRect rect8 = View8.frame;
        rect8.origin.x = View7.frame.size.width+20+ (View8.frame.size.width/2+30);
        View8.frame = rect8;
        [UIView animateWithDuration:0.3 animations:^{
            View8.alpha = 0;
        }];
    }
    if (scrollView.contentOffset.y > (View7.frame.origin.y+20 - (SCREEN_H-64-20)) && scrollView.contentOffset.y < View7.frame.origin.y+20 - (SCREEN_H-64-View7.frame.size.height) ) {
        CGRect rect7 = View7.frame;
        rect7.origin.x = (10 - View7.frame.size.width/2)+(scrollView.contentOffset.y-(View7.frame.origin.y+20 - (SCREEN_H-64-20)));
        View7.frame = rect7;
        [UIView animateWithDuration:0.3 animations:^{
            View7.alpha = 1;
        }];
        if (View7.frame.origin.x >= 10) {
            CGRect rect7 = View7.frame;
            rect7.origin.x = 10;
            View7.frame = rect7;
            View7.alpha = 1;
        }
        
        CGRect rect8 = View8.frame;
        rect8.origin.x = (View7.frame.size.width+20+ (View8.frame.size.width/2+30))-(scrollView.contentOffset.y-(View7.frame.origin.y+20 - (SCREEN_H-64-20)));
        View8.frame = rect8;
        [UIView animateWithDuration:0.3 animations:^{
            View8.alpha = 1;
        }];
        if (View8.frame.origin.x <= View7.frame.size.width+20) {
            CGRect rect8 = View8.frame;
            rect8.origin.x = View7.frame.size.width+20;
            View8.frame = rect8;
            View8.alpha = 1;
        }

    }

    if (scrollView.contentOffset.y <= View9.frame.origin.y+50) { // 第六部分
        CGRect rect9 = View9.frame;
        rect9.origin.x = 10;
        View9.frame = rect9;
    }
    if (scrollView.contentOffset.y <= View9.frame.origin.y+50-(SCREEN_H-64-50)) {
        CGRect rect9 = View9.frame;
        rect9.origin.x = (10 - View9.frame.size.width/2) ;
        View9.frame = rect9;
        [UIView animateWithDuration:0.3 animations:^{
            View9.alpha = 0;
        }];
    }
    
   // 数字 变化 下
    if (scrollView.contentOffset.y < View9.frame.origin.y+(View9.frame.size.height/2+50)-(SCREEN_H-64) && scrollView.contentOffset.y > View9.frame.origin.y+(View9.frame.size.height/2+40)-(SCREEN_H-64) && [lab9.text isEqualToString:@"125"]) {
        [self numberAnimation:@(125) TO:@(0) Lable:lab9 name:@"lab9"];
        [UIView animateWithDuration:0.3 animations:^{
           img6.alpha = 0; img7.alpha = 0;
        } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
             img_7.alpha = 0;
          } completion:^(BOOL finished) {
              [UIView animateWithDuration:0.2 animations:^{
                img_07.alpha = 0;
              } completion:^(BOOL finished) {
                 img_007.alpha = 0;
              lab9.textColor = TEXT_COLOR_bgL9; lb19.textColor = TEXT_COLOR_bgL9;
              }];
                
            }];
        }];
    }else if (scrollView.contentOffset.y < View9.frame.origin.y+(View9.frame.size.height/2+50)-(SCREEN_H-64) && scrollView.contentOffset.y > View9.frame.origin.y+(View9.frame.size.height/2+40)-(SCREEN_H-64) && [lab9.text isEqualToString:@"0"]){
        [self numberAnimation:@(0) TO:@(125) Lable:lab9 name:@"lab9"];
        [UIView animateWithDuration:0.3 animations:^{
            img6.alpha = 1; img_007.alpha = 1;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 animations:^{
                img_07.alpha = 1;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.2 animations:^{
                    img_7.alpha = 1;
                } completion:^(BOOL finished) {
                    img7.alpha = 1;
                     lab9.textColor = TEXT_COLOR_BG; lb19.textColor = TEXT_COLOR_BG;
                }];
                
            }];
        }];
       
    }
//// 数字 变化 上
//    if (scrollView.contentOffset.y > View9.frame.origin.y+20 && scrollView.contentOffset.y < View9.frame.origin.y+30 && [lab9.text isEqualToString:@"125"]) {
//        [self numberAnimation:@(125) TO:@(0) Lable:lab9 name:@"lab9"];
//        [UIView animateWithDuration:0.6 animations:^{
//            img6.alpha = 0; img7.alpha = 0;
//        }];
//        lab9.textColor = TEXT_COLOR_bgL9; lb19.textColor = TEXT_COLOR_bgL9;
//    }else if (scrollView.contentOffset.y > View9.frame.origin.y+20 && scrollView.contentOffset.y < View9.frame.origin.y+30 && [lab9.text isEqualToString:@"0"]){
//        [self numberAnimation:@(0) TO:@(125) Lable:lab9 name:@"lab9"];
//        [UIView animateWithDuration:0.6 animations:^{
//            img6.alpha = 1; img7.alpha = 1;
//        }];
//        lab9.textColor = TEXT_COLOR_BG; lb19.textColor = TEXT_COLOR_BG;
//    }
    
    if (scrollView.contentOffset.y > View9.frame.origin.y+50-(SCREEN_H-64-50)) {
        CGRect rect9 = View9.frame;
        rect9.origin.x = (10 - View9.frame.size.width/2)+(scrollView.contentOffset.y-(View9.frame.origin.y+50-(SCREEN_H-64-50)))*2;
        View9.frame = rect9;
        [UIView animateWithDuration:0.3 animations:^{
            View9.alpha = 1;
        }];
        if (View9.frame.origin.x >= 10) {
            CGRect rect9 = View9.frame;
            rect9.origin.x = 10;
            View9.frame = rect9;
            View9.alpha = 1;
        }
        
    }
    if (scrollView.contentOffset.y > View9.frame.origin.y+50) {
        CGRect rect9 = View9.frame;
        rect9.origin.x = 10-((scrollView.contentOffset.y-(View9.frame.origin.y+50))*2);
        View9.frame = rect9;
        if (rect9.origin.x < 10-(View9.frame.size.width/2+30)) {
            [UIView animateWithDuration:0.3 animations:^{
                View9.alpha = 0;
            }];
        }
        if (rect9.origin.x >= 10-(View9.frame.size.width/2+30)) {
            [UIView animateWithDuration:0.3 animations:^{
                View9.alpha = 1;
            }];
        }
    }
    
//     NSLog(@"contentOffset111= %f",scrollView.contentOffset.y);
    if (scrollView.contentOffset.y <= View10.frame.origin.y+30-(SCREEN_H-64-30)) { // 第七部分
        CGRect rect10 = View10.frame;
        rect10.origin.x = View10.frame.size.width/2+30;
        View10.frame = rect10;
        [UIView animateWithDuration:0.3 animations:^{
            View10.alpha = 0;
        }];

    }
    if (scrollView.contentOffset.y < View10.frame.origin.y+View10.frame.size.height-(SCREEN_H-64)-20 && scrollView.contentOffset.y > View10.frame.origin.y+View10.frame.size.height-(SCREEN_H-64)-35 && [lab10.text isEqualToString:@"63395576"]) {
        [self numberAnimation:@(63395576) TO:@(0) Lable:lab10 name:@"lab10"];
        lab10.textColor = [UIColor colorWithWhite:0.4 alpha:0.8];
    }else if (scrollView.contentOffset.y < View10.frame.origin.y+View10.frame.size.height-(SCREEN_H-64)-20 && scrollView.contentOffset.y < View10.frame.origin.y+View10.frame.size.height-(SCREEN_H-64)-35 && [lab10.text isEqualToString:@"0"]){
        [self numberAnimation:@(0) TO:@(63395576) Lable:lab10 name:@"lab10"];
        lab10.textColor = TEXT_COLOR
    }
    NSLog(@"View10 = %f",View10.frame.origin.y+View10.frame.size.height-(SCREEN_H-64)-20);
    NSLog(@"View10000 = %f",View10.frame.origin.y+View10.frame.size.height-(SCREEN_H-64)-35);
   NSLog(@"View10 = %f",scrollView.contentOffset.y);
    if (scrollView.contentOffset.y > View10.frame.origin.y+30-(SCREEN_H-64-30)) {
        CGRect rect10 = View10.frame;
        rect10.origin.x = (View10.frame.size.width/2+30)-(scrollView.contentOffset.y-((View10.frame.origin.y+30)-(SCREEN_H-64-30)))*2.5;
        View10.frame = rect10;
        [UIView animateWithDuration:0.3 animations:^{
            View10.alpha = 1;
        }];
        if (View10.frame.origin.x <= 10) {
            CGRect rect10 = View10.frame;
            rect10.origin.x = 10;
            View10.frame = rect10;
        }
    }
//    NSLog(@"View10 = %f",View10.frame.origin.y);
//    NSLog(@"scrollView.contentOffset = %f",scrollView.contentOffset.y-((View10.frame.origin.y+30)-(SCREEN_H-64-30)));
//    NSLog(@"View10 = %f",scrollView.contentSize.height);
    
    if (View1.frame.origin.x == 10 && [lab1.text isEqualToString:@"0"]) {lab1.text = @"43"; lab2.text = @"200";lab1.textColor = TEXT_COLOR lab2.textColor = TEXT_COLOR}
    
    if (View3.frame.origin.x == 10 && [lab3.text isEqualToString:@"0"]) {lab3.text = @"39"; lab4.text = @"69";
            colorView.alpha = 1;
            lab3.textColor = [UIColor colorWithRed:0.3 green:0.2 blue:1 alpha:1];
            lab4.textColor = [UIColor colorWithRed:0.8 green:0.2 blue:0.4 alpha:1];}
    
    if (View4.frame.origin.x == 10 && [lab11.text isEqualToString:@"0"] ) {
        lab11.text = @"52"; lab12.text = @"16";
        lab11.textColor = TEXT_COLOR_L11;
        lab12.textColor = TEXT_COLOR_L12;
        img04.alpha = 1;
        img03.alpha = 1;}
    
    if (View5.frame.origin.x == 10 && [lab5.text isEqualToString:@"0"] ) {lab5.text = @"659"; lab6.text = @"7927008";lab5.textColor = TEXT_COLOR lab6.textColor = TEXT_COLOR}
    
    if (View7.frame.origin.x == 10 && [lab7.text isEqualToString:@"0"] ) {lab7.text = @"14"; lab8.text = @"12036";lab7.textColor = TEXT_COLOR lab8.textColor = TEXT_COLOR}
    
    if (scrollView.contentOffset.y > View9.frame.origin.y-(SCREEN_H-64 - View9.frame.size.height) ) {lab9.text = @"125"; lab9.textColor = TEXT_COLOR_BG lb19.textColor = TEXT_COLOR_BG img6.alpha = 1;img7.alpha = 1;}
    
    if (View10.frame.origin.x == 10 && [lab10.text isEqualToString:@"0"] ){lab10.text = @"63395576";lab10.textColor = TEXT_COLOR}
    
}

- (void)numberAnimation:(NSNumber*)fromNumber TO:(NSNumber*)endNumber Lable:(UILabel*)lab name:(NSString*)key{
    
    POPAnimatableProperty *prop = [POPAnimatableProperty propertyWithName:@"countdown" initializer:^(POPMutableAnimatableProperty *prop) {
        prop.writeBlock = ^(id obj, const CGFloat values[]) {
            
       lab.text = [NSString stringWithFormat:@"%d",(int)(values[0])];
        
        };
       prop.threshold = 0.018f; // 越小越快
    }];
    POPBasicAnimation *anBasic = [POPBasicAnimation linearAnimation];   //秒表当然必须是线性的时间函数
    anBasic.property = prop;    //自定义属性
    anBasic.fromValue = fromNumber;   //从xx开始
    anBasic.toValue = endNumber;  //到 xx 结束
    anBasic.duration = 0.7f;    //持续时间
    anBasic.beginTime = CACurrentMediaTime() + 0.0f;    //延迟秒开始
    [lab1 pop_addAnimation:anBasic forKey:key];
    
}



@end

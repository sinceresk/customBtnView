//
//  ShowCustomViewController.m
//  CustomBtnView
//
//  Created by sincere on 16/1/7.
//  Copyright © 2016年 sincere. All rights reserved.
//

#import "ShowCustomViewController.h"
#import "UIView+Extension.h"


@interface ShowCustomViewController ()

@end



@implementation ShowCustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *texts = @[@"华为",@"中兴",@"海信",@"腾讯",@"阿里",@"百度",@"360",@"猫扑",@"酷狗",@"网易",@"天猫",@"美丽说",@"蘑菇街",@"饿了么",@"美团",@"大众点评",@"微软",@"微信",@"google",@"联想",@"大街网",@"苹果",@"清华同方",@"大唐微电子",@"小米",@"方舟",@"方正"];

    CustomView * customView = [CustomView customViewWithTitle:@"公司" withFont:[UIFont boldSystemFontOfSize:20]withTexts:texts withWidth: DDScreenW] ;
    customView.y = 60;
    
    [self.view addSubview:customView];
    
    

}

- (void)didReceiveMemoryWarning{
    
    
    [super didReceiveMemoryWarning];

    
}



@end

//
//  CustomView.m
//  customBtnView
//
//  Created by sincere on 16/1/7.
//  Copyright © 2016年 sincere. All rights reserved.
//

#import "CustomView.h"
#import "UIView+Extension.h"



#define CustomColor Color(158, 196, 70)


@interface CustomView()
@property (nonatomic, weak)UIButton * btn;

@end


@implementation CustomView


+ (CustomView *)customViewWithTitle:(NSString *)title withFont:(UIFont *)font withTexts:(NSArray *)texts withWidth:(CGFloat)width{
   
    
    int count = 0;
    float btnW = 0;
    
    CustomView * view = [[CustomView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc]init];
    label.text = [NSString stringWithFormat:@"%@ : ",title];
    label.font = font;
    label.textColor = Color(160, 160, 160);
    CGSize size = [label.text sizeWithAttributes:@{NSFontAttributeName:font}];
    label.frame = (CGRect){{10,10},size};
    [view addSubview:label];
    for (int i = 0;  i <texts.count; i++) {
    
        UIButton * btn = [[UIButton alloc] init];
        [btn addTarget:view action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:13];
        NSString *str = texts[i];
        [btn setTitle:str forState:UIControlStateNormal];
        CGSize strsize = [str sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13.0f]}];
        
        btn.width = strsize.width + margin;
        btn.height = strsize.height+ margin;
        
        //        先计算 btn的x值，确定行数count.
                if ( 0 == i) {
                    btn.x = margin;
                    btnW += CGRectGetMaxX(btn.frame);
                }else{
                    btnW += CGRectGetMaxX(btn.frame) + margin;
                    if (btnW > width) {
                        count++;
                        btn.x = margin;
                        btnW = CGRectGetMaxX(btn.frame);
                        
                    }else{
                        btn.x = btnW - btn.width;
                    
                      }
                  }
            btn.backgroundColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.15f];
            btn.userInteractionEnabled = YES;
            btn.titleLabel.textAlignment = NSTextAlignmentCenter;
            [btn setTitleColor:Color(104, 97, 97) forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
//            再计算btn的y值
            btn.y += count *(btn.height + margin) + margin + label.height + 8;
            btn.layer.cornerRadius = btn.height/2;
            btn.clipsToBounds = YES;
            btn.tag = i;
            [view addSubview:btn];
//            根据多少btn，显示全View
            if (i == texts.count - 1) {
                view.height = CGRectGetMaxY(btn.frame) + 10;
                view.x = 0;
                view.width = width;

            }
        
    }
  
    
    return view;

}

- (void)btnClick : (UIButton *)sender{
    if (![self.btn isEqual:sender]) {
        self.btn.backgroundColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.15f];
        self.btn.selected = NO;
    }
    sender.backgroundColor = CustomColor;
    sender.selected = YES;
    self.btn = sender;


}


@end

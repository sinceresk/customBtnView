//
//  CustomView.h
//  customBtnView
//
//  Created by sincere on 16/1/7.
//  Copyright © 2016年 sincere. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  CustomViewDelegate<NSObject>
@optional

- (void)CustonView : (UIView *)view didClickWithTag: (NSInteger)tag;

@end

@interface CustomView : UIView
@property(nonatomic,assign) id<CustomViewDelegate>delegate;

/**
 *  返回一个创建好的属性视图,并且带有标题.创建好之后必须设置视图的与顶部距离Y值.
 *  @param texts 属性数组
 *  @return CustomView
 */

+ (CustomView *)customViewWithTitle :(NSString *)title withFont:(UIFont *)font withTexts:(NSArray *)texts withWidth:(CGFloat)width;


@end

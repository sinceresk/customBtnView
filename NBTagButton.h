//
//  NBTagButton.h
//  CustomBtnView
//
//  Created by sincere on 16/1/8.
//  Copyright © 2016年 sincere. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Extension.h"

@interface NBTagButton : UIButton

@property (nonatomic, copy, setter=setTagTitle:)NSString *title;
@property (nonatomic, assign) BOOL shouldAddPoundSign;
@property (nonatomic, retain, setter=setTitleFont:)UIFont *font;
@property(nonatomic) NSString *addedPoundSignTitle;


+ (instancetype)tagButton;

- (void)setTagTitle: (NSString *)tagTitle;

- (void)setTitleFont: (UIFont *)titleFont;

- (void)setCornerRadius: (CGFloat)cornerRadius;

@end


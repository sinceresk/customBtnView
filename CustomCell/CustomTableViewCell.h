//
//  CustomTableViewCell.h
//  BeautifulCell
//
//  Created by zangqilong on 15/3/26.
//  Copyright (c) 2015年 zangqilong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^handleGestureEndedBlock)(BOOL isDelete, NSIndexPath *index);

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *shadowView;

@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (weak, nonatomic) IBOutlet UILabel *functionTitle;

@property (nonatomic, strong) NSIndexPath *cellIndex;
@property (nonatomic, copy) handleGestureEndedBlock cellBlock;

@end

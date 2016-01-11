//
//  CustomTableViewCell.m
//  BeautifulCell
//
//  Created by zangqilong on 15/3/26.
//  Copyright (c) 2015年 zangqilong. All rights reserved.
//

#import "CustomTableViewCell.h"
#import <QuartzCore/QuartzCore.h>

@interface CustomTableViewCell ()
{
    UIView *snapView;
}
@end

@implementation CustomTableViewCell

- (void)awakeFromNib {
    _containerView.layer.cornerRadius=10;
    
    _shadowView.layer.shadowColor=[UIColor blackColor].CGColor;
    _shadowView.layer.shadowOffset=CGSizeMake(2, 2);
    _shadowView.layer.shadowOpacity=0.5;
    _shadowView.layer.shadowRadius=5;
    
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongpressGesture:)];
    [self.contentView addGestureRecognizer:longPress];

}

- (void)handleLongpressGesture:(UILongPressGestureRecognizer *)gesture
{
    
    CGPoint startPoint = CGPointZero;
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            snapView = [_containerView snapshotViewAfterScreenUpdates:NO];
            startPoint = [gesture locationInView:self.contentView];
            //重设layer锚点
            snapView.layer.anchorPoint = CGPointMake(startPoint.x/snapView.layer.frame.size.width-0.1, startPoint.y/snapView.layer.frame.size.height-0.1);
            snapView.frame = _containerView.frame;
            snapView.transform = CGAffineTransformMakeRotation(M_PI/30);
            [self.contentView addSubview:snapView];
             self.containerView.hidden = YES;
            self.shadowView.hidden = YES;
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            CGPoint changePoint = [gesture locationInView:self.contentView];
            [UIView animateWithDuration:0.05 animations:^{
                snapView.layer.position = changePoint;
            }];
            break;
        }
        case UIGestureRecognizerStateEnded:
        {
            NSLog(@"ended");
            CGPoint endPoint = [gesture locationInView:self.contentView];
            if (endPoint.x>self.contentView.bounds.size.width-50) {
                if (self.cellBlock) {
                    self.cellBlock(YES, _cellIndex);
                }
            }else
            {
                if (self.cellBlock) {
                    self.cellBlock(NO, _cellIndex);
                }
            }
            [snapView removeFromSuperview];
            self.containerView.hidden = NO;
            self.shadowView.hidden = NO;
            
            
            break;
        }
        default:
            break;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

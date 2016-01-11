//
//  NBTagView.h
//  CustomBtnView
//
//  Created by sincere on 16/1/8.
//  Copyright © 2016年 sincere. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NBTagButton.h"
#import "NBtpyeModel.h"

@protocol NBTagsContainerViewDelegate <NSObject>

@optional

- (void)tagsContainerViewDidSelectForumItem:(NBtpyeModel *)forumItems index:(int)index;

@end


@interface NBTagView : UIView
@property (weak, nonatomic) id<NBTagsContainerViewDelegate> delegate;
@property (assign, nonatomic) BOOL shouldAddPoundSign;


- (void)showTagsViewForModelsArray:(NSArray *)tags;

- (void)setTagColor:(UIColor *)color atIndex:(NSUInteger)idx;



@end

//
//  NBRootTableViewCell.h
//  CustomBtnView
//
//  Created by sincere on 16/1/8.
//  Copyright © 2016年 sincere. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NBTagView.h"
#import "NBtpyeModel.h"
#import "NBDataSourceFactory.h"


@interface NBRootTableViewCell : UITableViewCell<NBTagsContainerViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *chooseNameButton;
@property (weak, nonatomic) IBOutlet NBTagView *tagsView;
@property (weak, nonatomic) IBOutlet UILabel *titleNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *chooseButton;
@property (weak, nonatomic) IBOutlet UIButton *isOpenButton;


- (void)createCellViewsWithItemInfo:(NSDictionary *)infoDictionary andIsOpen: (BOOL)isOpe;

@end

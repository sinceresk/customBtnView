//
//  NBRootTableViewCell.m
//  CustomBtnView
//
//  Created by sincere on 16/1/8.
//  Copyright © 2016年 sincere. All rights reserved.
//

#import "NBRootTableViewCell.h"



static NSString *const kNBRootTableViewCellIdentifier =@"NBRootTableViewCell";

@interface NBRootTableViewCell()

@property(nonatomic, weak) NBtpyeModel * item;
@end



@implementation NBRootTableViewCell

- (void)awakeFromNib {
    

    self.tagsView.shouldAddPoundSign = NO;
    self.tagsView.hidden = YES;
    self.tagsView.delegate = self;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
}

- (void)createCellViewsWithItemInfo:(NSDictionary *)infoDictionary andIsOpen:(BOOL)isOpe{
    if (isOpe) {
        self.chooseButton.selected = YES;
        self.isOpenButton.selected = YES;
        self.tagsView.hidden = NO;
        NSMutableArray * typeModelItemsArray = (NSMutableArray *)[NBDataSourceFactory getTypeListArray:infoDictionary[@"typelist"]];
        [self.tagsView showTagsViewForModelsArray:typeModelItemsArray];
        
    }else{
        self.chooseButton.selected = NO;
        self.isOpenButton.selected = NO;
        self.tagsView.hidden = YES;
        self.chooseNameButton.text = @"全部主题";
    
    }
    self.titleNameLabel.text = infoDictionary[@"forum_name"];

}

- (void)tagsContainerViewDidSelectForumItem:(NBtpyeModel *)forumItems index:(int)index{

    _item = forumItems;
    self.chooseNameButton.text = _item.typeName;

}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end

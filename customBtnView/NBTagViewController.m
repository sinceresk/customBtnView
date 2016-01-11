//
//  NBTagViewController.m
//  CustomBtnView
//
//  Created by sincere on 16/1/8.
//  Copyright © 2016年 sincere. All rights reserved.
//

#import "NBTagViewController.h"
#import "NBRootTableViewCell.h"
#import "NBDataSourceFactory.h"


@interface NBTagViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dateSource;
@property (assign, nonatomic) NSInteger indexRow;
@property (assign, nonatomic) CGFloat cellHeight;
@end

@implementation NBTagViewController


- (void)viewDidLoad{
    [super viewDidLoad];
    [self createTableView];
    _indexRow = -1;



}


- (void)createTableView{
    self.tableView.delegate =self;
    self.tableView.dataSource =self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    if (!_dateSource) {
        _dateSource =[NSMutableArray new];
    }
    _dateSource = [NSMutableArray arrayWithArray:[NBDataSourceFactory createDateScoucre]];
    [self.tableView reloadData];
}

#pragma mark TableViewDelegate || TableViewDateSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dateSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NBRootTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"nbcell"];
    [cell createCellViewsWithItemInfo:_dateSource[indexPath.row] andIsOpen:indexPath.row ==_indexRow ? YES : NO];
    _cellHeight = cell.tagsView.frame.size.height+50;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == _indexRow) {
        return;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    _indexRow= indexPath.row;
    [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return ceilf(indexPath.row ==_indexRow ? _cellHeight:50);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}





@end

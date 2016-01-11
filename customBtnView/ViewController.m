//
//  ViewController.m
//  customBtnView
//
//  Created by sincere on 16/1/7.
//  Copyright © 2016年 sincere. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"
#import "ShowCustomViewController.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize mainTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    rowCount  = 10;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    

    return rowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomTableViewCell *cell = (CustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"customCell"];
    cell.cellIndex = indexPath;
    if (indexPath.row %2 == 0) {
        cell.functionTitle.text =  @"样式一";
        
    }else{
    
         cell.functionTitle.text =  @"样式二";
    }
    
    
    cell.cellBlock = ^(BOOL isDelete, NSIndexPath *index){
        if (isDelete) {
            
            
            [mainTableView beginUpdates];
            rowCount--;
            [mainTableView deleteRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationRight];
            [mainTableView endUpdates];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

                [mainTableView reloadData];
            });
            
        }
    };
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    switch (indexPath.row%2 ) {
        case 0:
          
            [self performSegueWithIdentifier:@"customTwo" sender:nil];
            
            break;
        case 1:
            
           [self performSegueWithIdentifier:@"customOne" sender:nil];
            
        default:
            break;
    }

 
     


}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
//    id destVC = segue;
//
//    if ([destVC isKindOfClass:[ShowCustomViewController class]]) {
//        ShowCustomViewController * svc = segue;
//        
//    }



}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

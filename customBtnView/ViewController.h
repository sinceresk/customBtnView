//
//  ViewController.h
//  customBtnView
//
//  Created by sincere on 16/1/7.
//  Copyright © 2016年 sincere. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{

    NSInteger rowCount;

}

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;


@end


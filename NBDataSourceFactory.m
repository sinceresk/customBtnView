//
//  NBDataSourceFactory.m
//  CustomBtnView
//
//  Created by sincere on 16/1/8.
//  Copyright © 2016年 sincere. All rights reserved.
//

#import "NBDataSourceFactory.h"
#import "NBtpyeModel.h"

@implementation NBDataSourceFactory

+(NSArray *)createDateScoucre{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"tagPlist" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:path options:NSDataReadingMappedIfSafe error:nil];
    NSArray *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    return dic;
}

+(NSArray *)getTypeListArray:(NSArray *)TypeItemsArray{
    NSMutableArray *modelArray = [[NSMutableArray alloc] init];
    [TypeItemsArray enumerateObjectsUsingBlock:^(NSDictionary* item, NSUInteger idx, BOOL *stop) {
        NBtpyeModel *model = [[NBtpyeModel alloc] initWithDictionary:item];
        [modelArray addObject:model];
    }];
    
    return modelArray;
}






@end

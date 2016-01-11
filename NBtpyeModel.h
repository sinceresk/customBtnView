//
//  NBtpyeModel.h
//  CustomBtnView
//
//  Created by sincere on 16/1/8.
//  Copyright © 2016年 sincere. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NBtpyeModel : NSObject
@property(nonatomic,assign) NSNumber * typeID;
@property(nonatomic,strong)NSString * typeName;

-(NBtpyeModel *) initWithDictionary : (NSDictionary *)dictionary;



@end

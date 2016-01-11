//
//  NBtpyeModel.m
//  CustomBtnView
//
//  Created by sincere on 16/1/8.
//  Copyright © 2016年 sincere. All rights reserved.
//

#import "NBtpyeModel.h"

@implementation NBtpyeModel

-(NBtpyeModel *)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (self) {
        NSDictionary * data = dictionary;
        self.typeID = data[@"typeid"];
        self.typeName = data[@"typename"];
        
    }
    return self;

}

@end

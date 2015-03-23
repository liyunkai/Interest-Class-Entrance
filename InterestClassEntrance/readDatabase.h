//
//  readDatabase.h
//  xuierLe
//
//  Created by XC on 15-3-21.
//  Copyright (c) 2015年 com.xunce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dataSou.h"
#import <sqlite3.h>

@interface readDatabase : NSObject


@property(strong,nonatomic)  dataSou *data;
@property(strong,nonatomic) NSMutableArray *subject;
@property(assign,nonatomic) int index0;

-(sqlite3 *)openDatabase;
-(void)closeDataBase:(sqlite3 *)dbName;
-(NSMutableArray *)getTablebyName:(sqlite3 *)dbName :(NSString *)tableName;

-(dataSou *)getNextQuiz:(int)index;
-(dataSou *)getLastQuiz:(int)index;
-(dataSou *)getRandQuiz:(int)index;

@end

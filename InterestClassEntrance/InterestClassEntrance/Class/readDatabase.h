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
@property(assign,nonatomic) NSInteger amount;

-(sqlite3 *)openDatabase;
-(void)closeDataBase:(sqlite3 *)dbName;
-(NSMutableArray *)getTablebyName:(NSString *)tableName;

-(dataSou *)getRandQuiz:(int)index;
-(dataSou *)getNextQuiz;
-(dataSou *)getLastQuiz;
- (dataSou *)getCurrentQuiz;
-(int *)getEvaluatebyScore:(NSMutableArray *)sub :(int *)choice;

@end

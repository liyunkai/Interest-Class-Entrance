//
//  readDatabase.m
//  xuierLe
//
//  Created by XC on 15-3-21.
//  Copyright (c) 2015年 com.xunce. All rights reserved.
//

#import "readDatabase.h"

#define DBNAME  @"test.db"
#define TABLEBAME  @"quizEysenck"

@interface readDatabase()
{
    sqlite3 *db;
}
@end

@implementation readDatabase


-(id)init{
    self = [super init];
    if (self) {

        self->db = [self openDatabase];
        self.amount = [self getCountofRows:TABLEBAME];
    }
    
    return self;
}


-(sqlite3 *)openDatabase{

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [paths objectAtIndex:0];
    NSString *database_path = [documents stringByAppendingPathComponent:DBNAME];
    
    NSFileManager *fm = [NSFileManager defaultManager];
    
    BOOL isExist = [fm fileExistsAtPath:database_path];
    
    if (!isExist)
    {
        //拷贝数据库
        
        //获取工程里，数据库的路径,因为我们已在工程中添加了数据库文件，所以我们要从工程里获取路径
        NSString *backupDbPath = [[NSBundle mainBundle]
                                  pathForResource:@"test"
                                  ofType:@"db"];
        //这一步实现数据库的添加，
        // 通过NSFileManager 对象的复制属性，把工程中数据库的路径拼接到应用程序的路径上
//        BOOL cp = [fm copyItemAtPath:backupDbPath toPath:database_path error:nil];
        [fm copyItemAtPath:backupDbPath toPath:database_path error:nil];
        
    }
    
    
    if (sqlite3_open([database_path UTF8String], &db) != SQLITE_OK) {
        sqlite3_close(db);
        NSLog(@"数据库打开失败");
    }
    
    return db;
}


//-(NSMutableArray *)getTablebyName:(NSString *)tableName{
//    
//    NSString *sqlQuery = [@"SELECT * FROM " stringByAppendingString:tableName];//quizEysenck
//    sqlite3_stmt * statement;
//    
//    NSLog(@"%@",sqlQuery);
//    
//    if (sqlite3_prepare_v2(db, [sqlQuery UTF8String], -1, &statement, nil) == SQLITE_OK) {
//        while (sqlite3_step(statement) == SQLITE_ROW) {
//            dataSou *temp = [dataSou alloc];
//            
//            int _id = sqlite3_column_int(statement, 0);
//            temp._id = _id;
//            
//            
//            char *item = (char*)sqlite3_column_text(statement, 1);
//            NSString *_item = [[NSString alloc]initWithUTF8String:item];
//            temp.item = _item;
//            
//            char *optionA = (char*)sqlite3_column_text(statement, 2);
//            NSString *_optionA = [[NSString alloc]initWithUTF8String:optionA];
//            temp.optionA = _optionA;
//            
//            char *optionB = (char*)sqlite3_column_text(statement, 3);
//            NSString *_optionB = [[NSString alloc]initWithUTF8String:optionB];
//            temp.optionB = _optionB;
//            
//            char *optionC = (char*)sqlite3_column_text(statement, 4);
//            if (optionC != nil) {
//                NSString *_optionC = [[NSString alloc]initWithUTF8String:optionC];
//                temp.optionC = _optionC;
//            }else {
//                temp.optionC = nil;
//            }
//            
//            
//            
//            char *optionD = (char*)sqlite3_column_text(statement, 5);
//            if (optionD != nil) {
//                NSString *_optionD = [[NSString alloc]initWithUTF8String:optionD];
//                temp.optionD = _optionD;
//            } else {
//                temp.optionD = nil;
//            }
//            
//            
//            char *answer = (char*)sqlite3_column_text(statement, 6);
//            NSString *_answer = [[NSString alloc]initWithUTF8String:answer];
//            temp.answer = _answer;
//            
////            [self.subject addObject:temp];
//
//        }
//    }
////    self.amount = [self.subject count];
////    return self.subject; //subject1;//
//    return nil;
//    
//}

-(void)closeDataBase:(sqlite3 *)dbName{
    sqlite3_close(dbName);
}


-(dataSou *)getNextQuiz{
    
    if (self.index0 == self.amount) {
        return nil;
    }else{
        ++ self.index0;
    }
    
    NSLog(@"next:%d",self.index0);
    
    return [self findDatabyId:TABLEBAME :self.index0];
}

-(dataSou *)getLastQuiz{
    if (self.index0 == self.amount) {
        return nil;
    }else{
        -- self.index0;
    }
    
    NSLog(@"last:%d",self.index0);
    
    return [self findDatabyId:TABLEBAME :self.index0];
    
}

- (dataSou *)getCurrentQuiz:(int)index{
    if (self.index0>=0 && self.index0<self.amount) {
        self.index0 = index;
    
        return [self findDatabyId:TABLEBAME :self.index0];
    }
    return nil;
}

-(dataSou *)getRandQuiz:(int)index{
    if (index >= 0 && index < self.amount ) {
        self.index0 = index;
        return [self findDatabyId:TABLEBAME :self.index0];
    }
    return nil;
}

#pragma mark:按照id（NOT NULL）来获取题目总数
- (int)getCountofRows:(NSString *)tableName{
    
    NSString *sqlQuery = [@"SELECT COUNT(*) AS id FROM " stringByAppendingString:tableName];//quizEysenck
    int p = 0;
    char **ss;
    
    if (sqlite3_get_table(db, [sqlQuery UTF8String], &ss, &p, nil, nil) == SQLITE_OK )
    {
        return atoi(ss[1]);
    }
    return -1;
}


#pragma mark:按照id来获取特定行的值

- (dataSou *)findDatabyId:(NSString *)tableName :(int)index{
    dataSou * temp = [dataSou alloc];
    sqlite3_stmt *statement=nil;

    NSString *sqlQuery = [NSString stringWithFormat:@"SELECT * FROM '%@' WHERE ID = ?",tableName];
    
    int flag=sqlite3_prepare_v2(db, [sqlQuery UTF8String], -1, &statement, nil);//调用预处理函数将sql语句赋值给statement对象
    if (flag==SQLITE_OK)
    {
        sqlite3_bind_int(statement, 1, index);//给问号占位符赋值
        
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                
                int _id = sqlite3_column_int(statement, 0);
                temp._id = _id;
            
            
                char *item = (char*)sqlite3_column_text(statement, 1);
                NSString *_item = [[NSString alloc]initWithUTF8String:item];
                temp.item = _item;
            
                char *optionA = (char*)sqlite3_column_text(statement, 2);
                NSString *_optionA = [[NSString alloc]initWithUTF8String:optionA];
                temp.optionA = _optionA;
            
                char *optionB = (char*)sqlite3_column_text(statement, 3);
                NSString *_optionB = [[NSString alloc]initWithUTF8String:optionB];
                temp.optionB = _optionB;
            
                char *optionC = (char*)sqlite3_column_text(statement, 4);
                if (optionC != nil) {
                    NSString *_optionC = [[NSString alloc]initWithUTF8String:optionC];
                    temp.optionC = _optionC;
                }else {
                    temp.optionC = nil;
                }
            
            
            
                char *optionD = (char*)sqlite3_column_text(statement, 5);
                if (optionD != nil) {
                    NSString *_optionD = [[NSString alloc]initWithUTF8String:optionD];
                    temp.optionD = _optionD;
                } else {
                    temp.optionD = nil;
                }
            
            
                char *answer = (char*)sqlite3_column_text(statement, 6);
                NSString *_answer = [[NSString alloc]initWithUTF8String:answer];
                temp.answer = _answer;

        }
        sqlite3_finalize(statement);
        return temp;
    }
    return nil;
}


@end

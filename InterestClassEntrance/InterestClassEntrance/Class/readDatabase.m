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
#define TABLEBAME_TALENT  @"quizTalent"

@interface readDatabase()
{
    sqlite3 *db;
    NSMutableArray *subject1;
    int pingjia[7];
}
@end

@implementation readDatabase


-(id)init{
    self = [super init];
    if (self) {
        self.index0 = 0;
//        self.subject = [[NSMutableArray alloc] init];
        self->db = [self openDatabase];
        self.amount = [self getCountofRows:TABLEBAME_TALENT];
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
        BOOL cp = [fm copyItemAtPath:backupDbPath toPath:database_path error:nil];
        NSLog(@"cp = %d",cp);
        //- (BOOL)copyItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath error:(NSError **)error
        NSLog(@"backupDbPath =%@",backupDbPath);
        
    }
    
    
    
    NSLog(@"database_path:%@",database_path);
    
    if (sqlite3_open([database_path UTF8String], &db) != SQLITE_OK) {
        sqlite3_close(db);
        NSLog(@"数据库打开失败");
    }
    
    return db;
}

//
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
//            [self.subject addObject:temp];
//
//        }
//    }
//
//    return self.subject; //subject1;//
//    
//}


-(NSMutableArray *)getAnswerbyTableName:(NSString *)tableName{

    NSString *sqlQuery = [@"SELECT * FROM " stringByAppendingString:tableName];//quizEysenck
    sqlite3_stmt * statement;
    NSMutableArray *sub = [[NSMutableArray alloc] init];

    NSLog(@"%@",sqlQuery);

    if (sqlite3_prepare_v2(db, [sqlQuery UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {

            //answer字段应该设置为非空
            char *answer = (char*)sqlite3_column_text(statement, 6);
            NSString *_answer = [[NSString alloc]initWithUTF8String:answer];

            [sub addObject:_answer];

        }
    }

    return sub; 

}

-(void)closeDataBase:(sqlite3 *)dbName{
    sqlite3_close(dbName);
}


-(dataSou *)getNextQuiz{
    
    if (self.index0 == self.amount) {
        return nil;
    }else{
        ++ self.index0;
    }
    
    return [self findDatabyId:TABLEBAME_TALENT :self.index0+1];
}

-(dataSou *)getLastQuiz{
    if (self.index0 == 0) {//[self.subject count]
        return nil;
    }else{
        -- self.index0;
    }
    
    return [self findDatabyId:TABLEBAME_TALENT :self.index0+1];
    
}

- (dataSou *)getCurrentQuiz{
    if (self.index0>=0 && self.index0<self.amount) {
//        return [self.subject objectAtIndex:self.index0];
        return [self findDatabyId:TABLEBAME_TALENT :self.index0+1];
    }
    return nil;
}

-(dataSou *)getRandQuiz:(int)index{
    if (index >= 0 && index < self.amount ) {
//        return [self.subject objectAtIndex:index];
        return [self findDatabyId:TABLEBAME_TALENT :index+1];
    }
    return nil;
}

/*
 *与评价维度函数接口
 *
 *
 *
 *
 *
 */

-(int *)getEvaluatebyScore:(NSMutableArray *)sub :(int *)choice{
    
    NSString *tmp;
    int sum = 0;
//    int 
    
    for (int i=0; i<7; i++) {
        tmp = [sub objectAtIndex:i];
        
        sum += [self getScorefromChooice: choice[i]:tmp];
        
    }
    pingjia[0] = [self cutOffScore:sum];
    
    
    sum = 0;
    for (int i=7; i<14; i++) {
        tmp = [sub objectAtIndex:i];
        
        sum += [self getScorefromChooice: choice[i]:tmp];
        
    }
    pingjia[1] = [self cutOffScore:sum];
    
    
    sum = 0;
    for (int i=14; i<20; i++) {
        tmp = [sub objectAtIndex:i];
        
        sum += [self getScorefromChooice: choice[i]:tmp];
        
    }
    pingjia[2] = [self cutOffScore:sum];
    
    
    sum = 0;
    for (int i=20; i<25; i++) {
        tmp = [sub objectAtIndex:i];
        
        sum += [self getScorefromChooice: choice[i]:tmp];
        
    }
    pingjia[3] = [self cutOffScore:sum];
    
    
    sum = 0;
    for (int i=25; i<32; i++) {
        tmp = [sub objectAtIndex:i];
        
        sum += [self getScorefromChooice: choice[i]:tmp];
        
    }
    pingjia[4] = [self cutOffScore:sum];
    
   
    sum = 0;
    for (int i=32; i<39; i++) {
        tmp = [sub objectAtIndex:i];
        
        sum += [self getScorefromChooice: choice[i]:tmp];
        
    }
    
    pingjia[5] = [self cutOffScore:sum];
    
    sum = 0;
    for (int i=39; i<44; i++) {
        tmp = [sub objectAtIndex:i];
        
        sum += [self getScorefromChooice: choice[i]:tmp];
        
    }
    pingjia[6] = [self cutOffScore:sum];
    
    NSLog(@"%d",pingjia[0]);
    NSLog(@"%d",pingjia[1]);
    NSLog(@"%d",pingjia[2]);
    NSLog(@"%d",pingjia[3]);
    NSLog(@"%d",pingjia[4]);
    NSLog(@"%d",pingjia[5]);
    NSLog(@"%d",pingjia[6]);
//    NSLog(@"%d",pingjia[0]);
    
    return pingjia;
    
}

-(int)cutOffScore:(int)sc{
    
    if (sc < 25) {
        return 25;
    } else if(sc > 85){
        return 85;
    }else
        return sc;
}

#pragma mark--是否为加*题

-(BOOL)isSpecial:(int)score{
    if (score > 8) {
        return YES;
    }
    return NO;
}

/*
 *分数提取函数
 *getScore
 *输入：选项
 *输出：得分
 */

- (int)getScorefromChooice:(int)choice :(NSString *)answer{
    
    int ans = [answer intValue];
    int marks = [self getMarks:answer];
    int score;
    
    switch (choice) {
        case 1:
            score = marks;
            break;
            
        case 2:
            score = marks/2;
            break;
            
        case 3:
        case 4:
            if ([self isSpecial:ans]) {
                score = 3;
            } else {
                score = 0;
            }
            
            break;
            
        default:
            score = 0;
            break;
    }
    
    return score;
}

/*
 *分值解析函数
 *
 *输入:正确答案
 *输出:分数
 *
 *
 *
 *   *       分数编码位3位
 *  ____   ____  ____  ____
 */

-(int)getMarks:(NSString *)answer{
    
    int ans = [answer intValue];
    int res;
    
    switch (ans & 0x07) {
        case 0:
            res = 12;
            break;
            
        case 1:
            res = 16;
            break;
            
        case 2:
            res = 18;
            break;
            
        case 3:
            res = 20;
            break;
            
        case 4:
            res = 24;
            break;
            
        case 5:
            res = 26;
            break;
            
        default:
            break;
            
    }
    
    return res;
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

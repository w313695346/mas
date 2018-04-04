//
//  ViewController.m
//  Plist
//
//  Created by 王旭东 on 2017/7/18.
//  Copyright © 2017年 WangXuDong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    [self writeData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self readData];
}

-(void) writeData
{
    //代码创建的文件
    NSArray * path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentPath = path[0];
    NSString * plistPath = [documentPath stringByAppendingPathComponent:@"Data.plist"];
    NSDictionary * dic = [[NSDictionary alloc] initWithContentsOfFile:plistPath];    

    NSMutableArray * dataArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 6; i ++) {
        [dataArray addObject:@{@"name":[NSString stringWithFormat:@"王%d",i],@"age":@(i + 20),@"adress":[NSString stringWithFormat:@"三义街%d号",i+2]}];
    }
    
    dic = @{@"userData":dataArray};
    
    [dic writeToFile:plistPath atomically:YES];
}

-(void) readData
{
    //代码创建的文件
    NSArray * path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentPath = path[0];
    NSString * plistPath = [documentPath stringByAppendingPathComponent:@"Data.plist"];
    NSDictionary * dic = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    //读取本地创建的文件路径，只能读取，不可修改
//    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
//    NSDictionary * dic = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    NSLog(@"root = %@",dic);
}

@end

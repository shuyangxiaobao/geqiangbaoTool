//
//  ViewController.m
//  geqiangbaoTool_demo
//
//  Created by 戈强宝 on 2018/4/27.
//  Copyright © 2018年 戈强宝. All rights reserved.
//

#import "ViewController.h"
#import "gqb_Person.h"
#import "geqiangbaoTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self archiverDog];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)archiverDog{
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"temp.plist"];
    
    gqb_Person *d1 = [[gqb_Person alloc] init];
    
    // 归档
    d1.name = @"人人";
    d1.age = 19;
    [NSKeyedArchiver archiveRootObject:d1 toFile:path];
    
    NSLog(@"%@",path);
    // 解档
    gqb_Person *d2 = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    NSLog(@"%@",[d2 description]);

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

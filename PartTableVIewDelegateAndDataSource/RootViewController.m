//
//  RootViewController.m
//  PartTableVIewDelegateAndDataSource
//
//  Created by 沈红榜 on 15/11/13.
//  Copyright © 2015年 沈红榜. All rights reserved.
//

#import "RootViewController.h"
#import "SHBDelegate.h"
#import "SHBCell.h"


@interface RootViewController ()

@property (nonatomic, strong) SHBDelegate *delegate;

@end

@implementation RootViewController {
    UITableView     *_tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSMutableArray *dataArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i =  0; i < 20; i++) {
        int k = arc4random() % 100 % 2;
        NSString *class = k ? NSStringFromClass([UITableViewCell class]) : NSStringFromClass([SHBCell class]);
        NSString *data = [NSString stringWithFormat:@"%@ %d",class, arc4random() % 100];
        NSDictionary *dic = @{@"class" : class, @"data" : data};
        [dataArray addObject:dic];
    }
    
    _delegate = [[SHBDelegate alloc] init];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    [self.view addSubview:_tableView];
    
    [_delegate configTableView:_tableView data:dataArray];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

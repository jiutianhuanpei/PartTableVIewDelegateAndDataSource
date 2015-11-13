//
//  SHBDelegate.m
//  PartTableVIewDelegateAndDataSource
//
//  Created by 沈红榜 on 15/11/13.
//  Copyright © 2015年 沈红榜. All rights reserved.
//

#import "SHBDelegate.h"
#import "SHBCell.h"

@implementation SHBDelegate {
    NSInteger   numberOfSections;
    Class       TableViewCellClass;
    NSArray     *_dataArray;
}

- (void)temp {
    NSArray *da = @[
      @{@"class" : @"ClassName",
        @"data" : (id)@"data"
        },
      ];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *obj = _dataArray[indexPath.row];
    NSString *class = obj[@"class"];
    id data = obj[@"data"];
    
    
//    NSString *class = NSStringFromClass([TableViewCellClass class]);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:class forIndexPath:indexPath];
    
    if ([class isEqualToString:NSStringFromClass([UITableViewCell class])]) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@", data];
    } else if ([class isEqualToString:NSStringFromClass([SHBCell class])]) {
        [(SHBCell *)cell configCell:[NSString stringWithFormat:@"SHBCell  %@", data]];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *obj = _dataArray[indexPath.row];
    NSString *class = obj[@"class"];
    return [class isEqualToString:NSStringFromClass([SHBCell class])] ? 70 : 44;
}


- (void)configTableView:(UITableView *)tableView data:(NSArray *)preData {
    _dataArray = preData;
    [preData enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *class = obj[@"class"];
        [tableView registerClass:NSClassFromString(class) forCellReuseIdentifier:NSStringFromClass([NSClassFromString(class) class])];
        
    }];
    tableView.delegate = self;
    tableView.dataSource = self;
}

@end

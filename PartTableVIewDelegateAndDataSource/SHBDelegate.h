//
//  SHBDelegate.h
//  PartTableVIewDelegateAndDataSource
//
//  Created by 沈红榜 on 15/11/13.
//  Copyright © 2015年 沈红榜. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SHBDelegate : NSObject<UITableViewDelegate, UITableViewDataSource>



/**
 @[
 @{@"class" : @"ClassName",
 @"data" : (id)@"data"},
 ];
 */
- (void)configTableView:(UITableView *)tableView data:(NSArray *)preData;

@end

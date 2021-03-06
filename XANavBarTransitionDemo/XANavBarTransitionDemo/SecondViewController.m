//
//  SecondViewController.m
//  demo_导航栏平滑过渡
//
//  Created by XangAm on 2017/8/1.
//  Copyright © 2017年 Lan. All rights reserved.
//

#import "SecondViewController.h"
#import "XANavBarTransition.h"
@interface SecondViewController ()<UITableViewDelegate,UITableViewDataSource>
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup{
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.xa_navBarAlpha = 0;
    self.title = @"2";
}

#pragma mark -<UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    cell.textLabel.text = [NSString stringWithFormat:@"cell:indexPath:%ld",indexPath.row];
    return cell;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat offsetY = scrollView.contentOffset.y;
    if(offsetY > 0){
        self.xa_navBarAlpha = (offsetY - 50 ) / 150;
    }
}

@end

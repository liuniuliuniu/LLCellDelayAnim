//
//  ViewController.m
//  LLCellDelayAnim
//
//  Created by liushaohua on 2017/1/20.
//  Copyright © 2017年 liushaohua. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic, strong)NSMutableArray *arrM;

@end

@implementation ViewController {
    NSArray *_dataArr;
    NSUInteger _lastIndex;
}



- (void)loadView{
    
    self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];

    self.view = _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellid"];
    self.tableView.rowHeight = 100;
    
    [self loadData];
    
    
}

- (void)loadData {
    _arrM = [NSMutableArray array];
    
    for (int i = 0; i < 100; i++) {
        [_arrM addObject:@(i)];
    }
    _dataArr = _arrM.copy;
    [self.tableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid" forIndexPath:indexPath];
    cell.textLabel.text = [_dataArr[indexPath.row] description];
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    
//    if (_lastIndex >= indexPath.row) {
//        return;
//    }
//    
    
    NSLog(@"%ld",(long)indexPath.row);
    
    _lastIndex = indexPath.row;

    cell.transform = CGAffineTransformMakeTranslation(0, 30);
    
    
    [UIView animateWithDuration:1 animations:^{
        cell.transform = CGAffineTransformIdentity;
    }];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

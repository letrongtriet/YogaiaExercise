//
//  LessonListViewController.m
//  YogaiaExercise
//
//  Created by Trong Triet Le on 04/03/2019.
//  Copyright © 2019 Triet Le. All rights reserved.
//

#import "LessonListViewController.h"
#import "TestLessonViewController.h"

@implementation LessonListViewController

#pragma mark - View controller life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.tableView.tableFooterView = [UIView new];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LessonListCell" forIndexPath:indexPath];
    cell.textLabel.text = @"Test";
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TestLessonViewController *vc = [[TestLessonViewController alloc] init:@"Test"];
    [self.navigationController pushViewController:vc animated:TRUE];
}

@end

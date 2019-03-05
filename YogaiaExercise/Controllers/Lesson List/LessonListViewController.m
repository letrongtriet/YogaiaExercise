//
//  LessonListViewController.m
//  YogaiaExercise
//
//  Created by Trong Triet Le on 04/03/2019.
//  Copyright © 2019 Triet Le. All rights reserved.
//

#import "LessonListViewController.h"
#import "TestLessonViewController.h"

@interface LessonListViewController()
@property (strong, nonatomic) NSArray *lessonList;
@end

@implementation LessonListViewController

#pragma mark - View controller life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.lessonList = [Lesson getTestLessonList];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.tableView.tableFooterView = [UIView new];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.lessonList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LessonListCell" forIndexPath:indexPath];
    Lesson *tempLesson = self.lessonList[indexPath.row];
    cell.textLabel.text = tempLesson.name;
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TestLessonViewController *vc = [[TestLessonViewController alloc] init:self.lessonList[indexPath.row]];
    [self.navigationController pushViewController:vc animated:TRUE];
}

@end

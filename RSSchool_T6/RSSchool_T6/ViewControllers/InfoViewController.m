//
//  InfoViewController.m
//  RSSchool_T6
//
//  Created by Никита Плахин on 6/20/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

#import "InfoViewController.h"
#import "ImageTableViewCell.h"
#import "iconNames.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewWillAppear:YES];
    [self setupViews];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)setupViews {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:ImageTableViewCell.class forCellReuseIdentifier:@"ImageTableViewCellId"];
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - delegates

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageTableViewCellId" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%lu", indexPath.row];
    return cell;
}


@end

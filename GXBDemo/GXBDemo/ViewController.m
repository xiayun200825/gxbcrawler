//
//  ViewController.m
//  GXBDemo
//
//  Created by cyb on 16/10/23.
//  Copyright © 2016年 cyb. All rights reserved.
//

#import "ViewController.h"
#import <GXBCrawler/GXBCrawler.h>

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) NSArray *code;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.data = @[@"京东", @"学信", @"移动", @"联通", @"电信", @"人行征信", @"社保", @"简历", @"开发"];
    self.code = @[@"jd", @"xuexin", @"operator", @"operator", @"operator", @"credit", @"security", @"resume", @"develop"];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

#pragma mark - UITableViewDataSource & UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.data[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [GXBCrawlerClient presentGXBViewControllerIn:self
                                        userInfo:@{@"sequenceNo":@"{sequenceNo}",
                                                   @"phone":@"{phone}",
                                                   @"name":@"{name}",
                                                   @"idcard":@"{idcard}",
                                                   @"authItem":self.code[indexPath.row]}
                                      completion:^(BOOL succeed, NSError *error) {
                                          NSLog(@"授权状态：%@,%@",@(succeed), error);
                                          [self handleAuthResult:succeed error:error];
                                      }];
}

- (void)handleAuthResult:(BOOL)succeed error:(NSError *)error {
    NSString *title;
    NSString *message;
    if (succeed) {
        title = @"授权成功";
        message = @"授权成功";
    } else {
        title = @"授权失败";
        message = [NSString stringWithFormat:@"%@,%@",@(error.code),error.userInfo];
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
}

@end

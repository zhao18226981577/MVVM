//
//  StudyViewController.m
//  MVVM
//
//  Created by 精智 on 17/6/12.
//  Copyright © 2017年 精智. All rights reserved.
//

#import "StudyViewController.h"
#import "StudyTableViewCell.h"
#import "StudyViewModel.h"
@interface StudyViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property(nonatomic, strong) UITableView *mainTableView;
@property(nonatomic, strong) NSMutableArray *dataArray;
@property(nonatomic, assign) int index;
@end

@implementation StudyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"学习";
    [self initCurrentView];
    [self loadNewData:NO];
    self.index = 1;
}
-(void)loadNewData:(BOOL)add{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    StudyViewModel *viewModel = [[StudyViewModel alloc] init];
    [viewModel setBlockWithReturnBlock:^(id result) {
        [hud hideAnimated:YES];
        if (add) {
            [self.dataArray addObjectsFromArray:result];
            if ([(NSArray *)result count] < 10) {
                [self.mainTableView.mj_footer endRefreshingWithNoMoreData];
            }else{
                [self.mainTableView.mj_footer endRefreshing];
            }
            
        }else{
            self.dataArray = result;
            [self.mainTableView.mj_footer resetNoMoreData];
            [self.mainTableView.mj_header endRefreshing];
        }
        [self.mainTableView reloadData];
    } WithErrorBlock:^(id reason) {
        [hud hideAnimated:YES];
        [Tools show:reason ToView:self.view operation:^{
            
        }];
    }];
    if (add) {
        self.index ++;
        [viewModel getStudyList:self.index];
    }else{
        self.index = 1;
        [viewModel getStudyList:self.index];
    }
    
}
-(void)initCurrentView{
    self.mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    self.mainTableView.showsVerticalScrollIndicator = NO;
    self.mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self.mainTableView registerNib:[UINib nibWithNibName:@"StudyTableViewCell" bundle:nil] forCellReuseIdentifier:@"StudyTableViewCell"];
    [self.view addSubview:self.mainTableView];
    
    __weak typeof(self) weakSelf = self;
    self.mainTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadNewData:NO];
    }];
    self.mainTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf loadNewData:YES];
    }];
}
#pragma mark - UITableView的代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    StudyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StudyTableViewCell" forIndexPath:indexPath];
    if (cell) {
        cell.model = self.dataArray[indexPath.section];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    StudyViewModel *viewModel = [[StudyViewModel alloc] init];
    [viewModel studyDetailWithStudyModel:self.dataArray[indexPath.section] WithViewController:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

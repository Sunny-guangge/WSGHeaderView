//
//  CKViewController.m
//  testScrollView
//
//  Created by user on 16/2/22.
//  Copyright © 2016年 user. All rights reserved.
//

#import "CKViewController.h"
#import "ELHeaderView.h"

@interface CKViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic, weak) ELHeaderView *headerView;

@end

@implementation CKViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
    
    
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
    
//    @"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/2047158/beerhenge.jpg",
//    @"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/2016158/avalanche.jpg",
//    @"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/1839353/pilsner.jpg",
//    @"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/1833469/porter.jpg",
    
    ELHeaderView *headerView = [[ELHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150)backGroudImageURL:@"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/2047158/beerhenge.jpg" headerImageURL:@"https://d13yacurqjgara.cloudfront.net/users/26059/screenshots/2016158/avalanche.jpg" title:@"App Store" subTitle:@"Purchase what you want"];
    headerView.viewController = self;
    headerView.scrollView = self.tableView;
    [self.view addSubview:headerView];
    _headerView = headerView;
    // Do any additional setup after loading the view, typically from a nib.
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ELViewControllerCellIdentifier"];
//    self.tableView.delegate = self;
}

- (UITableView *)tableView
{
    if (_tableView == nil) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = @(indexPath.row).description;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}

@end

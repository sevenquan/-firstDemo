//
//  ViewController.m
//  新测试
//
//  Created by seven on 16/2/22.
//  Copyright © 2016年 mtelnet. All rights reserved.
//

#import "ViewController.h"
#import "HYBNetworking.h"
#import "Masonry.h"
#import "SKTagView.h"
#import "OgeViewController.h"
@interface ViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)UIButton *iconBtn;
@property(nonatomic,strong)UITextField *nameText;
@property(nonatomic,strong)SKTagView *tagView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    NSURL *URL = [NSURL URLWithString:@"http://www.musems.com/index.php/sproduct?"];
    //    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //    [manager GET:URL.absoluteString parameters:nil success:^(NSURLSessionTask *task, id responseObject) {
    //        NSLog(@"JSON: %@", responseObject);
    //    } failure:^(NSURLSessionTask *operation, NSError *error) {
    //        NSLog(@"Error: %@", error);
    //    }];
    
    //    [manager POST:URL.absoluteString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    //
    //    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //
    //        NSLog(@"请求数据成功 －－%@",responseObject);
    //
    //    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    //
    //        NSLog(@"请求失败");
    //
    //    }];
    
    //    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    ////    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    //    [sessionManager POST:URL.absoluteString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    //        NSLog(@"%lld", downloadProgress.totalUnitCount);
    //    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //         NSLog(@"请求数据成功 －－%@",responseObject);
    //    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    //        NSLog(@"请求失败");
    //        NSLog(@"%@",error);
    //    }];
    
    
    //    NSURL *URL = [NSURL URLWithString:@"http://www.musems.com/index.php/sproduct?"];
    NSString *path = @"/index.php/sproduct";
    // 由于这里有两套基础路径，用时就需要更新
    [HYBNetworking updateBaseUrl:@"http://www.musems.com"];
    [HYBNetworking postWithUrl:path params:nil success:^(id response) {
        
        NSLog(@"成功 :%@",response);
        
    } fail:^(NSError *error) {
        
    }];
    
    
    //    __weak typeof (self)weakSelf = self;
    //    UIView *isView = [[UIView alloc] init];
    //    isView.backgroundColor = [UIColor redColor];
    //    [self.view addSubview:isView];
    //    [isView mas_makeConstraints:^(MASConstraintMaker *make) {
    ////        make.center.equalTo(weakSelf.view);
    ////        make.size.mas_equalTo(CGSizeMake(100, 100));
    ////        make.edges.mas_offset(UIEdgeInsetsMake(10, 10, 10, 10));
    //        make.top.equalTo(weakSelf.view).with.offset(40);
    ////        make.right.equalTo(weakSelf.view).with.offset(-30);
    //        make.left.equalTo(weakSelf.view).with.offset(60);
    ////        make.bottom.equalTo(weakSelf.view).with.offset(-60);
    //        make.size.mas_equalTo(CGSizeMake(200, 100));
    //
    //    }];
    //
    //    UIView *view2 = [[UIView alloc] init];
    //    view2.backgroundColor = [UIColor yellowColor];
    //    [self.view addSubview:view2];
    //    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.size.mas_equalTo(CGSizeMake(50, 50));
    //        make.centerX.equalTo(isView);
    //        make.top.equalTo(isView.mas_bottom).with.offset(30);
    //    }];
    
    

    
    
    __weak typeof (self)weakSelf = self;
    
    UIButton *icionBtn = [[UIButton alloc] init];
    icionBtn.layer.masksToBounds = YES;
    icionBtn.layer.cornerRadius = 45;
    [icionBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [icionBtn setBackgroundColor:[UIColor grayColor]];
    [icionBtn addTarget:self action:@selector(iconButton) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:icionBtn];
    self.iconBtn = icionBtn;
    
    [self.iconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(90, 90));
        make.centerX.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.view).with.offset(84);
    }];
    
    UILabel *iconLabel = [[UILabel alloc] init];
    iconLabel.textColor = [UIColor grayColor];
    iconLabel.text = @"上传社团头像";
    iconLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:iconLabel];
    
    [iconLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(icionBtn);
        make.top.equalTo(icionBtn.mas_bottom).with.offset(20);
    }];
    
    UIImageView *editicon = [[UIImageView alloc] init];
    editicon.image = [UIImage imageNamed:@""];
    editicon.backgroundColor = [UIColor greenColor];
    [self.view addSubview:editicon];
    
    [editicon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(25, 20));
        make.left.equalTo(weakSelf.view).with.offset(10);
        make.top.equalTo(iconLabel.mas_bottom).with.offset(30);
    }];
    
    UITextField *nameText = [[UITextField alloc] init];
    nameText.placeholder= @"请填写社区名（社区名最多6个字）";
    [self.view addSubview:nameText];
    self.nameText = nameText;
    
    [nameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@20);
        make.centerY.equalTo(editicon);
        make.right.equalTo(weakSelf.view).with.offset(-10);
        make.left.equalTo(editicon.mas_right).with.offset(5);
    }];
    
    UIImageView *xian = [[UIImageView alloc] init];
    xian.backgroundColor = [UIColor grayColor];
    [self.view addSubview:xian];
    
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@1);
        make.left.equalTo(weakSelf.view).with.offset(10);
        make.right.equalTo(weakSelf.view).with.offset(-10);
        make.top.equalTo(editicon.mas_bottom).with.offset(5);
    }];
    
    UILabel *tagLabel = [[UILabel alloc] init];
    tagLabel.text = @"选择标签";
    tagLabel.textColor = [UIColor blueColor];
    tagLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:tagLabel];
    
    [tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.height.mas_equalTo(@20);
        //        make.width.mas_equalTo(@60);
        make.size.mas_equalTo(CGSizeMake(60, 20));
        make.left.equalTo(weakSelf.view).with.offset(10);
        make.top.equalTo(xian).with.offset(35);
    }];
    
    UITextField *tagText = [[UITextField alloc] init];
    tagText.placeholder = @"美容颜";
    tagText.borderStyle = UITextBorderStyleRoundedRect;
    tagText.delegate = self;
    [tagText addTarget:self action:@selector(textTag) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:tagText];
    
    [tagText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(tagLabel);
        make.right.equalTo(weakSelf.view).with.offset(-10);
        make.left.equalTo(tagLabel.mas_right).with.offset(5);
    }];
    
    NSArray *array = @[@"Python", @"Javascript", @"Python", @"HTML", @"Go", @"Objective-C",@"C", @"PHP"];

    self.tagView = ({
        SKTagView *view = [SKTagView new];
        view.backgroundColor = [UIColor clearColor];
        view.padding = UIEdgeInsetsMake(0, 0, 0, 0);
        view.interitemSpacing = 5;//两个标签之间的距离
        view.lineSpacing = 5;//上下两行标签的间隔
        __weak SKTagView *weakView = view;
        view.didTapTagAtIndex = ^(NSUInteger index){
            //Remove tag
            NSLog(@"%d",(int)index);
            [weakView removeTagAtIndex:index];
//            tagText.text = [[tagText.text stringByAppendingString:@","] stringByAppendingString:str];
        };
        view;
    });
    
    
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        SKTag *tag = [SKTag tagWithText:obj];
        tag.textColor = [UIColor blackColor];
        tag.fontSize = 15;
        tag.padding = UIEdgeInsetsMake(3.5, 3.5, 3.5, 3.5);//text在标签的上下左右的距离
        tag.bgColor = [UIColor orangeColor];
        tag.cornerRadius = 5;
        [self.tagView addTag:tag];
    }];
    
    
    [self.view addSubview:self.tagView];
    [self.tagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).with.offset(10);
        make.right.equalTo(weakSelf.view).with.offset(-10);
        make.top.equalTo(tagText.mas_bottom).with.offset(10);
    }];
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:13];
    label.textColor = [UIColor redColor];
    label.text = @"PS：成员和视频越多的社团越容易被发现！";
    [self.view addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).with.offset(10);
        make.right.equalTo(weakSelf.view).with.offset(-10);
        make.top.equalTo(weakSelf.tagView.mas_bottom).with.offset(20);
    }];
    
    UIButton *commitBtn = [[UIButton alloc] init];
    commitBtn.layer.masksToBounds = YES;
    commitBtn.layer.cornerRadius = 5;
    commitBtn.layer.borderWidth = 1;
    [commitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    commitBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [commitBtn addTarget:self action:@selector(commitButton) forControlEvents:UIControlEventTouchDown];
    [commitBtn setTitle:@"登陆" forState:UIControlStateNormal];
    [self.view addSubview:commitBtn];
    
    [commitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@30);
        make.left.equalTo(weakSelf.view).with.offset(10);
        make.right.equalTo(weakSelf.view).with.offset(-10);
        make.top.equalTo(label.mas_bottom).with.offset(20);
    }];
    
//    self.navigationController.navigationBarHidden = YES;//隐藏导航条
//    [self.navigationController setNavigationBarHidden:YES animated:YES]; //设置隐藏

}

-(BOOL)prefersStatusBarHidden
{
    //    [[UIApplication sharedApplication] setStatusBarHidden:YES];//ios9以后失效了
    return YES;
}


-(void)commitButton
{
    OgeViewController *OgeVC = [[OgeViewController alloc] init];
    
    [self.navigationController pushViewController:OgeVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

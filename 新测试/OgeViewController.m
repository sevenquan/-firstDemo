//
//  OgeViewController.m
//  新测试
//
//  Created by seven on 16/3/4.
//  Copyright © 2016年 mtelnet. All rights reserved.
//

#import "OgeViewController.h"
#import "Masonry.h"
#import "UIView+Metrics.h"
@interface OgeViewController ()

@end

@implementation OgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *titleImage = [[UIImageView alloc] init];
    titleImage.image = [UIImage imageNamed:@"collections_phoro_frame.png"];
    [self.view addSubview:titleImage];
    
    
    __weak typeof (self)weakSelf = self;
    [titleImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.width.equalTo(weakSelf.view);
        make.size.mas_offset(CGSizeMake(weakSelf.view.frame.size.width, weakSelf.view.frame.size.height/5*3));
        make.top.mas_equalTo(weakSelf.view).offset(44);
        
        
    }];
    
    
    [self addButton:titleImage ImageName:@"homepage_collections_bg.png"];
    
}

-(void)addButton:(UIView *)control ImageName:(NSString *)name
{
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height/5*3, self.view.frame.size.width/2,(self.view.frame.size.height - self.view.frame.size.height/5*3)/2)];
    btn.backgroundColor = [UIColor greenColor];
    [btn setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [self.view addSubview:btn];
}


-(BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  wxxViewController.m
//  wxxClickView
//
//  Created by 1224708605@qq.com on 06/21/2017.
//  Copyright (c) 2017 1224708605@qq.com. All rights reserved.
//

#import "wxxViewController.h"

#import "testTableViewCell.h"

#import <objc/runtime.h>

#import "testView.h"


#import "UIView+WxxClick.h"

@interface wxxViewController ()<UITableViewDelegate,UITableViewDataSource>



@end

@implementation wxxViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    
    testView *v = [[[NSBundle bundleForClass:[testView class]] loadNibNamed:NSStringFromClass([testView class]) owner:nil options:nil] firstObject];
    
    [self.view addSubview:v];
    
    
    //1.
    
    Method touchesBegan = class_getInstanceMethod([self class], @selector(ttt));
    Method wxx_touchesBegan = class_getInstanceMethod([self class], @selector(yyy));
    
    method_exchangeImplementations(touchesBegan, wxx_touchesBegan);
    
    
    //2.
    UITableView *tb = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(v.frame), self.view.frame.size.width, self.view.frame.size.height - CGRectGetMaxY(v.frame)) style:(UITableViewStylePlain)];
    
    tb.delegate = self;
    tb.dataSource = self;
    
    [self.view addSubview:tb];
    
    tb.tableFooterView = [UIView new];
    
}

- (void)yyy{
    NSLog(@"6666");
}

- (void)ttt{
    NSLog(@"ttt");
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    
    [self yyy];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cc = @"testTableViewCell";
    testTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cc];
    
    if (cell == nil) {
        cell = [[testTableViewCell alloc]initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:cc];
        
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

wxxCilck(view){
    
    view.backgroundColor = [UIColor redColor];
    NSLog(@"%@", view.indexPath);
    
    //获取其他属性
    getWxxOtherView(view,label,UILabel);//label
    getWxxOtherView(view,butoon,UIButton);//butoon
    
    label.backgroundColor = [UIColor cyanColor];
    
    int y =1 +  (arc4random() % 255);
    
    NSLog(@"%d",y);
    
    [butoon setTitle:[NSString stringWithFormat:@"%d",y] forState:(UIControlStateNormal)];
    
}
wxxCilck(label){
    
    int y =1 +  (arc4random() % 255);
    
    NSLog(@"%d",y);
    
    label.backgroundColor = [UIColor colorWithRed:y/255.0 green:y/255.0 blue:y/255.0 alpha:1];
    NSLog(@"%@ %@",label, label.indexPath);
    
    
    
}

wxxCilck(butoon){
    
    
    int y =1 +  (arc4random() % 255);
    
    NSLog(@"%d",y);
    
    butoon.backgroundColor = [UIColor colorWithRed:y/255.0 green:y/255.0 blue:y/255.0 alpha:1];
}

wxxCilck(Cell_button){
    NSLog(@"%@", Cell_button.indexPath);
    
    
    int y =1 +  (arc4random() % 255);
    
    NSLog(@"%d",y);
    Cell_button.backgroundColor = [UIColor colorWithRed:y/255.0 green:y/255.0 blue:y/255.0 alpha:1];
    
}


wxxCilck(Cell_view){
    
    Cell_view.backgroundColor = [UIColor redColor];
    NSLog(@"%@", Cell_view.indexPath);
    
    //获取其他属性
    getWxxOtherView(Cell_view,Cell_label,UILabel);//label
    getWxxOtherView(Cell_view,Cell_button,UIButton);//butoon
    
    Cell_label.backgroundColor = [UIColor cyanColor];
    
    int y =1 +  (arc4random() % 255);
    
    NSLog(@"%d",y);
    Cell_label.text = [NSString stringWithFormat:@"%d",y];
    [Cell_button setTitle:[NSString stringWithFormat:@"%d",y] forState:(UIControlStateNormal)];
    
}

wxxCilck(Cell_label){
    
    int y =1 +  (arc4random() % 255);
    
    NSLog(@"%d",y);
    
    Cell_label.backgroundColor = [UIColor colorWithRed:y/255.0 green:y/255.0 blue:y/255.0 alpha:1];
    NSLog(@"%@ %@",Cell_label, Cell_label.indexPath);
    
}





@end

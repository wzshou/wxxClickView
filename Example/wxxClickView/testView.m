//
//  testView.m
//  wxxClickView
//
//  Created by Wzs 王 on 2017/6/12.
//  Copyright © 2017年 Wzs 王. All rights reserved.
//

#import "testView.h"
#import "UIView+WxxClick.h"

@interface testView ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UIView *view;

@property (weak, nonatomic) IBOutlet UIButton *butoon;
@property (weak, nonatomic) IBOutlet UIImageView *imgV;

@end

@implementation testView
- (IBAction)click:(id)sender {
    
    NSLog(@"888");
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.label.userInteractionEnabled = YES;
    
    self.label.wxxClick_name = @"label";
    self.view.wxxClick_name = @"view";

    self.butoon.wxxClick_name = @"butoon";
    
    
    
//    [self wxx_addAllClickAttributesWithResponder:self];
    
//    [self wxx_addClickattributes:@[self.label,self.view]];
    
//    [self wxx_addAllClickattributes];
    
    
    
}


wxxCilck(view){
    
    view.backgroundColor = [UIColor redColor];
    NSLog(@"%@", view.indexPath);
    
    getWxxOtherView(view,label,UILabel);
    getWxxOtherView(view,butoon,UIButton);
    
    label.backgroundColor = [UIColor cyanColor];
    
    [butoon setTitle:@"888" forState:(UIControlStateNormal)];
    
}



@end

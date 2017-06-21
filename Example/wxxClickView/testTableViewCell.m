//
//  testTableViewCell.m
//  wxxClickView
//
//  Created by Wzs 王 on 2017/6/14.
//  Copyright © 2017年 Wzs 王. All rights reserved.
//

#import "testTableViewCell.h"
#import "UIView+WxxClick.h"
#import <objc/runtime.h>


@interface testTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *Cell_label;
@property (weak, nonatomic) IBOutlet UIButton *Cell_button;
@property (weak, nonatomic) IBOutlet UIView *Cell_view;


@end

@implementation testTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        UIView *v = [[[NSBundle bundleForClass:[self class]] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
        [self addSubview:v];
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    //方式1
//    self.label.wxxClick_name = @"label";
//    self.button.wxxClick_name = @"button";
//    self.view.wxxClick_name = @"view";
    
    //方式2
//    [self wxx_addClickattributes:@[self.label,self.button,self.view]];
    
    //方式3
    [self wxx_addAllClickattributes];
    

}


@end

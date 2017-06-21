//
//  UIView+WxxClick.h
//  wxxClickView
//
//  Created by Wzs 王 on 2017/6/12.
//  Copyright © 2017年 Wzs 王. All rights reserved.
/*  此分类是专门处理控件点击的响应事件,不用麻烦的设置代理或者 block,而且还可以获取 tableView 的indexPath 只要将此控件设置成属性,然在控制器实现:wxxCilck(属性名){

label.backgroundColor = [UIColor redColor];
NSLog(@"%@ %@",label, label.indexPath);

}
 
 */

#import <UIKit/UIKit.h>

#define SEL_wxxClick(clickName) [NSString stringWithFormat:@"clickWxxViewWith_%@:",clickName]

//注意,这个点击响应方法只有写在控制器才会响应
#define wxxCilck(clickName) \
- (void)clickWxxViewWith_##clickName:(UIView *)clickName


//应用场景,在点击的响应方法里面,获取其他控件.name:是你想获取的控件名字,className:该控件的类
#define getWxxOtherView(clickName,name,className) className * name;\
\
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wundeclared-selector\"") \
_Pragma("clang diagnostic ignored \"-Wincompatible-pointer-types\"") \
name = [clickName getViewWithClickView:clickName propertySEL:@selector(name)];\
\
_Pragma("clang diagnostic pop") \


@interface UIView (WxxClick)

@property (nonatomic ,strong)NSString *wxxClick_name;
/**点击事件的响应者,如果不设置,那么默认是此控件所在的控制器*/
@property (nonatomic ,strong)id wxxClick_Responder;

/*如果 self 是 tableviewCell 或者 UICollectionViewCell 的子控件,那么就会给 self.indexPath赋值*/
@property (nonatomic, weak)NSIndexPath *indexPath;

/**将想要信号的 view 放入attributes数组中,但 view 必须是 self 的属性, view 的wxxClick_name的值默认是属性名*/
- (void)wxx_addClickattributes:(NSArray *)attributes;
/**将 self 的所有属于 view 的属性都设置wxxClick_name,并且wxxClick_name的值默认是属性名*/
- (void)wxx_addAllClickattributes;


/**将想要信号的 view 放入attributes数组中,但 view 必须是 self 的属性, 
 view 的wxxClick_name的值默认是属性名,
 wxxClick_Responder:点击事件的响应代码位置的所属的对象*/
- (void)wxx_addClickattributes:(NSArray *)attributes wxxClick_Responder:(id)wxxClick_Responder;
/**将 self 的所有属于 view 的属性都设置wxxClick_name,并且wxxClick_name的值默认是属性名,
 wxxClick_Responder:点击事件的响应代码位置的所属的对象*/
- (void)wxx_addAllClickAttributesWithResponder:(id)wxxClick_Responder;


-(UIView *)getViewWithClickView:(UIView *)view propertySEL:(SEL)propertyNameSEL;


@end

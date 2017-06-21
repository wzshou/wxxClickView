//
//  UIView+WxxClick.m
//  wxxClickView
//
//  Created by Wzs 王 on 2017/6/12.
//  Copyright © 2017年 Wzs 王. All rights reserved.
//

#import "UIView+WxxClick.h"


#import <objc/runtime.h>


@implementation UIView (WxxClick)
//
//+ (void)load{
//    
//    Method dealloc = class_getInstanceMethod(self, NSSelectorFromString(@"layoutSubviews"));
//    Method TTRefresh_dealloc = class_getInstanceMethod(self, @selector(TTRefresh_dealloc));
//    method_exchangeImplementations(dealloc, TTRefresh_dealloc);
//    
//    
//}
////- (void)awakeFromNib
//
//-(void)TTRefresh_dealloc
//{
////    if (self.scrollviewPropertyObserve) {
////        
////        [self.panGestureRecognizer removeObserver:self.scrollviewPropertyObserve forKeyPath:TTkeyPath(self.panGestureRecognizer, state) context:nil];
////        
////        [self removeObserver:self.scrollviewPropertyObserve forKeyPath:TTkeyPath(self, contentOffset) context:nil];
////        
////        [self removeObserver:self.scrollviewPropertyObserve forKeyPath:TTkeyPath(self, contentSize) context:nil];
////        
////        [self removeObserver:self.scrollviewPropertyObserve forKeyPath:TTkeyPath(self, contentInset) context:nil];
////        
////        
////        ContentInsetOnceToken = 0;
////        
////    }
//    
//    [self TTRefresh_dealloc];
//
//    
//    
////    [self wxx_addAllClickattributes];
//
//    
//    
//}


//@dynamic wxxClick_name;
//
//- (void)setWxxClick_name:(NSString *)wxxClick_name{
//    self.wxxClick_name = wxxClick_name;
//}
//- (NSString *)wxxClick_name{
//    return self.wxxClick_name;
//}

- (NSIndexPath *)indexPath{
    return objc_getAssociatedObject(self, @selector(indexPath));
    
}

- (void)setIndexPath:(NSIndexPath *)indexPath{
    
    objc_setAssociatedObject(self, @selector(indexPath), indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
- (id)wxxClick_Responder{
    return objc_getAssociatedObject(self, @selector(wxxClick_Responder));
    
}

- (void)setWxxClick_Responder:(id)wxxClick_Responder{
    
    objc_setAssociatedObject(self, @selector(wxxClick_Responder), wxxClick_Responder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}



-(NSString*)wxxClick_name{
    
    return objc_getAssociatedObject(self, @selector(wxxClick_name));
}

- (void)setWxxClick_name:(NSString *)wxxClick_name{
    
    if (wxxClick_name == nil) {
        return;
    }
    
    //0.
    if (self.userInteractionEnabled == NO) {
        self.userInteractionEnabled = YES;
    }
    
    
    //1.
    if ([self isKindOfClass:[UIControl class]]) {
        UIControl *controlView =(UIControl *)self;

        if ([self isKindOfClass:[UIButton class]]) {
                [controlView addTarget:self action:@selector(didEvent:) forControlEvents:UIControlEventTouchUpInside];
            }
            else{
                [controlView addTarget:self action:@selector(didEvent:) forControlEvents:UIControlEventValueChanged];
            }
        }
    
    //2. 给 self.wxxClick_name赋值
    objc_setAssociatedObject(self, @selector(wxxClick_name), wxxClick_name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}


#pragma mark - UIControl点击会触发
-(void)didEvent:(UIControl *)uiControl
{
    if ([self isFind]) {
        
        return;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if ([self isFind]) {
        
        return;
    }
    
    return [super touchesBegan:touches withEvent:event];
}

- (BOOL)isFind{
 
    if (self.wxxClick_name != nil) {
        
        
        NSString *selStr = SEL_wxxClick(self.wxxClick_name);
        
        SEL sel = NSSelectorFromString(selStr);
        
        
        _Pragma("clang diagnostic push")
        _Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")
        
        if (self.wxxClick_Responder != nil && [self.wxxClick_Responder respondsToSelector:sel]) {
            
                [self getCurrentViewController];
            
                [self.wxxClick_Responder performSelector:sel withObject:self];
                
                return YES;
            
        }else{
            
            
            UIViewController *vc = [self getCurrentViewController];
            
            if ([vc respondsToSelector:sel]) {
                
                [vc performSelector:sel withObject:self];
                
                return YES;
                
            }

            
        }
        
    }
//    else{//如果实在太懒,不想手动设置wxxClick_name 属性,那就打开下面的代码,只需要在控制器里面导入#import "UIViewController+wxxClick.h",然后在控制器适合的地方写上:wxxCilck(响应信号的属性名){} 即可
//        [self autoSetWxxclickWithView:(UIView *)self.nextResponder];
//        
//        UIViewController *vc = [self getCurrentViewController];
//        
//        
//        NSString *selStr = SEL_wxxClick(self.wxxClick_name);
//        
//        SEL sel = NSSelectorFromString(selStr);
//        
//        
//        _Pragma("clang diagnostic push")
//        _Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")
//        
//        if ([vc respondsToSelector:sel]) {
//            
//            [vc performSelector:sel withObject:self];
//            
//            
//            return YES;
//            
//        }
//    }
    
    
    
    return NO;

}
#pragma mark---- 自动设置信号 ----
- (NSString *)autoSetWxxclickWithView:(UIView *)view{
    
    NSString *name = [self nameWithInstance:view];

    if ([view isKindOfClass:[UIWindow class]] || [view isKindOfClass:[UIApplication class]]) {
        return nil;
    }
    
    if (name == nil) {
        
        if ([view.nextResponder isKindOfClass:[UIViewController class]] || [view.nextResponder isKindOfClass:[UIWindow class]]) {
            
            return nil;
        }
      
        if (![view.nextResponder isKindOfClass:[UIView class]]) {
            
            return nil;;
        }
        
        if ([view isKindOfClass:[UIViewController class]]) {
            return nil;
        }
        
        name = [self autoSetWxxclickWithView:(UIView *)view.nextResponder];
//        NSLog(@"name == %@, class == %@",name,NSStringFromClass([view.nextResponder class]));

    }else{
        
        self.wxxClick_name = name;
    }
    
    return name;
}


/** 获取当前View的控制器对象,并且给 self.indexPath 赋值 */
-(UIViewController *)getCurrentViewController{
    
    UITableViewCell * cell;
    UITableView * table;
    
    UICollectionViewCell *CollectionCell;
    UICollectionView *Collection;
    
    if ([self isKindOfClass:[UITableViewCell class]]) {
        
        cell = (UITableViewCell *)self;
        
    }
    if ([self isKindOfClass:[UICollectionViewCell class]]) {
        CollectionCell = (UICollectionViewCell *)self;

    }
    
    UIViewController *vc;
    
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UITableViewCell class]]) {
            
            cell = (UITableViewCell *)next;
            
        }
        if ([next isKindOfClass:[UICollectionViewCell class]]) {
            CollectionCell = (UICollectionViewCell *)next;

        }

        
        if ([next isKindOfClass:[UITableView class] ]) {
            table = (UITableView *)next;
        }
        if ([next isKindOfClass:[UICollectionView class] ]) {
            Collection = (UICollectionView *)next;
        }
        
        if ([next isKindOfClass:[UIViewController class]]) {
            
            vc = (UIViewController *)next;
            break;
        }
        next = [next nextResponder];
    } while (next != nil);
    
    if (cell && table) {
        self.indexPath = [table indexPathForCell:cell];
    }
    
    if (CollectionCell && Collection) {
        self.indexPath = [Collection indexPathForCell:CollectionCell];
    }

    
    return vc;
}

- (void)wxx_addClickattributes:(NSArray *)attributes{
    [self wxx_addClickattributes:attributes wxxClick_Responder:nil];
    
}
- (void)wxx_addClickattributes:(NSArray *)attributes wxxClick_Responder:(id)wxxClick_Responder{
    unsigned int outCount = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    
    
    for (int i = 0; i < outCount; i++) {
        
        NSString *name = @(property_getName(properties[i]));
        
        //方式1
        id property = [self valueForKey:name];
        
        if ([property isKindOfClass:[UIView class]]) {
            
            for (NSObject *obj in attributes) {
                
                if (obj == property) {
                    
                    UIView *view = (UIView *)property;
                    view.wxxClick_Responder = wxxClick_Responder;

                    view.wxxClick_name = name;
                    
                }
            }
            
        }
        
        //方式2
        //        SEL sel = NSSelectorFromString(name);
        
        //        if ([self respondsToSelector:sel]) {
        //
        //            id o = [self performSelector:sel];
        //
        //            for (NSObject *obj in attributes) {
        //
        //
        //                if (o == obj && [obj isKindOfClass:[UIView class]]) {
        //
        //                    UIView *view = (UIView *)obj;
        //                view.wxxClick_Responder = wxxClick_Responder;

        //                    view.wxxClick_name = name;
        //                    
        //                }
        //            }
        //        
        //        }
        
        
    }

}

- (void)wxx_addAllClickattributes{
    
    [self wxx_addAllClickAttributesWithResponder:nil];
}

- (void)wxx_addAllClickAttributesWithResponder:(id)wxxClick_Responder{
    unsigned int outCount = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    
    
    for (int i = 0; i < outCount; i++) {
        
        NSString *name = @(property_getName(properties[i]));
        
        //方式1
                id property = [self valueForKey:name];
        
                if ([property isKindOfClass:[UIView class]]) {
        
                    UIView *view = (UIView *)property;
                    view.wxxClick_Responder = wxxClick_Responder;
                    view.wxxClick_name = name;
        
                }
        
        //方式2
//        SEL sel = NSSelectorFromString(name);
//        
//        if ([self respondsToSelector:sel]) {
//            
//            id o = [self performSelector:sel];
//            
//            if ([o isKindOfClass:[UIView class]]) {
//                
//                UIView *view = (UIView *)o;
//                view.wxxClick_Responder = wxxClick_Responder;
//                view.wxxClick_name = name;
//            }
//            
//        }
        
        
    }

}



#pragma mark---- 获取instance的成员变量 ----
/**
 如果 self 是instance的成员变量,那么返回的是该成员变量的名字
 */
- (NSString *)nameWithInstance:(id)instance
{
    unsigned int numIvars = 0;
    NSString *key=nil;
    Ivar * ivars = class_copyIvarList([instance class], &numIvars);
    for(int i = 0; i < numIvars; i++) {
        Ivar thisIvar = ivars[i];
        const char *type = ivar_getTypeEncoding(thisIvar);
        NSString *stringType =  [NSString stringWithCString:type encoding:NSUTF8StringEncoding];
//        NSLog(@"\nthisIvar==% ",thisIvar);
//        NSLog(@"\ntype==%s ",type);
//        NSLog(@"\nstringType==%@",stringType);
        if (![stringType hasPrefix:@"@"]) {
            continue;
        }
        if ((object_getIvar(instance, thisIvar) == self)) {
            NSString *str = [NSString stringWithUTF8String:ivar_getName(thisIvar)];
            
            if (str.length > 1 )
            {
                key = [str substringFromIndex:1];
            }
            break;
        }
    }
    free(ivars);
    return key;
}

-(UIView *)getViewWithClickView:(UIView *)view propertySEL:(SEL)propertyNameSEL{
    
    
  UIView* MasterView =  [self findMaster:view ];
    
    if (MasterView && [MasterView respondsToSelector:propertyNameSEL]) {
        
        return [MasterView performSelector:propertyNameSEL];

    }
    


    
    return nil;
}

#pragma mark---- 根据 view 寻找 view 的主人 ----
- (UIView *)findMaster:(UIView *)view {
    
    NSString *name = [self nameWithInstance:view];
    
    if ([view isKindOfClass:[UIWindow class]] || [view isKindOfClass:[UIApplication class]]) {
        return nil;
    }
    
    if (name == nil) {
        
        if ([view.nextResponder isKindOfClass:[UIViewController class]] || [view.nextResponder isKindOfClass:[UIWindow class]]) {
            
            return nil;
        }
        
        if (![view.nextResponder isKindOfClass:[UIView class]]) {
            
            return nil;;
        }
        
        if ([view isKindOfClass:[UIViewController class]]) {
            return nil;
        }
        
       return  [self findMaster:(UIView *)view.nextResponder ];
        
    }else{

        return view;

    }
    
}

@end

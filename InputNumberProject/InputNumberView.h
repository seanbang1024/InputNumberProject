//
//  InputNumberView.h
//  InputNumberProject
//
//  Created by 郭榜 on 2017/4/12.
//  Copyright © 2017年 com.Madman_bg.init. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol InputNumberDelegate <NSObject>

@optional
-(void)inputNumberContent:(NSString *) content;

@end

@interface InputNumberView : UIView<UITextFieldDelegate>
@property(nonatomic, strong) UITextField *numTextField;
@property(nonatomic, strong) NSMutableArray *lineViewArray;
@property(nonatomic, strong) NSMutableArray *numberLableArray;
@property(nonatomic, assign) id<InputNumberDelegate> delegate;
@end

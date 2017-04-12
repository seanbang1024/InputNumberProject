//
//  InputNumberView.m
//  InputNumberProject
//
//  Created by 郭榜 on 2017/4/12.
//  Copyright © 2017年 com.Madman_bg.init. All rights reserved.
//

#import "InputNumberView.h"
#define perWidth 50.f
#define numberCount 6

@implementation InputNumberView

-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
    
}

-(void)createUI {
    
    [self addSubview:self.numTextField];
    [self.numTextField becomeFirstResponder];
    [self createNumberLableAndLineView];
  
}
-(void)createNumberLableAndLineView {
    
    _lineViewArray = [NSMutableArray array];
    _numberLableArray = [NSMutableArray array];
    for (int i = 0; i < numberCount; i++) {
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(perWidth * i + 10, perWidth / 2 - 2, perWidth - 20, 4)];
        lineView.backgroundColor = [UIColor blackColor];
        lineView.layer.masksToBounds = YES;
        lineView.layer.cornerRadius = 3;
        [self.numTextField addSubview:lineView];
        [_lineViewArray addObject:lineView];
        
        UILabel *numberLable = [[UILabel alloc] initWithFrame:CGRectMake(perWidth * i, 0, perWidth, perWidth)];
        numberLable.textAlignment = NSTextAlignmentCenter;
        [self.numTextField addSubview:numberLable];
        numberLable.hidden = YES;
        [_numberLableArray addObject:numberLable];
        
    }
}

-(UITextField *)numTextField {
    
    if (!_numTextField) {
        
        _numTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, perWidth * 6, perWidth)];
        _numTextField.keyboardType = UIKeyboardTypeNumberPad;
        _numTextField.delegate = self;
        _numTextField.backgroundColor = [UIColor whiteColor];
        _numTextField.tintColor = [UIColor clearColor];
        _numTextField.textColor = [UIColor clearColor];
        [_numTextField addTarget:self action:@selector(numTextfieldChange:) forControlEvents:UIControlEventEditingChanged];
        _numTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    }
    
    return _numTextField;
}

-(void)numTextfieldChange:(UITextField *) textField {
    
    if ( textField.text.length >= numberCount) {
        
        textField.text = [textField.text substringToIndex:numberCount];
        
    }
    NSInteger lenth = textField.text.length;
    if (lenth >= 0 && lenth <= numberCount) {
        
        for (NSInteger i = 0; i < numberCount; i++) {
            
            UIView *lineV = _lineViewArray[i];
            UILabel *lable = _numberLableArray[i];
            
            if (i < lenth) {
                
                lineV.hidden = YES;
                lable.hidden = NO;
                NSRange range = NSMakeRange(i, 1);
                lable.text = [textField.text substringWithRange:range];
                
            } else {
                
                lineV.hidden = NO;
                lable.hidden = YES;
                lable.text = @"";
                
            }
        }
    }
    [self.delegate inputNumberContent:textField.text];
    
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

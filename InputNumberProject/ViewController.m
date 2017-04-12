//
//  ViewController.m
//  InputNumberProject
//
//  Created by 郭榜 on 2017/4/11.
//  Copyright © 2017年 com.Madman_bg.init. All rights reserved.
//

#import "ViewController.h"
#import "InputNumberView.h"
#define perWidth 50.f
#define numberCount 6

@interface ViewController ()<InputNumberDelegate>
{
    UILabel *lable;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    lable = [[UILabel alloc] initWithFrame:CGRectMake(10, 300, 300, 50)];
    [self.view addSubview:lable];
    lable.textAlignment = NSTextAlignmentCenter;
    
    InputNumberView *inputV = [[InputNumberView alloc] initWithFrame:CGRectMake(10, 100, 300, 50)];
    inputV.delegate = self;
    [self.view addSubview:inputV];
    
}

#pragma InputNumberViewDelegate
-(void)inputNumberContent:(NSString *)content {
    
    NSLog(@"content = %@", content);
    lable.text = content;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  ViewController.m
//  显示下载进度
//
//  Created by 赵鹏 on 2018/12/26.
//  Copyright © 2018 赵鹏. All rights reserved.
//

#import "ViewController.h"
#import "ZPProgressView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet ZPProgressView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark ————— 拖动UISlider控件的时候 —————
- (IBAction)progressChange:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    
    //两个百分号就转义了，相当于一个百分号
    self.label.text = [NSString stringWithFormat:@"%.2f%%", slider.value * 100];
    
    self.progressView.progress = slider.value;
}

@end

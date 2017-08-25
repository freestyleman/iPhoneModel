//
//  ViewController.m
//  测试设备型号
//
//  Created by 付鹏举 on 17/6/1.
//  Copyright © 2017年 FuPengju. All rights reserved.
//

#import "ViewController.h"
#import "UIDevice+DeviceModel.h"

#import <sys/utsname.h>



@interface ViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"html"];
//    
 
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
//    NSLog(@"%@", [UIDevice currentDevice].deviceModel);
    
//    NSLog(@"%@", [UIDevice currentDevice].getDeviceName);
    
    
    
    // 后台返回配好的设备版本字符串
    BOOL isAdapte = [self testAdapte:@"iPhone9,2&iPhone5,3&iPhone8,2"];
    
    if (isAdapte) {
        [_webView loadRequest:request];
    }
    
    
    
}


- (BOOL)testAdapte:(NSString *)mainString
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    if ([mainString containsString:deviceString]) {
        return YES;
    }
    return NO;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}


@end

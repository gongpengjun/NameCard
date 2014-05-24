//
//  GPJViewController.m
//  NameCard
//
//  Created by Gong Pengjun on 13-12-8.
//  Copyright (c) 2013年 www.GongPengjun.com. All rights reserved.
//

#import "GPJViewController.h"

@interface GPJViewController ()
@property (weak, nonatomic) IBOutlet UILabel *pinyinLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@end

@implementation GPJViewController

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateUI) name:NSUserDefaultsDidChangeNotification object:nil];
    [self updateUI];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)updateUI
{
    NSString* name = [[NSUserDefaults standardUserDefaults] stringForKey:@"name_preference"];
    NSString* pinyin = [[NSUserDefaults standardUserDefaults] stringForKey:@"pinyin_preference"];;
    //NSLog(@"%s,%d name: [%@] length:%d",__FUNCTION__,__LINE__,name,name.length);
    //NSLog(@"%s,%d pinyin: [%@] length:%d",__FUNCTION__,__LINE__,pinyin,pinyin.length);
    //if(name.length)
    {
        self.nameLabel.text = name;
    }
    
    //if(pinyin.length)
    {
        self.pinyinLabel.text = pinyin;
    }
}

- (IBAction)aboutButtonAction:(id)sender
{
    UIAlertView *alertView =
    [[UIAlertView alloc] initWithTitle:@"发票抬头"
                               message:@"本应用是为经常开发票的人士开发的。"
     "开发票时，拿出iPhone，打开\"发票抬头\"，递给服务员即可，可以免去不断书写公司名称的麻烦。"
     "另外，本应用打开时会禁止屏幕变暗，方便服务员操作。"
                              delegate:nil
                     cancelButtonTitle:@"知道了"
                     otherButtonTitles:nil];
    [alertView show];
}

- (IBAction)settingButtonAction:(id)sender
{
    UIAlertView *alertView =
    [[UIAlertView alloc] initWithTitle:@"提示"
                               message:@"请在iPhone\"桌面\"->\"设置\"->\"发票抬头\"中设置公司名称和相应的拼音"
                              delegate:nil
                     cancelButtonTitle:@"知道了"
                     otherButtonTitles:nil];
    [alertView show];
}

@end

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

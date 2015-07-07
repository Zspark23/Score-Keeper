//
//  ScoreViewController.m
//  Score Keeper
//
//  Created by Zack Spicer on 7/6/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ScoreViewController.h"

@interface ScoreViewController ()

@end

@implementation ScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Score Keeper";
    
    _scrollView = [UIScrollView new];
    _scrollView.frame = self.view.frame;
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    
    [self.view addSubview:_scrollView];
    
    [self addScoreView:0];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)addScoreView:(int)i
{
    UIView *view = [UIView new];
    UITextField *name = [UITextField new];
    UILabel *score = [UILabel new];
    UIStepper *button = [UIStepper new];
    _scoreLabels = [NSMutableArray new];
    _viewArray = [NSMutableArray new];
    
    view.frame = CGRectMake(0.0, 0.0, _scrollView.frame.size.width, 200.0);
    [_scrollView addSubview:view];
    
    name.frame = CGRectMake(15.0, 0, 200.0, 50.0);
    name.text = @"Enter a name";
    [view addSubview:name];
    
    score.frame = CGRectMake(150.0, 0.0, 100.0, 50.0);
    [view addSubview:score];
    
    [_scoreLabels addObject:score];
    
    [view addSubview:button];
    
    button.frame = CGRectMake(view.frame.size.width - 100.0, 10.0, 100.0, 50.0);
    button.minimumValue = 0;
    button.maximumValue = 99;
    button.tag = i;
    button.wraps = YES;
    button.autorepeat = YES;
    [button addTarget:self
               action:@selector(valueChange:)
     forControlEvents:UIControlEventValueChanged];
    
    NSInteger value = button.value;
    
    score.text = [NSString stringWithFormat:@"%02lu", value];
    
    name.delegate = self;
    
    [_viewArray addObject:score];
}

- (IBAction)valueChange:(UIStepper *)sender
{
    NSInteger num = sender.value;
    UILabel *label = [UILabel new];
    label = [_scoreLabels objectAtIndex:sender.tag];
    label.text = [NSString stringWithFormat:@"%02lu", (unsigned long)num];
    [_scoreLabels replaceObjectAtIndex:sender.tag withObject:label];
}

- (BOOL)textFieldShouldReturn:(UITextField*)textField
{
    [textField resignFirstResponder];
    return NO;
}

- (void)




@end

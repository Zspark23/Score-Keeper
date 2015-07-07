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
    [self updateButtonView];
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
    
    if(!_scoreLabels)
        _scoreLabels = [NSMutableArray new];
    if(!_viewArray)
        _viewArray = [NSMutableArray new];
    if(!_buttonArray)
        _buttonArray = [NSMutableArray new];
    
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, (_viewArray.count * 50.0) + 200.0);
    
    if(_scoreLabels.count != 0)
        [[_scoreLabels objectAtIndex:(_scoreLabels.count - 1)] becomeFirstResponder];
    
    
    view.frame = CGRectMake(0.0, (_viewArray.count * 50.0) + 10.0, _scrollView.frame.size.width, 50.0);
    [_scrollView addSubview:view];
    
    name.frame = CGRectMake(15.0, 0, 200.0, 50.0);
    name.placeholder = @"Enter a name";
    [view addSubview:name];
    
    score.frame = CGRectMake(150.0, 0.0, 100.0, 50.0);
    [view addSubview:score];
    
    [_scoreLabels addObject:score];
    
    button.frame = CGRectMake(view.frame.size.width - 100.0, 10.0, 100.0, 50.0);
    button.minimumValue = 0;
    button.maximumValue = 99;
    button.tag = _buttonArray.count;
    button.wraps = YES;
    button.autorepeat = YES;
    [_buttonArray addObject:button];
    [button addTarget:self
               action:@selector(valueChange:)
     forControlEvents:UIControlEventValueChanged];
    
    [view addSubview:button];
    
    NSInteger value = button.value;
    
    score.text = [NSString stringWithFormat:@"%02lu", value];
    
    //name.delegate = self;
    
    [_viewArray addObject:view];
    
    _addScore.frame = CGRectMake((self.view.frame.size.width / 2 ) - 100.0, (50.0 * _viewArray.count), 120.0, 50.0);
    _removeScore.frame = CGRectMake(self.view.frame.size.width / 2, (50.0 * _viewArray.count), 120.0, 50.0);
    
    [_scrollView addSubview:_addScore];
    [_scrollView addSubview:_removeScore];
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

- (void)removeLastScore
{
    if(_viewArray.count != 0)
    {
        [[_viewArray objectAtIndex:(_viewArray.count - 1)] removeFromSuperview];
        [_viewArray removeLastObject];
        [_buttonArray removeLastObject];
        [_scoreLabels removeLastObject];
        
        _addScore.frame = CGRectMake((self.view.frame.size.width / 2 ) - 100.0, (50.0 * _viewArray.count), 120.0, 50.0);
        _removeScore.frame = CGRectMake(self.view.frame.size.width / 2, (50.0 * _viewArray.count), 120.0, 50.0);
        
        [_scrollView addSubview:_addScore];
        [_scrollView addSubview:_removeScore];
    }
}

- (void)updateButtonView
{
    if(!_addScore && !_removeScore)
    {
        _addScore = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _removeScore = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        [_scrollView addSubview:_addScore];
        [_scrollView addSubview:_removeScore];
    }
    
    [_removeScore setTitle:@"Remove Score" forState:UIControlStateNormal];
    [_addScore setTitle:@"Add Score" forState:UIControlStateNormal];

    
    [_addScore addTarget:self
                  action:@selector(addScoreView:)
        forControlEvents:UIControlEventTouchUpInside];
    
    [_removeScore addTarget:self
                     action:@selector(removeLastScore)
           forControlEvents:UIControlEventTouchUpInside];
    
    _addScore.frame = CGRectMake((self.view.frame.size.width / 2 ) - 100.0, (50.0 * _viewArray.count), 120.0, 50.0);
    _removeScore.frame = CGRectMake(self.view.frame.size.width / 2, (50.0 * _viewArray.count), 120.0, 50.0);
    
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, (50.0 * _viewArray.count) + 50.0);

    
}



@end

//
//  ScoreViewController.h
//  Score Keeper
//
//  Created by Zack Spicer on 7/6/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoreViewController : UIViewController

@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) NSMutableArray *scoreLabels;
@property (nonatomic) NSMutableArray *viewArray;
@property (nonatomic) NSMutableArray *buttonArray;
@property (nonatomic) UIButton *addScore;
@property (nonatomic) UIButton *removeScore;
@property (nonatomic) NSInteger tagNum;

- (void)addScoreView:(int)i;
- (void)removeLastScore;
- (void)updateButtonView;

@end

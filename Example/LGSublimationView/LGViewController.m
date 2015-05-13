//
//  LGViewController.m
//  LGSublimationView
//
//  Created by Luke Geiger on 05/12/2015.
//  Copyright (c) 2014 Luke Geiger. All rights reserved.
//

#import "LGViewController.h"
#import <LGSublimationView/LGSublimationView.h>

@interface LGViewController () <LGSublimationViewDelegate>

@end

@implementation LGViewController


#pragma mark - Life Cycle

- (void)loadView
{
    [super loadView];
    
    LGSublimationView *lgSublimer = [[LGSublimationView alloc]initWithFrame:self.view.bounds];
    
    NSMutableArray*views = [NSMutableArray new];
    for (int i  = 1; i<=4; i++) {
        UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        view.image = [UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",i]];
        [views addObject:view];
    }
    
    lgSublimer.titleLabelTextColor = [UIColor whiteColor];
    lgSublimer.descriptionLabelTextColor = [UIColor whiteColor];
    lgSublimer.delegate = self;
    lgSublimer.titleLabelFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    lgSublimer.descriptionLabelFont = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:20];
    lgSublimer.titleStrings = @[@"This is title one",
                                @"This is title two",
                                @"This is title three",
                                @"This is title four"];
    lgSublimer.descriptionStrings = @[@"This is a description of one",
                                      @"This is description two and also happens to be multi line, which is sweet"
                                      ,@"This is description three",
                                      @"follow luke on twitter @lukejgeiger"];
    lgSublimer.viewsToSublime = views;
    [self.view addSubview:lgSublimer];
}

#pragma mark - LGSublimationViewDelegate

-(void)lgSublimationView:(LGSublimationView *)view didEndScrollingOnPage:(NSUInteger)page
{
    NSLog(@"Current Page %i",(int)page);
}

@end

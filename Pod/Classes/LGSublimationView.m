//
//  LGSublimationScrollView.m
//  LGSublimeScrollView
//
//  Created by Luke Geiger on 5/11/15.
//  Copyright (c) 2015 6th Man Apps. All rights reserved.
//

#import "LGSublimationView.h"

@interface LGSublimationView() <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *titleLabelsArray;
@property (nonatomic, strong) NSMutableArray *descriptionLabelsArray;
@property (nonatomic, assign) float lastXOffset;
@property (nonatomic, assign) int currentPage;
@end

@implementation LGSublimationView

#pragma mark - Setter Overrides

-(void)setViewsToSublime:(NSArray *)viewsToSublime
{
    _viewsToSublime = viewsToSublime;
    for (int i = (int)viewsToSublime.count; i>0 ;i--) {
        UIView *view = [viewsToSublime objectAtIndex:i-1];
        view.tag = i;
        view.alpha = (i==1)?1:0;
        [self addSubview:view];
    }
    
    _pageControl.numberOfPages = viewsToSublime.count;
    _scrollView.contentSize = CGSizeMake(self.frame.size.width*viewsToSublime.count, self.frame.size.height);
    [self addSubview:_inbetweenView];
    [self addSubview:_scrollView];
    [self addSubview:_pageControl];
}

-(void)setInbetweenView:(UIView *)inbetweenView
{
    _inbetweenView = inbetweenView;
    [self insertSubview:_inbetweenView belowSubview:_scrollView];
}

-(void)setTitleStrings:(NSArray *)titleStrings
{
    _titleStrings = titleStrings;
    [_titleLabelsArray removeAllObjects];
    for (int i = (int)titleStrings.count; i>0 ;i--) {
        
        NSString *string = [titleStrings objectAtIndex:i-1];
        CGSize expectedSize = [string boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName: _titleLabelFont} context:nil].size;
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake((i-1)*self.frame.size.width, _titleLabelY, self.frame.size.width, floor(expectedSize.height))];
        
        label.lineBreakMode = NSLineBreakByCharWrapping;
        label.text = string;
        label.numberOfLines = 0;
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = _titleLabelTextColor;
        label.font = _titleLabelFont;
        
        [_scrollView addSubview:label];
        [_titleLabelsArray addObject:label];
    }
}

-(void)setDescriptionStrings:(NSArray *)descriptionStrings
{
    _descriptionStrings = descriptionStrings;
    [_descriptionLabelsArray removeAllObjects];
    for (int i = (int)descriptionStrings.count; i>0 ;i--) {
        
        NSString *string = [descriptionStrings objectAtIndex:i-1];
        CGSize expectedSize = [string boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName: _descriptionLabelFont} context:nil].size;
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake((i-1)*self.frame.size.width,_descriptionLabelY,self.frame.size.width,expectedSize.height)];
        
        label.lineBreakMode = NSLineBreakByCharWrapping;
        label.text = string;
        label.numberOfLines = 0;
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = _descriptionLabelTextColor;
        label.font = _descriptionLabelFont;
        
        [_scrollView addSubview:label];
        [_descriptionLabelsArray addObject:label];
    }
}

-(void)setTitleLabelFont:(UIFont *)titleLabelFont
{
    _titleLabelFont = titleLabelFont;
    for (UILabel*label in _titleLabelsArray) {
        
        NSString *string = label.text;
        CGSize expectedSize = [string boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName: _descriptionLabelFont} context:nil].size;
        
        label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, label.frame.size.width, floor(expectedSize.height));
        label.font = titleLabelFont;
    }
}

-(void)setDescriptionLabelFont:(UIFont *)descriptionLabelFont
{
    _descriptionLabelFont = descriptionLabelFont;
    for (UILabel*label in _descriptionLabelsArray) {
        
        NSString *string = label.text;
        CGSize expectedSize = [string boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName: _descriptionLabelFont} context:nil].size;
        
        label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, label.frame.size.width, floor(expectedSize.height));
        label.font = descriptionLabelFont;
    }
}

-(void)setTitleLabelTextColor:(UIColor *)titleLabelTextColor
{
    _titleLabelTextColor = titleLabelTextColor;
    for (UILabel*label in _titleLabelsArray) {
        label.textColor = titleLabelTextColor;
    }
}

-(void)setDescriptionLabelTextColor:(UIColor *)descriptionLabelTextColor
{
    _descriptionLabelTextColor = descriptionLabelTextColor;
    for (UILabel*label in _descriptionLabelsArray) {
        label.textColor = descriptionLabelTextColor;
    }
}

-(void)setTitleLabelY:(CGFloat)titleLabelY
{
    _titleLabelY = titleLabelY;
    for (int i = (int)_titleStrings.count; i>0 ;i--) {
        UILabel *titleLabel = [_titleLabelsArray objectAtIndex:i-1];
        titleLabel.frame = CGRectMake(titleLabel.frame.origin.x, _titleLabelY, titleLabel.frame.size.width, titleLabel.frame.size.height);
    }
}

-(void)setDescriptionLabelY:(CGFloat)descriptionLabelY
{
    _descriptionLabelY = descriptionLabelY;
    for (int i = (int)_descriptionLabelsArray.count; i>0 ;i--) {
        UILabel *descLabel = [_descriptionLabelsArray objectAtIndex:i-1];
        descLabel.frame = CGRectMake(descLabel.frame.origin.x, _descriptionLabelY, descLabel.frame.size.width, descLabel.frame.size.height);
    }
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    _scrollView.frame = self.bounds;
    _scrollView.contentSize = CGSizeMake(self.frame.size.width*_viewsToSublime.count, self.frame.size.height);
    _titleLabelY = self.frame.size.height - 200;
    _descriptionLabelY = self.frame.size.height - 150;
    _pageControl.frame = CGRectMake(0, self.frame.size.height-30, self.frame.size.width, 20);
    
    for (int i = (int)_titleStrings.count; i>0 ;i--) {
        UILabel *titleLabel = [_titleLabelsArray objectAtIndex:i-1];
        titleLabel.frame = CGRectMake((_titleStrings.count - i)*self.frame.size.width, _titleLabelY, self.frame.size.width, titleLabel.frame.size.height);
    }
    for (int i = (int)_descriptionLabelsArray.count; i>0 ;i--) {
        UILabel *descLabel = [_descriptionLabelsArray objectAtIndex:i-1];
        descLabel.frame = CGRectMake((_titleStrings.count - i)*self.frame.size.width, _descriptionLabelY, self.frame.size.width, descLabel.frame.size.height);
    }
}

#pragma mark - Life Cycle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self defaultSettings];
    }
    return self;
}

-(id)init
{
    self = [super init];
    if (self) {
        [self defaultSettings];
    }
    return self;
}

#pragma mark - Settings

-(void)defaultSettings
{
    _lastXOffset = 0;
    _currentPage = 1;
    
    self.backgroundColor = [UIColor blackColor];
    
    _scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.frame.size.height-30, self.frame.size.width, 20)];
    
    _titleLabelsArray = [NSMutableArray new];
    _descriptionLabelsArray = [NSMutableArray new];
    
    _titleLabelFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    _descriptionLabelFont = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:20];
    _titleLabelY = self.frame.size.height - 200;
    _descriptionLabelY = self.frame.size.height - 150;
}

#pragma mark - Scroll View Delegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int currentPage = self.currentPage;
    int nextPage = (scrollView.contentOffset.x >= self.lastXOffset)?currentPage + 1:currentPage - 1;
    
    float max = currentPage * scrollView.frame.size.width;
    float min = (currentPage - 2) * scrollView.frame.size.width;
    
    if (scrollView.contentOffset.x > max) {
        [scrollView setContentOffset:CGPointMake(max - 0.5, scrollView.contentOffset.y)];
    }
    else if (scrollView.contentOffset.x < min){
        [scrollView setContentOffset:CGPointMake(min - 0.5, scrollView.contentOffset.y)];
    }
    
    UIView *currentPageView = [self viewWithTag:currentPage];
    UIView *nextPageView = [self viewWithTag:nextPage];
    
    float adjustedOffsetForPage = scrollView.contentOffset.x - (scrollView.frame.size.width*(currentPage-1));
    float maxOffset = scrollView.frame.size.width;
    float percentageScrolledOnCurrentPage = fabs(adjustedOffsetForPage/maxOffset);
    
    if (nextPage > 0 && nextPage < _viewsToSublime.count + 1) {
        currentPageView.alpha = 1 - percentageScrolledOnCurrentPage;
        nextPageView.alpha = percentageScrolledOnCurrentPage;
    }
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    scrollView.userInteractionEnabled = NO;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _lastXOffset = scrollView.contentOffset.x;
    _currentPage = [self currentPageCalc];
    scrollView.userInteractionEnabled = YES;
    
    if ([self.delegate respondsToSelector:@selector(lgSublimationView:didEndScrollingOnPage:)]) {
        [self.delegate lgSublimationView:self didEndScrollingOnPage:self.currentPage];
    }
    
    _pageControl.currentPage = _currentPage-1;
}

#pragma mark - Helpers

-(int)currentPageCalc
{
    CGFloat pageWidth = self.frame.size.width;
    return floor((_scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 2;
}

@end

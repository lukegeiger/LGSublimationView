//
//  LGSublimationScrollView.h
//  LGSublimeScrollView
//
//  Created by Luke Geiger on 5/11/15.
//  Copyright (c) 2015 6th Man Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LGSublimationViewDelegate;

/**
 The LGSublimationView is an alternative to the way a standard UIScrollView looks when scrolling. Instead of scrolling the background views of it's content view, it just scrolls labels, and the background views 'sublime' from one to another.
 */
@interface LGSublimationView : UIView

/**
 Set this with an array of UIViews, these will become the views that get 'sublimed"
 */
@property (nonatomic, strong) NSArray *viewsToSublime;

/**
 Set this with an array of NSStrings. These are the strings that are used to create the labels on the scroll view. Put them in order of how you want them to appear. To have a two line title just include \n in the string.
 */
@property (nonatomic, strong) NSArray *titleStrings;

/**
 Set this with an array of NSStrings. These are the strings that are used to create the descriptions on the scroll view. Put them in order of how you want them to appear. To have a two line description just include \n in the string.
 */
@property (nonatomic, strong) NSArray *descriptionStrings;

/**
 Set this with a font that you want the titles to appear with. The title labels will automatically adjust their height based on font size, so you should not need to worry about how big the font size is.
 */
@property (nonatomic, strong) UIFont  *titleLabelFont;

/**
 Set this with a color you want the title labels to appear with.
 */
@property (nonatomic, strong) UIColor *titleLabelTextColor;

/**
 Set this with a font that you want the descriptions to appear with. The description labels will automatically adjust their height based on font size, so you should not need to worry about how big the font size is.
 */
@property (nonatomic, strong) UIFont  *descriptionLabelFont;

/**
 Set this with a color you want the description labels to appear with.
 */
@property (nonatomic, strong) UIColor *descriptionLabelTextColor;

/**
 This is the page control, if you do not want it to appear just set its hidden property. To change its location you can just set its frame.
 */
@property (nonatomic, strong) UIPageControl *pageControl;

/**
 Set this with a starting Y position for the title labels. The Default is -200 from the bottom of the frame.
 */
@property (nonatomic, assign) CGFloat titleLabelY;

/**
 Set this with a starting Y position for the description labels. The Default is -150 from the bottom of the frame.
 */
@property (nonatomic, assign) CGFloat descriptionLabelY;

/**
 This is an assinable view that is above the background, but below the scroll view. A common use case would be to assign this to a view with a alpha less than 1 to act as a shade over the view.
 */
@property (nonatomic, weak) UIView *inbetweenView;

/**
 This is an assinable view that is above the background, but below the scroll view. A common use case would be to assign this to a view with a alpha less than 1 to act as a shade over the view.
 */
@property (nonatomic, assign) BOOL isInfinite;


/**
 The Delegate.
 */
@property (nonatomic,unsafe_unretained) NSObject<LGSublimationViewDelegate>* delegate;
@end

@protocol LGSublimationViewDelegate <NSObject>
@optional
/**
 An optional delegate method that will get called when the view completes scrolling.
 @param view
 A reference to the sublime view
 @param page
 The page number that gets scrolled to. It is not 0 based.
 */
-(void)lgSublimationView:(LGSublimationView*)view didEndScrollingOnPage:(NSUInteger)page;
@end
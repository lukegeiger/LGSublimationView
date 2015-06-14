# LGSublimationView

[![Version](https://img.shields.io/cocoapods/v/LGSublimationView.svg?style=flat)](http://cocoapods.org/pods/LGSublimationView)
[![License](https://img.shields.io/cocoapods/l/LGSublimationView.svg?style=flat)](http://cocoapods.org/pods/LGSublimationView)
[![Platform](https://img.shields.io/cocoapods/p/LGSublimationView.svg?style=flat)](http://cocoapods.org/pods/LGSublimationView)

<p align="center">
  <img src="https://raw.githubusercontent.com/lukegeiger/LGSublimationView/master/Example/images/geiger_sublimer.gif"alt="LukeGeigerSublimer">
</p>

## Introduction

The LGSublimationView is a view that has a cool paging animation on its UIScrollView. The effect it gives off is that there are views behind the scroll view that don't scroll with the scroll view. Rather, when the scroll view pages, they cross dissolve into one another.

- This view has the ability to also add titles, and descriptions to each of the views a part of its scroll view.
- Super lightweight, and customizable. All fonts, colors, etc are editable.

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```objective-c
    //This is an example.
    LGSublimationView *lgSublimer = [[LGSublimationView alloc]initWithFrame:self.view.bounds];
    
    //Optional protocol methods
    lgSublimer.delegate = self;

    //This is just for the purposes of the demo. You probably wouldn't do this.
    NSMutableArray*views = [NSMutableArray new];
    for (int i  = 1; i<=4; i++) {
        UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        view.image = [UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",i]];
        view.contentMode = UIViewContentModeScaleAspectFill;
        [views addObject:view];
    }
    
    //Based on how many views are in this array, will determine how many times you can scroll the scroll view which applies the sublime effect.
    lgSublimer.viewsToSublime = views;

    lgSublimer.titleLabelTextColor = [UIColor whiteColor];
    lgSublimer.descriptionLabelTextColor = [UIColor whiteColor];
    lgSublimer.titleLabelFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    lgSublimer.descriptionLabelFont = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:20];
    
    //Titles are optional
    lgSublimer.titleStrings = @[@"This is title one",
                                @"This is title two",
                                @"This is title three",
                                @"This is title four"];
    
    //Descriptions are optional
    lgSublimer.descriptionStrings = @[@"This is a description of one",
                                      @"This is description two and also happens to be multi line, which is sweet"
                                      ,@"This is description three",
                                      @"follow luke on twitter @lukejgeiger"];
    
    
    
    // An optional assign property on the LGSublimer. You can use this if your views are images. It helps make the text appear more readable if there is a slight black tint over the view.
    UIView* shadeView = [[UIView alloc]initWithFrame:lgSublimer.frame];
    shadeView.backgroundColor = [UIColor blackColor];
    shadeView.alpha = .5;
    lgSublimer.inbetweenView = shadeView;
    
    [self.view addSubview:lgSublimer];

```

## Installation

LGSublimationView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "LGSublimationView"
```

## Author

Luke Geiger, lukejamesgeiger@gmail.com

## License

LGSublimationView is available under the MIT license. See the LICENSE file for more info.

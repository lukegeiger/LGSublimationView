# LGSublimationView

[![Version](https://img.shields.io/cocoapods/v/LGSublimationView.svg?style=flat)](http://cocoapods.org/pods/LGSublimationView)
[![License](https://img.shields.io/cocoapods/l/LGSublimationView.svg?style=flat)](http://cocoapods.org/pods/LGSublimationView)
[![Platform](https://img.shields.io/cocoapods/p/LGSublimationView.svg?style=flat)](http://cocoapods.org/pods/LGSublimationView)

<p align="center">
  <img src="https://github.com/lukegeiger/LGSublimationView/blob/master/Example/images/sublimer.gif" alt="LukeGeigerSublimer">
</p>

## Introduction

Literally, all this view is, is a view with a UIScrollView. The effect it gives off is that there are views behind the scroll view that don't scroll with the scroll view. Rather, when the scroll view pages, they cross disolve into one another. This view has the ability to also add titles, and descriptions to each of the views a part of its scroll view.

The LGSublimationView isdesigned to be super lightweight, and customizable. All fonts, colors, etc are editable.

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```objective-c
    //This is an example.
    LGSublimationView *lgSublimer = [[LGSublimationView alloc]initWithFrame:self.view.bounds];
    
    NSMutableArray*views = [NSMutableArray new];
    for (int i  = 0; i<4; i++) {
        UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        view.image = [UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",i+1]];
        [views addObject:view];
    }
    
    lgSublimer.titleLabelTextColor = [UIColor whiteColor];
    lgSublimer.descriptionLabelTextColor = [UIColor whiteColor];
    lgSublimer.delegate = self;
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
    lgSublimer.viewsToSublime = views;
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

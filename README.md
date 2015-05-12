# LGSublimationView

[![Version](https://img.shields.io/cocoapods/v/LGSublimationView.svg?style=flat)](http://cocoapods.org/pods/LGSublimationView)
[![License](https://img.shields.io/cocoapods/l/LGSublimationView.svg?style=flat)](http://cocoapods.org/pods/LGSublimationView)
[![Platform](https://img.shields.io/cocoapods/p/LGSublimationView.svg?style=flat)](http://cocoapods.org/pods/LGSublimationView)

<p align="center">
  <img src="https://github.com/lukegeiger/LGSublimationView/blob/master/Example/images/sublimer.gif" alt="LukeGeigerSublimer">
</p>


## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```objective-c
    //This is an example.
    NSMutableArray*views = [NSMutableArray new];
    for (int i  = 0; i<4; i++) {
        UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,       self.view.frame.size.height)];
        view.image = [UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",i+1]];
        [views addObject:view];
    }
    
    LGSublimationView *lgSublimer = [[LGSublimationView alloc]initWithFrame:self.view.bounds];
    lgSublimer.titleLabelTextColor = [UIColor whiteColor];
    lgSublimer.descriptionLabelTextColor = [UIColor whiteColor];
    lgSublimer.delegate = self;
    lgSublimer.titleLabelFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    lgSublimer.descriptionLabelFont = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:20];
    lgSublimer.titleStrings = @[@"This is title one",
                                @"This is title two",
                                @"This is title three",
                                @"This is title four"];
    lgSublimer.descriptionStrings = @[@"this is description one",
                                      @"This is description two"
                                      ,@"This is description three",
                                      @"This is description four"];
    lgSublimer.viewsToSublime = views;
    lgSublimer.titleLabelY = self.frame.size.height - 200;
    lgSublimer.descriptionLabelY = self.frame.size.height - 150;
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

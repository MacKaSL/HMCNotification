# HMCNotification

A simple iOS 8 push notification style control to show quick messages to the user.


## Installation:

1) Make a Pod file and add following

```
source 'https://github.com/CocoaPods/Specs.git'
target '<TARGET_NAME>' do
	pod 'HMCNotification', '~> 1.0'
end
```

## Note: 
Default blur effect with `UIBlurEffectStyleExtraLight`

Default font color `black`

Change values
```
[HMCNotification sharedInstance].titleFontColor = [UIColor yellowColor];
[HMCNotification sharedInstance].blurStyle = UIBlurEffectStyleLight;
```

And then show the notification using:
```
[HMCNotification showCustomPushWithTitle:@"Woohooo" message:@"Congrtaz, It all went successfully. Now you've become a part of iOS dev family" iconImageName:@"pushIconHappy"];
```


![Notification View iPhone Screenshot](https://raw.githubusercontent.com/MacKaSL/HMCNotification/master/snapshot.PNG)

Enjoy :smiley:
===

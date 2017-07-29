# To calculate NSString height for cocoa
I searched and tried many solutions for iOS and MacOS with version older than 10.12, only [This one](https://stackoverflow.com/questions/5518147/accurately-calculating-text-height-in-cocoa-for-mac-not-ios/18173210#18173210) works for me on MacOS 10.12.

This is an example to calculate string height given fixed NSfont, font size, and width of NSTextField. When the slider changes font size of 1st line string, the 2nd line string's height follows the first line string's height when its height changes.

<p align="center"> 
<img src="https://github.com/ZHANGneuro/calculate-NSString-height/blob/master/giphy.gif">
</p>


# calculate-NSString-height
Given fixed NSfont, font size, and width of NSTextField, calculate string height based on 

CGFloat minHeight = [((NSTextFieldCell *)[yourTextField cell]) cellSizeForBounds:NSMakeRect(0, 0, YOUR_MAX_WIDTH, FLT_MAX)].height; // from the Answer [HERE](https://stackoverflow.com/questions/5518147/accurately-calculating-text-height-in-cocoa-for-mac-not-ios/18173210#18173210)

In this example, when slider movement changes the font size for 1st line string, and the 2nd line string' height follows the first line string's height.

<p align="center"> 
<img src="https://github.com/ZHANGneuro/calculate-NSString-height/blob/master/giphy.gif">
</p>


//
//  AppDelegate.h
//  Height_text
//
//  Created by boo on 28/07/2017.
//  Copyright © 2017 boo. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property NSWindow *window;
@property NSView *titleBarView;
@property NSView *titlebar;
@property CGFloat title_height;
@property NSSlider* slider;
@property NSTextField *showTitle;
@property NSTextField *showTextHeight;
@property NSTextField *showTextBelowTitle;

@property NSVisualEffectView *backgroundview;



@end


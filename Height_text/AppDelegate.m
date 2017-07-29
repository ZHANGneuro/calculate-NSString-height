//
//  AppDelegate.m
//  Height_text
//
//  Created by boo on 28/07/2017.
//  Copyright © 2017 boo. All rights reserved.
//


//  https://stackoverflow.com/questions/5518147/accurately-calculating-text-height-in-cocoa-for-mac-not-ios/18173210#18173210


//  https://stackoverflow.com/users/2121795/vigorouscoding




#import "AppDelegate.h"

@implementation AppDelegate
@synthesize window, titleBarView,titlebar,backgroundview,title_height,slider,showTitle,showTextHeight,showTextBelowTitle;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // set up a window
    int appheight = [[NSScreen mainScreen] frame].size.height;
    NSRect frame = NSMakeRect(500, 500, 500, 500);
    NSUInteger masks = NSWindowStyleMaskTitled | NSWindowStyleMaskClosable |NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable |NSWindowStyleMaskBorderless;
    window = [[NSWindow alloc] initWithContentRect:frame styleMask:masks backing:NSBackingStoreBuffered defer:NO];
    [window makeKeyAndOrderFront:NSApp];
    [window setTitlebarAppearsTransparent:NO];
    [window setMaxSize:NSMakeSize(420, appheight)];
    [window setMinSize:NSMakeSize(420, appheight/2)];
    [window.contentView setCanDrawConcurrently:YES];
    window.backgroundColor = [NSColor colorWithCalibratedRed:(255/255.0f) green:(255/255.0f) blue:(255/255.0f) alpha:1.0f];

    // add a newview (fake toolbar view) on NStitlebarview
    [[[window standardWindowButton:NSWindowCloseButton] superview] addSubview:titlebar];
    // addTitlebarAccessoryViewController
    NSView *view = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 20, 16)];//16
    NSTitlebarAccessoryViewController *dummyTitlebarAccessoryViewController = [NSTitlebarAccessoryViewController new];
    dummyTitlebarAccessoryViewController.view = view;
    dummyTitlebarAccessoryViewController.fullScreenMinHeight = 38;
    [window addTitlebarAccessoryViewController:dummyTitlebarAccessoryViewController];
    // set up traffic light
    [self adjust_traffic_light];
    
    backgroundview = [[NSVisualEffectView alloc] initWithFrame:window.contentView.frame];
    [window.contentView addSubview:backgroundview];
    
    // slider
    slider = [[NSSlider alloc] initWithFrame:NSMakeRect(170, 20, 160, 20)];
    [window.contentView addSubview:slider];
    [slider setMinValue:10];
    [slider setMaxValue:70];
    [slider setFloatValue:20];//font size
    [slider setAction:@selector(change_fontSize)];
    

    // show title
    showTitle = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 150-20, 500, 350)];
    [showTitle setWantsLayer:YES];
    [showTitle setDrawsBackground:NO];
    [showTitle setFont:[NSFont fontWithName:@"STHeiti" size:20]];
    [showTitle setBackgroundColor:[NSColor clearColor]];
    [showTitle setEditable:NO];
    [showTitle setBordered:NO];
    [showTitle setStringValue:@"知事少时烦恼少,识人多处是非多"];

    // show text below title
    showTextBelowTitle = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 400-title_height, 500, 50)];
    [showTextBelowTitle setWantsLayer:YES];
    [showTextBelowTitle setDrawsBackground:NO];
    [showTextBelowTitle setFont:[NSFont fontWithName:@"STHeiti" size:20]];
    [showTextBelowTitle setBackgroundColor:[NSColor clearColor]];
    [showTextBelowTitle setEditable:NO];
    [showTextBelowTitle setBordered:NO];
    [showTextBelowTitle setStringValue:@"秋至满山多秀色,春来无处不花香 \n- 增广贤文"];
    
    // show height
    showTextHeight = [[NSTextField alloc] initWithFrame:NSMakeRect(140, 60, 300, 40)];
    [showTextHeight setWantsLayer:YES];
    [showTextHeight setDrawsBackground:NO];
    [showTextHeight setFont:[NSFont fontWithName:@"STHeiti" size:30]];
    [showTextHeight setEditable:NO];
    [showTextHeight setBordered:NO];
    [showTextHeight setStringValue:@"Text Height: "];
    
    [window.contentView addSubview:showTitle];
    [window.contentView addSubview:showTextBelowTitle];
    [window.contentView addSubview:showTextHeight];
}



-(void) change_fontSize{
    [showTitle setFont:[NSFont fontWithName:@"STHeiti" size:slider.floatValue]];
    title_height = [((NSTextFieldCell *)[showTitle cell]) cellSizeForBounds:NSMakeRect(0, 0, 500, FLT_MAX)].height;
    [showTextHeight setStringValue:[@"Text Height: " stringByAppendingString:[[NSNumber numberWithFloat:title_height] stringValue]]];
    [showTextBelowTitle setFrame:NSMakeRect(0, 400-title_height, 500, 50)];
}










- (void) adjust_traffic_light{
    NSView * themeframeview =[window.contentView superview];
    NSArray * get_containerview = themeframeview.subviews;
    if ([[get_containerview objectAtIndex:0] subviews].count>0){
        NSArray * get_scrollerview = [[get_containerview objectAtIndex:0] subviews];
        NSScrollView* myscrollview =  [get_scrollerview objectAtIndex:1];
        [myscrollview setFrame:window.contentView.frame];
    }
    NSView * titleBarContainerView = [get_containerview objectAtIndex:1];
    NSArray * get_titlebarview = titleBarContainerView.subviews;
    titleBarView = [get_titlebarview objectAtIndex:get_titlebarview.count-1];
    NSArray * get_elements = titleBarView.subviews;
    [[get_elements objectAtIndex:0] setFrame:NSMakeRect(12, 11, 14, 16)];
    [[get_elements objectAtIndex:1] setFrame:NSMakeRect(32, 11, 14, 16)];
    [[get_elements objectAtIndex:2] setFrame:NSMakeRect(52, 11, 14, 16)];
}


@end

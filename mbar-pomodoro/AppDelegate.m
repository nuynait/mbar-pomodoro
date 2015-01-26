//
//  AppDelegate.m
//  mbar-pomodoro
//
//  Created by Rui Zhao on 2015-01-26.
//  Copyright (c) 2015 Rui Zhao. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    
    timeRemaining = 25;
    [statusItem setTitle:[NSString stringWithFormat:@"%ld", timeRemaining]];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:60.0f target:self selector:@selector(updateTitle) userInfo:nil repeats:YES];
}

- (void)updateTitle {
    timeRemaining--;
    [statusItem setTitle:[NSString stringWithFormat:@"%ld", timeRemaining]];
    if (timeRemaining == 0) {
        [timer invalidate];
    }
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end

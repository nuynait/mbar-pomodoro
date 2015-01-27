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

static NSString * startText = @"Start Pomodoro";
static NSString * stayFocus = @"STAY FOCUS!!!!";

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [statusItem setAction:@selector(startPomodoro)];
    [statusItem setTarget:self];
    [self resetPomodoro];
}

- (void)sendSessionCompletedNotification {
    NSUserNotification* notification = [[NSUserNotification alloc] init];
    [notification setTitle:@"Pomodoro session completed"];
    [notification setSubtitle:@"Good Job, you can have a rest now"];
    [notification setSoundName:NSUserNotificationDefaultSoundName];
    [[NSUserNotificationCenter defaultUserNotificationCenter] deliverNotification:notification];
}

- (void)resetPomodoro {
    [statusItem setTitle:startText];
}

- (void)startPomodoro {
    if ([[statusItem title] isEqualToString:startText]) {
        timeRemaining = 25;
        [statusItem setTitle:[NSString stringWithFormat:@"| %ldm remaining |", timeRemaining]];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:60.0f target:self selector:@selector(updateTitle) userInfo:nil repeats:YES];
    } else {
        [statusItem setTitle:stayFocus];
    }
}

- (void)updateTitle {
    timeRemaining--;
    [statusItem setTitle:[NSString stringWithFormat:@"| %ldm remaining |", timeRemaining]];
    if (timeRemaining == 0) {
        [timer invalidate];
        [self sendSessionCompletedNotification];
        [self resetPomodoro];
    }
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end

//
//  mbar_pomodoroTests.m
//  mbar-pomodoroTests
//
//  Created by Rui Zhao on 2015-01-26.
//  Copyright (c) 2015 Rui Zhao. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>

@interface mbar_pomodoroTests : XCTestCase

@end

@implementation mbar_pomodoroTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

//
//  TranslationFacadeTest.m
//  CrossTranslator
//
//  Created by Andi Palo on 27/09/15.
//  Copyright © 2015 Andi Palo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TranslatorFacade.h"

@interface TranslationFacadeTest : XCTestCase

@end

@implementation TranslationFacadeTest

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    TranslatorFacade *tf = [[TranslatorFacade alloc] init];
    XCTestExpectation *translateExpectation = [self expectationWithDescription:@"Facade did translate"];
    [tf translatePhrase:@"begin"
                   from:@"en"
                     to:@"it"
           completition:^(NSError *error, Translation *translation){
               
               XCTAssertNil(error,@"No error should have happened");
               XCTAssertNotNil(translation.result,@"Empty response");
               XCTAssertTrue([[NSThread currentThread] isMainThread], @"callback should be called on Main Thread");
               [translateExpectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:3.0 handler:^(NSError *error) {
        if(error)
        {
            XCTFail(@"Expectation Failed with error: %@", error);
        }
    }];
}

@end

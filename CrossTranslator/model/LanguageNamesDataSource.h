//
//  LanguageNamesDataSource.h
//  CrossTranslator
//
//  Created by Andi Palo on 19/09/15.
//  Copyright © 2015 Andi Palo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLPAutoCompleteTextFieldDataSource.h"

@interface LanguageNamesDataSource : NSObject <MLPAutoCompleteTextFieldDataSource>

- (id) initWithUILanguage:(NSNumber*) uiLanguage;

- (NSString*) getLangNameForCode:(NSString*)code;

- (NSString*) getLangNameForCode:(NSString*)code inLanguage:(NSString*)inLanguage;

- (void) changeLanguage:(NSNumber*) uiLanguage;

@end
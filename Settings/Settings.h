//
//  Settings.h
//  Settings
//
//  Created by Loris D'antonio on 30/05/14.
//
//

#import <Foundation/Foundation.h>

@interface Settings : NSObject

+ (void) registerDefaultsFromSettingsBundle;

+ (void) loadDefaultSettings:(NSDictionary *)dict;

+ (void) saveSettingString:(NSString *)value forKey:(NSString *)option;

+ (void) saveSettingBool:(bool)boolean forKey:(NSString *)option;

+ (NSString *)getSettingString:(NSString *)option;

+ (BOOL)getSettingBool:(NSString *)option;

@end

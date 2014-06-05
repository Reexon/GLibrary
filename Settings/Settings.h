//
//  Settings.h
//  Settings
//
//  Created by Loris D'antonio on 30/05/14.
//
//

#import <Foundation/Foundation.h>

@interface Settings : NSObject

#pragma mark - Caricamento Settings Default

+ (void) registerDefaultsFromSettingsBundle;

+ (void) loadDefaultSettingsFromDict:(NSDictionary *)dict;

#pragma mark - Salvataggio Settings

+ (void) saveSettingString:(NSString *)value forKey:(NSString *)option;

+ (void) saveSettingBool:(bool)boolean forKey:(NSString *)option;

#pragma mark - Lettura Settings

+ (NSString *) getSettingString:(NSString *)option;

+ (BOOL) getSettingBool:(NSString *)option;

@end

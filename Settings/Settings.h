//
//  Settings.h
//  Settings
//
//  Created by Loris D'antonio on 30/05/14.
//
//

#import <Foundation/Foundation.h>

@interface Settings : NSObject

/*!
 Registra i setting nei NSUserDefault prelevandoli dal Setting.bundle
 */
+ (void) registerDefaultsFromSettingsBundle;

/*!
 Registra i setting nei NSUserDefault dal dizionario passato come parametro
 */
+ (void) loadDefaultSettings:(NSDictionary *)dict;

/*!
 Aggiorna un setting di tipo stringa
 */
+ (void) saveSettingString:(NSString *)value forKey:(NSString *)option;

/*!
 Aggiorna un setting di tipo BOOL
 */
+ (void) saveSettingBool:(bool)boolean forKey:(NSString *)option;

/*!
 Preleva un setting di tipo String
 */
+ (NSString *)getSettingString:(NSString *)option;

/*!
 Preleva un setting di tipo BOOL
 */
+ (BOOL)getSettingBool:(NSString *)option;

@end

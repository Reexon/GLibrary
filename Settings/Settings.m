//
//  Settings.m
//  Settings
//
//  Created by Loris D'antonio on 30/05/14.
//
//

#import "Settings.h"

@implementation Settings
/**
 @author Loris D'antonio
 
 @discussion quando si crea un Settings.bundle se si mette il "Default" su alcune opzioni, 
 in realtà non vengono registrati al primo avvio dell'app, questo problema si verifica per opzioni di tipo (NSNumber e altri).
 Con questo metodo , ci assicuriamo che qualsiasi valore di default venga scritto sull'NSUserDefault.
 
 @see http://ijure.org/wp/archives/179
 
 @updated 30.05.2014
 */
+ (void)registerDefaultsFromSettingsBundle
{
    NSLog(@"Registro valori di defualt dal Settings.bundle");
    
    //prendo riferimento ai userDefault
    NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
    
    NSString *settingsBundle = [[NSBundle mainBundle] pathForResource:@"Settings" ofType:@"bundle"];
    
    if(!settingsBundle)
    {
        NSLog(@"Non trovo Settings.bundle");
        return;
    }
    
    //carico il plist in un dizionario
    NSDictionary *settings = [NSDictionary dictionaryWithContentsOfFile:[settingsBundle stringByAppendingPathComponent:@"Root.plist"]];
    
    //del dizionario prendo l'array presente nel PreferenceSpecifiers (non Modificare, è uno standard)
    NSArray *preferences = [settings objectForKey:@"PreferenceSpecifiers"];
    
    //il mio dizionario "dei default",lo creo in base alla dimensione delle opzioni presenti in preferences
    NSMutableDictionary *defaultsToRegister = [[NSMutableDictionary alloc] initWithCapacity:[preferences count]];
    
    //ogni opzione in preferences è un dizionario perchè contiene piu informaizoni; valore,chiave,titolo,tipo(checkbox,ecc)
    for (NSDictionary *prefSpecification in preferences){
        
        //controllo se ha una chiave con nome "Key"
        NSString *key = [prefSpecification objectForKey:@"Key"];
        
        if (key)//se lo ha allora è un setting "importante"
        {
            // controllo se posso leggerlo dai NSUserDefault
            id currentObject = [defs objectForKey:key];
            
            /*
             se è nil vuol dire che non riesce a leggerlo (e che quindi potrebbe significare che questo è il primo avvio dell'app).
             */
            if (currentObject == nil){
                // non leggibile: imposta il valore dal Settings.Bundle
                id objectToSet = [prefSpecification objectForKey:@"DefaultValue"];
                [defaultsToRegister setObject:objectToSet forKey:key];
                NSLog(@"Setting object %@ for key %@", objectToSet, key);
            }
            else{
                // è leggibile: non tocco niente
                NSLog(@"Key %@ is readable (value: %@), nothing written to defaults.", key, currentObject);
            }
        }
    }
    
    [defs registerDefaults:defaultsToRegister];
    [defs synchronize];
}

/**
 @author Loris D'antonio
 
 @abstract il register default , viene utilizzato per salvare le impostazioni di default (da utilizzare solo al primo avvio).
 dato che NON sovrascrive le impostazioni gia salvate, puoò essere chiamato + volte nell'app senza alterare i settaggi.
 
 */

+ (void) loadDefaultSettings:(NSDictionary *)dict{
    
    NSDictionary *appDefaultsOption = [NSDictionary dictionaryWithObjects:[dict allValues] forKeys:[dict allKeys]];
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:appDefaultsOption];
    
}

/**
 @author Loris D'antonio
 
 @abstract semplice salvataggio di impostazioni per opzioni di tipo stringa
 
 @param NSString value
 valore dell'opzione
 
 @param NSString option
 nome dell'opzione da salvare
 */
+ (void)saveSettingString:(NSString *)value forKey:(NSString *)option{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //creo un'option e imposto un valore
    [defaults setValue:value forKey:option];
    
    //effettivo salvataggio delle impostazioni
    [defaults synchronize];
    
}

/**
 @author Loris D'antonio
 
 @abstract semplice salvataggio di impostazioni per opzioni di tipo booleano
 
 @param BOOL value
 valore dell'opzione
 
 @param NSString option
 nome dell'opzione da salvare
 */
+ (void)saveSettingBool:(bool)boolean forKey:(NSString *)option{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:boolean forKey:option];
    [defaults synchronize];
    
}

/**
 @author Loris D'antonio
 
 @abstract prelevo il valore string per l'impostazione richiesta.
 
 @param NSString option
 nome dell'opzione richiesta
 
 @return NSString
 valore dell'impostazione richiesta
 */
+ (NSString *)getSettingString:(NSString *)option{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults valueForKey:option];
}

/**
 @author Loris D'antonio
 
 @abstract prelevo valore bool per l'impostazione richiesta.
 
 @param NSString option
 nome dell'opzione richiesta
 
 @return BOOL
 valore dell'impostazione richiesta
 */
+ (BOOL)getSettingBool:(NSString *)option{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:option];
}
@end

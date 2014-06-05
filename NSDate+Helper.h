//
//  NSDate+Manage.h
//  GLibrary
//
//  Created by Loris D'antonio on 05/06/14.
//
//

#import <Foundation/Foundation.h>

@interface NSDate (Helper)

/**
 @abstract controlla se l'oggetto che evoca il metodo è compreso tra le date passate come parametro
 
 @return
 TRUE - se startDate <= oggetto <= endDate
 
 FALSE - (oggetto < startDate) o (oggetto > endDate)
 */
- (BOOL) isBetweenDate:(NSDate *)startDate andDate:(NSDate *)endDate;

/**
 @abstract controlla se la data dell'oggetto che evoca il metodo è + recente
 della data passata come parametro
 
 @return
 TRUE
    attuale oggetto è + recente della data come parametro
 FALSE
    attuale oggetto è + vecchio o uguale alla data come parametro
 */
- (BOOL) isMoreActualThen:(NSDate *)date;


/**
 @abstract restituisce le differenze tra l'oggetto NSDate che richiama il metodo, e quello passato per parametro
 */
#pragma mark - Differenze tra Date
- (int) daysDifferenceToDate:(NSDate *)date;
- (int) hoursDifferenceToDate:(NSDate *)date;
- (int) minutesDifferenceToDate:(NSDate *)date;
- (int) secondsDifferenceToDate:(NSDate *)date;

/**
 @abstract aggiunge all'oggetto attuale la data
 
 @note non potendo modificare l'oggetto attuale, viene restituita la data risultante dall'operazione
 se si vuole sottrarre un mese, giorno o anno, basta passare come parametro un negativo (-20, -1 ,-50)
 */
#pragma mark - Operazioni con le date
- (NSDate *)addDay:(int)day;
- (NSDate *)addMonth:(int)month;
- (NSDate *)addYear:(int)year;

/**
 @abstract preleva i dati dell'oggetto attuale
 
 @return restituisce l'informazione richiesta dell'oggetto che evoca il metodo
 */
#pragma mark - Informazioni Oggetto NSDate Attuale
- (NSUInteger)year;
- (NSUInteger)month;
- (NSUInteger)day ;
- (NSUInteger)hour ;
- (NSUInteger)minute;
- (NSUInteger)weekday;
@end

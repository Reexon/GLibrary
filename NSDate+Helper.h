//
//  NSDate+Manage.h
//  GLibrary
//
//  Created by Loris D'antonio on 05/06/14.
//
//

#import <Foundation/Foundation.h>

@interface NSDate (Helper)

/*
 TRUE 
 se startDate <= oggetto <= endDate
 
 FALSE
 oggetto < startDate
 oggetto > endDate
 */
- (BOOL) isBetweenDate:(NSDate *)startDate andDate:(NSDate *)endDate;

/*
 TRUE
    se la data dell'attuale oggetto è + recente della data come parametro
 FALSE
    se la data dell'attuale oggetto è + vecchia o uguale alla data come parametro
 */
- (BOOL) isMoreActualThen:(NSDate *)date;
/*
 restituisce i giorni di differenza tra l'oggetto NSDate che richiama il metodo e quello passato per parametro
 */
- (int) daysDifferenceToDate:(NSDate *)pDate;

/*
 restituisce le ore di differenza tra l'oggetto NSDate che richiama il metodo e quello passato per parametro
 */
- (int) hoursDifferenceToDate:(NSDate *)pDate;

/*
 restituisce i minuti di differenza tra l'oggetto NSDate che richiama il metodo e quello passato per parametro
 */
- (int) minutesDifferenceToDate:(NSDate *)pDate;

/*
 restituisce i secondi di differenza tra l'oggetto NSDate che richiama il metodo e quello passato per parametro
 */
- (int) secondsDifferenceToDate:(NSDate *)pDate;

/*
 aggiunge all'oggetto attuale la data
 NOTA: non potendo modificare l'oggetto attuale, viene restituita la data risultante dall'operazione
 se si vuole sottrarre un mese, giorno o anno, basta passare come parametro un negativo (-20, -1 ,-50)
 */
- (NSDate *)addDay:(int)day;
- (NSDate *)addMonth:(int)month;
- (NSDate *)addYear:(int)year;

/*
 preleva i dati dell'oggetto attuale
 */
- (NSUInteger)year;
- (NSUInteger)month;
- (NSUInteger)day ;

- (NSUInteger)hour ;
- (NSUInteger)minute;
- (NSUInteger)weekday;
@end

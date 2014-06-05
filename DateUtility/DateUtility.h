//
//  DateUtility.h
//  DateUtility
//
//  Created by Marco Velluto on 05/06/14.
//
//

#import <Foundation/Foundation.h>

@interface DateUtility : NSObject

/**
 @author Marco Velluto.
 
 @brief Restituisce un array di date di inizio ciclo per l'anno corrente.
 
 @discussion Una volta passato i giorni, e la data, il metodo restituisce un array di date
 fino alla fine dell'anno corrente. Le date sono calcolate contando dalla data passata come
 parametro fino alla fine dei giorni.
 
 @param date Data dalla quale partire il conteggio.
 @param days Numero di giorni tra un ciclo e l'altro.
 
 @return array di date di inizio metruazione, di tutti i mesi.
 */
+ (NSMutableArray *)datesToYearFromCurrentDate:(NSDate *)date days:(int)days;

/**
 @author Marco Velluto.
 
 @brief Restituisce un array di date di inizio mestruazione per l'anno corrente.
 
 @param date Data dalla quale partire il conteggio.
 @param days  Numero di giorni tra una mestruazione e l'altra.
 @param numberYear  [1 .... n] 1 - anno in corso. Per quanti anni si vogliono calcolare le date.
 
 @return array di date di inizio metruazione, di tutti i mesi.
 */
+ (NSMutableArray *)datesToYearFromCurrentDate:(NSDate *)date days:(int)days withYears:(int)numberYear;

/**
 @author Marco Velluto.
 
 @brief Calcola la data di inizio del ciclo.
 
 @discussion la data viene calcolata partendo dalla data passata (oldData), sommando i giorni(dayToAdd).
 In più si deve specificare per quale mese in avanti si vuole la data.
 
 @param oldDate Data dell'ultima mestruazione.
 @param daysToAdd Durata periodo senza ciclo (28).
 @param Month [1 .... n] 1 -> Mese attuale. Numero dei mesi del quale si vuole sapere il ciclo
 (es. Siamo a maggio, se voglio sapere quello di agosto, inserirò 3).
 
 @return newDate Data inizo ciclo.
 */
+ (NSDate *)dateCicloWithPreviusData:(NSDate *)oldDate andDaysToAdd:(int)daysToAdd andMonth:(int)month;

/**
 @author Marco Velluto.
 
 @param date Data da analizzare
 @return NSDateComponets DataComponents relativo alla data.
 */
+ (NSDateComponents *)componentsFromDate:(NSDate *)date;

/**
 @author Marco Velluto.
 
 @param date data da analizare
 @return restituisce il numero del gioro relativo alla data passata.
 */
+ (NSInteger)dayFromDate:(NSDate *)date;

/**
 @author Marco Velluto.
 
 @param date data da analizare
 @return restituisce il numero del gioro relativo alla data passata.
 */
+ (NSInteger)monthFromDate:(NSDate *)date;

/**
 @author Marco Velluto.
 
 @param date data da analizare
 @return restituisce il numero del gioro relativo alla data passata.
 */
+ (NSInteger)yearFromDate:(NSDate *)date;

@end

//
//  DateUtility.m
//  DateUtility
//
//  Created by Marco Velluto on 05/06/14.
//
//

#import "DateUtility.h"

@implementation DateUtility


+ (NSMutableArray *)datesToYearFromCurrentDate:(NSDate *)date days:(int)days {
    return [DateUtility datesToYearFromCurrentDate:date days:days withYears:1];
    
}


+ (NSMutableArray *)datesToYearFromCurrentDate:(NSDate *)date days:(int)days withYears:(int)numberYear {
    
    if (numberYear <= 0)
        numberYear= 1;
    if (days <= 0) {
        days = 1;
    }
    
    //Trovo il mese corrente
    int numberMonth = (int)[DateUtility monthFromDate:date];
    NSMutableArray *dates = [[NSMutableArray alloc] init];
    int monthes = (12 * numberYear) - numberMonth + 2;
    
    for (int i=0; i<monthes; i++) {
        [dates addObject:[DateUtility dateCicloWithPreviusData:date andDaysToAdd:days andMonth:i]];
    }
    return dates;
}


+ (NSDateComponents *)componentsFromDate:(NSDate *)date {
    NSDateComponents *components = [[NSCalendar currentCalendar]
                                    components:NSCalendarUnitDay |
                                    NSCalendarUnitMonth |
                                    NSCalendarUnitYear
                                    fromDate:date];
    return components;
}


+ (NSInteger)dayFromDate:(NSDate *)date {
    
    NSDateComponents *componets = [DateUtility componentsFromDate:date];
    NSInteger day = [componets day];
    return day;
}

+ (NSInteger)monthFromDate:(NSDate *)date {
    
    NSDateComponents *componets = [DateUtility componentsFromDate:date];
    NSInteger month = [componets month];
    return month;
}


+ (NSInteger)yearFromDate:(NSDate *)date {
    
    NSDateComponents *componets = [DateUtility componentsFromDate:date];
    NSInteger year = [componets year];
    return year;
}


+ (NSDate *)dateCicloWithPreviusData:(NSDate *)oldDate andDaysToAdd:(int)daysToAdd andMonth:(int)month{
    
    NSDate *now = oldDate;
    int days = daysToAdd * month;
    NSDate *newDate = [now dateByAddingTimeInterval:60*60*24* days];
    NSLog(@"%@", [newDate description]);
    
    return newDate;
}

@end

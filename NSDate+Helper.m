//
//  NSDate+Manage.m
//  GLibrary
//
//  Created by Loris D'antonio on 05/06/14.
//
//

#import "NSDate+Helper.h"

enum {
    DaysDifference = 0,
    HoursDifference ,
    MinutesDifference,
    SecondsDifference
};

@implementation NSDate (Manage)

- (BOOL)isBetweenDate:(NSDate *)startDate andDate:(NSDate *)endDate{
    
    //se self < startDate
    if ([self compare:startDate] == NSOrderedAscending)
        return NO;
    
    //self > endDate
    if ([self compare:endDate] == NSOrderedDescending)
        return NO;
    
    return YES;
}

- (BOOL) isMoreActualThen:(NSDate *)date{
    //self è + recente di date
    if ([self compare:date] == NSOrderedDescending)
        return YES;
    return NO;
}

- (int) daysDifferenceToDate:(NSDate *)pDate{
    return [self differenceBetweenDate:pDate type:DaysDifference];
}

-(int) hoursDifferenceToDate:(NSDate *)pDate{
    return [self differenceBetweenDate:pDate type:HoursDifference];
}

-(int) minutesDifferenceToDate:(NSDate *)pDate{
    return [self differenceBetweenDate:pDate type:MinutesDifference];
}

-(int) secondsDifferenceToDate:(NSDate *)pDate{
    return [self differenceBetweenDate:pDate type:SecondsDifference];
}

- (int)differenceBetweenDate:(NSDate *)pDate type:(int)typeDiff{
    
    NSTimeInterval secondsBetween = [pDate timeIntervalSinceDate:self];
    
    int difference=0;
    
    switch (typeDiff) {
        case DaysDifference:
            difference = secondsBetween / (60*60*24); //secondi in 24h 86400
            break;
        case HoursDifference:
            difference = secondsBetween / (60*60); //secondi in 1h 3600
            break;
        case MinutesDifference:
            difference = secondsBetween / 60; //secondi in 1m 60
            break;
        case SecondsDifference:
            difference = secondsBetween;
            break;
    }
    
    return difference;

}

- (NSUInteger)year {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *weekdayComponents = [calendar components:(NSYearCalendarUnit) fromDate:self];
	return [weekdayComponents year];
}
- (NSUInteger)month {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *weekdayComponents = [calendar components:(NSYearCalendarUnit) fromDate:self];
	return [weekdayComponents month];
}
- (NSUInteger)day {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *weekdayComponents = [calendar components:(NSYearCalendarUnit) fromDate:self];
	return [weekdayComponents day];
}

- (NSUInteger)hour {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *weekdayComponents = [calendar components:(NSHourCalendarUnit) fromDate:self];
	return [weekdayComponents hour];
}

- (NSUInteger)minute {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *weekdayComponents = [calendar components:(NSMinuteCalendarUnit) fromDate:self];
	return [weekdayComponents minute];
}

- (NSUInteger)weekday {
    NSDateComponents *weekdayComponents = [[NSCalendar currentCalendar] components:(NSWeekdayCalendarUnit) fromDate:self];
	return [weekdayComponents weekday];
}
- (NSDate *)addDay:(int)day{
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setDay:day];
    return [[NSCalendar currentCalendar] dateByAddingComponents:comps toDate:self  options:0];
}
- (NSDate *)addMonth:(int)month{
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setMonth:month];
    return [[NSCalendar currentCalendar] dateByAddingComponents:comps toDate:self  options:0];
}
- (NSDate *)addYear:(int)year{
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setYear:year];
    return [[NSCalendar currentCalendar] dateByAddingComponents:comps toDate:self  options:0];
}
@end

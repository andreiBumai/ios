//
//  Wrapper.m
//  RSSchool_T2
//
//  Created by Andrei Bumai on 4/27/19.
//  Copyright © 2019 Alexander Shalamov. All rights reserved.
//

#import "Wrapper.h"
@interface Wrapper ()
    @property (nonatomic, assign) NSInteger years;
    @property (nonatomic, assign) NSInteger months;
    @property (nonatomic, assign) NSInteger weeks;
    @property (nonatomic, assign) NSInteger days;
    @property (nonatomic, assign) NSInteger hours;
    @property (nonatomic, assign) NSInteger minutes;
    @property (nonatomic, assign) NSInteger seconds;
@end

@implementation Wrapper

+(instancetype) wrapperMethod: (NSString*) string {
    Wrapper * assimilationInfoObject =  [[[Wrapper alloc] init] autorelease];
    NSDateFormatter * formatterHuman = [[[NSDateFormatter alloc] init] autorelease];
    NSDateFormatter * formatterBorg = [[[NSDateFormatter alloc] init] autorelease];
    formatterHuman.dateFormat = @"dd MMMM yyyy HH:mm:ss";
    formatterBorg.dateFormat =@"yyyy:MM:dd@ss\\mm/HH";
    NSString *stringAssimilation = @"14 August 2208 03:13:37";
    NSDate *dateAssimilationHuman = [formatterHuman dateFromString:stringAssimilation];
    NSDate *dateBorg = [formatterBorg dateFromString:string];
    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(kCFCalendarUnitYear |
                                                         kCFCalendarUnitMonth |
                                                         kCFCalendarUnitDay |
                                                         kCFCalendarUnitHour |
                                                         kCFCalendarUnitMinute |
                                                         kCFCalendarUnitSecond) fromDate:dateBorg toDate:dateAssimilationHuman options:NSCalendarWrapComponents];
    assimilationInfoObject.years = components.year;
    assimilationInfoObject.months = components.month;
    assimilationInfoObject.days = components.day;
    assimilationInfoObject.hours = components.hour;
    assimilationInfoObject.minutes = components.minute;
    assimilationInfoObject.seconds = components.second;

    return assimilationInfoObject;
}

@end

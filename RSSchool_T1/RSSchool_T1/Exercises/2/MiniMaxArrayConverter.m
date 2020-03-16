#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    
    int sumOfArrayElements = [MiniMaxArrayConverter sumOfArrayElements:array];
    NSArray *sortedArray = [array sortedArrayUsingSelector:@selector(compare:)];
    int minValueOfSumFourIntegers = sumOfArrayElements - [[sortedArray lastObject] intValue];
    int maxValueOfSumFourIntegers = sumOfArrayElements - [[sortedArray firstObject] intValue];
    
    NSArray *resultArray = @[[NSNumber numberWithInt: minValueOfSumFourIntegers], [NSNumber numberWithInt:maxValueOfSumFourIntegers]];
    NSLog(@"%@", [resultArray componentsJoinedByString:@"  "]);

    return resultArray;
}

+ (int)sumOfArrayElements:(NSArray<NSNumber*>*)array {
    int sum = 0;
    for (NSNumber *q in array) {
        sum += [q intValue];
    }
    return sum;
}

@end

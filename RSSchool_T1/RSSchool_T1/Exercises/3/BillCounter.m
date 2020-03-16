#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
        
    NSMutableArray *billWithCommonFoodItems = [NSMutableArray arrayWithArray:bill];
    [billWithCommonFoodItems removeObjectAtIndex:(int)index];
    int commonBillAmount = [BillCounter sumOfArrayElements:billWithCommonFoodItems];
    
    int annaShouldPay = commonBillAmount/2;
    
    return [sum intValue] == annaShouldPay ? @"Bon Appetit" : [NSString stringWithFormat:@"%d", [sum intValue] - annaShouldPay];
}

+ (int)sumOfArrayElements:(NSArray<NSNumber*>*)array {
    int sum = 0;
    for (NSNumber *q in array) {
        sum += [q intValue];
    }
    return sum;
}

@end

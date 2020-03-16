#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {

    NSMutableArray *arrayOfNumbers = [[[NSMutableArray alloc] init] autorelease];
    
    for (int q = 0 ; q < s.length; q++) {
        char ch = [s characterAtIndex:q];
        int numCh = atoi(&ch);
        [arrayOfNumbers addObject: [NSNumber numberWithInt:numCh]];
    }
    
    int countOfDiffDigits = 0;
    int countOfPairOfDigits = (int)arrayOfNumbers.count / 2;
    NSMutableArray *indicesOfDiffDigits = [[[NSMutableArray alloc] init] autorelease];
    
    int a = countOfPairOfDigits;
    
    for (int q = 1; q <= a; q++) {
        if (arrayOfNumbers[countOfPairOfDigits - 1] != arrayOfNumbers[arrayOfNumbers.count - countOfPairOfDigits]) {
            countOfDiffDigits++;
            [indicesOfDiffDigits addObject: [NSNumber numberWithInt:countOfPairOfDigits - 1]];
        }
        countOfPairOfDigits--;
    }
    
    if (countOfDiffDigits > [k intValue]) {
        return @"-1";
    } else if (countOfDiffDigits == [k intValue]) {
        for (int q = 0; q < [k intValue]; q++) {
            int index = [indicesOfDiffDigits[0] intValue];
            if ([arrayOfNumbers[index] intValue] > [arrayOfNumbers[arrayOfNumbers.count - index - 1] intValue]) {
                [arrayOfNumbers replaceObjectAtIndex:(arrayOfNumbers.count - index - 1) withObject:arrayOfNumbers[index]];
            } else {
                [arrayOfNumbers replaceObjectAtIndex:index withObject:arrayOfNumbers[arrayOfNumbers.count - index - 1]];
            }
            [indicesOfDiffDigits removeObjectAtIndex:0];
        }
    } else {
        int freeSteps = [k intValue] - countOfDiffDigits;    // last freeSteps*2 steps change on 9
        
        for (int q = 0; q < [k intValue] - freeSteps * 2; q++) {
            int index = [[indicesOfDiffDigits objectAtIndex:0] intValue];
            if ([arrayOfNumbers[index] intValue] > [arrayOfNumbers[arrayOfNumbers.count - index - 1] intValue]) {
                [arrayOfNumbers replaceObjectAtIndex:(arrayOfNumbers.count - index - 1) withObject:arrayOfNumbers[index]];
            } else {
                [arrayOfNumbers replaceObjectAtIndex:index withObject:arrayOfNumbers[arrayOfNumbers.count - index - 1]];
            }
            [indicesOfDiffDigits removeObjectAtIndex:0];
        }
        
        for (int q = 0; q < freeSteps; q++) {
            int index = [[indicesOfDiffDigits objectAtIndex:0] intValue];
            [arrayOfNumbers replaceObjectAtIndex:index withObject: @9];
            [arrayOfNumbers replaceObjectAtIndex:(arrayOfNumbers.count - index - 1) withObject: @9];
            [indicesOfDiffDigits removeObjectAtIndex:0];
        }
        
        
    }

    NSMutableString * str = [NSMutableString string];
    for (int q = 0; q < arrayOfNumbers.count; q++) {
        [str appendFormat:@"%d", [arrayOfNumbers[q] intValue]];
    }
    
    return str;
}

@end

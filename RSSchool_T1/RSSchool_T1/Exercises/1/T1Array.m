#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    
    NSMutableArray *happyArray = [NSMutableArray arrayWithArray:sadArray];
    
    if (happyArray.count > 2) {
            for (int q = 1; q < happyArray.count - 1; q++) {
                
            int sum = [happyArray[q - 1] intValue] + [happyArray[q + 1] intValue];
            int element = [happyArray[q] intValue];
            
            if (sum < element) {
                [happyArray removeObjectAtIndex:q];
                q = 0;
            }
        }
    }
    return happyArray;
}

@end

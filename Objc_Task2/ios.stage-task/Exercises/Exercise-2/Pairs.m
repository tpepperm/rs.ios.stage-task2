#import "Pairs.h"
#import <math.h>

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    NSInteger pairs = 0;
    NSInteger i = 0;

    while (i < [array count])
    {
        NSNumber *num = array[i];
        NSInteger j = i + 1;
        while (j < [array count])
        {
            NSNumber *pairNum = array[j];
            if (abs(num.intValue - pairNum.intValue) == number.intValue)
            {
                pairs += 1;
            }
            j += 1;
        }
        i += 1;
    }
    return pairs;
}

@end

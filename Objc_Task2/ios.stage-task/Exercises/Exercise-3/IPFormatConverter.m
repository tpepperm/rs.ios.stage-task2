#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    if ([numbersArray count] == 0)
    {
        return @"";
    }

    NSString *result = [[NSString alloc] init];
    NSInteger i = 0;

    while (i < [numbersArray count] && i < 4)
    {
        if ([numbersArray[i] intValue] > 255) {
            return @"The numbers in the input array can be in the range from 0 to 255.";
        } else if ([numbersArray[i] intValue] < 0) {
            return @"Negative numbers are not valid for input.";
        }

        NSString *number;
        if (i == 0) {
            number = [NSString stringWithFormat:@"%d", [numbersArray[0] intValue]];
        } else {
            number = [NSString stringWithFormat:@".%d", [numbersArray[i] intValue]];
        }
        result = [result stringByAppendingString:number];

        i += 1;
    }

    while (i < 4)
    {
        result = [result stringByAppendingString:@".0"];
        i += 1;
    }

    return result;
}

@end

#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    if (![array isKindOfClass:[NSArray class]] || array == nil || array.count == 0) {
        return @[];
    }

    NSMutableArray *integers = [[NSMutableArray alloc] init];
    NSMutableArray *strings = [[NSMutableArray alloc] init];

    for (NSMutableArray *first in array)
    {
        if (![first isKindOfClass:[NSArray class]]) {
            return @[];
        }
        
        for (int i=0; i<first.count; i++)
        {
            if ([[first objectAtIndex:i] isKindOfClass:[NSNumber class]]) {
                [integers addObject:[first objectAtIndex:i]];
            } else {
                [strings addObject:[first objectAtIndex:i]];
            }
        }
    }

    strings = [strings sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    NSSortDescriptor *ascending = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    [integers sortUsingDescriptors:[NSArray arrayWithObject:ascending]];

    if ([integers count] == 0) {
        return strings;
    } else if ([strings count] == 0) {
        return integers;
    }

    NSSortDescriptor *descendingString = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    strings = [strings sortedArrayUsingDescriptors:@[descendingString]];
    return @[integers, strings];
}

@end

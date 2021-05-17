#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    UInt8 result = 0;
    NSInteger i = 0;

    while (i < 8)
    {
        result <<= 1;
        if ((n & 1) == 1)
            result ^= 1;
        n >>= 1;
        i += 1;
    }

    return result;
}

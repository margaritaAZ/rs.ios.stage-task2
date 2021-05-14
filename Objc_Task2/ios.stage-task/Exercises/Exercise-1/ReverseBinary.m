#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    NSMutableArray<NSNumber*> *binaryNumberArray = [[NSMutableArray alloc] initWithCapacity:8];
    NSInteger dividend = n;
    
    while (dividend >= 2) {
        NSNumber *rest = [NSNumber numberWithInt:(dividend % 2)];
        [binaryNumberArray addObject:rest];
        dividend = dividend / 2;
    }
    [binaryNumberArray addObject:[NSNumber numberWithInteger:dividend]];
    
    while (binaryNumberArray.count < 8) {
        [binaryNumberArray addObject:[NSNumber numberWithInteger:0]];
    }

    NSInteger newN = 0;
    for (int i = 0; i < binaryNumberArray.count; i++) {
        if (binaryNumberArray[i].intValue == 1) {
            newN += pow(2, (binaryNumberArray.count - 1 - i));
        }
    }
    
    return newN;
}

#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    
    if (![array.firstObject isKindOfClass:[NSArray class]]) {
        return @[];
    }
    
        NSMutableArray *arrayOfNum = [[NSMutableArray alloc] init];
        NSMutableArray *arrayOfStrings = [[NSMutableArray alloc] init];
    
        for (NSArray<NSString*> *subArray in array) {
            if ([subArray.firstObject isKindOfClass:[NSString class]]) {
                [arrayOfStrings addObjectsFromArray:subArray];
                continue;
            }
            if ([subArray.firstObject isKindOfClass:[NSNumber class]]) {
                [arrayOfNum addObjectsFromArray:subArray];
                continue;
            }
        }
    
        NSMutableArray<NSArray *> *resultedArray = [[NSMutableArray alloc] init];
        if (arrayOfNum.count != 0 && arrayOfStrings.count != 0) {
            [resultedArray addObject:[arrayOfNum sortedArrayUsingSelector:@selector(compare:)]];
            NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO selector:@selector(caseInsensitiveCompare:)];
            [resultedArray addObject:[arrayOfStrings sortedArrayUsingDescriptors:@[sort]]];
        } else if (arrayOfNum.count == 0 && arrayOfStrings.count != 0) {
            NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES selector:@selector(caseInsensitiveCompare:)];
            [resultedArray addObjectsFromArray:[arrayOfStrings sortedArrayUsingDescriptors:@[sort]]];
        } else if (arrayOfNum.count != 0 && arrayOfStrings.count == 0){
            [resultedArray addObjectsFromArray:[arrayOfNum sortedArrayUsingSelector:@selector(compare:)]];
        } else {
            return @[];
        }
    
    return resultedArray;
}

@end

#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    if (numbersArray.count == 0) {
        return @"";
    }
    
    NSMutableString *ipAddress = [[NSMutableString alloc] init];
    NSMutableArray<NSNumber*> *fullNumbersArray = [[NSMutableArray alloc] initWithArray:numbersArray];
    
    while (fullNumbersArray.count < 4) {
        [fullNumbersArray addObject: [NSNumber numberWithInt:0]];
    }
    for (int i = 0; i < 4; i++) {
        if (fullNumbersArray[i].intValue > 255) {
            return @"The numbers in the input array can be in the range from 0 to 255.";
        }
        if (fullNumbersArray[i].intValue < 0) {
            return @"Negative numbers are not valid for input.";
        }
        [ipAddress appendString:fullNumbersArray[i].stringValue];
        if (i != 3) {
            [ipAddress appendString:@"."];
        }
    }
    return ipAddress;
}

@end

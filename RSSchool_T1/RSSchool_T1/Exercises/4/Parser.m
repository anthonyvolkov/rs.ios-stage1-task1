#import "Parser.h"

typedef NSMutableArray * (^ParserBlock)(NSString *);

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    
    return [NSMutableArray arrayWithArray:parseString(string)];
}

ParserBlock parseString = ^NSMutableArray * (NSString *string) {
    [string retain];
    NSMutableArray *arrayOfStrings = [[NSMutableArray alloc] init];

    int countOpenRoundBrackets = 0;
    int countOpenAngleBrackets = 0;
    int countOpenSquareBrackets = 0;

    NSMutableArray *indicesOpenRoundBrackets = [[NSMutableArray alloc] init];
    NSMutableArray *indicesOpenAngleBrackets = [[NSMutableArray alloc] init];
    NSMutableArray *indicesOpenSquareBrackets = [[NSMutableArray alloc] init];
    
    NSMutableDictionary *indexAndPositionInResultArray = [[NSMutableDictionary alloc] init];

    int position = 0;

    for (int i = 0; i < [string length]; i++) {

        if ([string characterAtIndex:i] == '(') {
            countOpenRoundBrackets++;
            [indicesOpenRoundBrackets addObject: [NSNumber numberWithInt:i]];
            [indexAndPositionInResultArray setObject: [NSNumber numberWithInt:position] forKey:[NSNumber numberWithInt:i]];
            [arrayOfStrings addObject:@""];
            position++;
        } else if ([string characterAtIndex:i] == '<') {
            countOpenAngleBrackets++;
            [indicesOpenAngleBrackets addObject: [NSNumber numberWithInt:i]];
            [indexAndPositionInResultArray setObject: [NSNumber numberWithInt:position] forKey:[NSNumber numberWithInt:i]];
            [arrayOfStrings addObject:@""];
            position++;
        } else if ([string characterAtIndex:i] == '[') {
            countOpenSquareBrackets++;
            [indicesOpenSquareBrackets addObject: [NSNumber numberWithInt:i]];
            [indexAndPositionInResultArray setObject: [NSNumber numberWithInt:position] forKey:[NSNumber numberWithInt:i]];
            [arrayOfStrings addObject:@""];
            position++;
        } else if ([string characterAtIndex:i] == ')') {
            NSRange range = NSMakeRange([[indicesOpenRoundBrackets lastObject] intValue] + 1, i - [[indicesOpenRoundBrackets lastObject] intValue] -1);
            [arrayOfStrings replaceObjectAtIndex:[[indexAndPositionInResultArray objectForKey:indicesOpenRoundBrackets.lastObject] intValue] withObject:[string substringWithRange: range]];
            [indicesOpenRoundBrackets removeLastObject];
        } else if ([string characterAtIndex:i] == '>') {
            NSRange range = NSMakeRange([[indicesOpenAngleBrackets lastObject] intValue] + 1, i - [[indicesOpenAngleBrackets lastObject] intValue] -1);
            [arrayOfStrings replaceObjectAtIndex:[[indexAndPositionInResultArray objectForKey:indicesOpenAngleBrackets.lastObject] intValue] withObject:[string substringWithRange: range]];
            [indicesOpenAngleBrackets removeLastObject];
        } else if ([string characterAtIndex:i] == ']') {
            NSRange range = NSMakeRange([[indicesOpenSquareBrackets lastObject] intValue] + 1, i - [[indicesOpenSquareBrackets lastObject] intValue] -1);
            [arrayOfStrings replaceObjectAtIndex:[[indexAndPositionInResultArray objectForKey:indicesOpenSquareBrackets.lastObject] intValue] withObject:[string substringWithRange: range]];
            [indicesOpenSquareBrackets removeLastObject];
        }
    }
    
    [indicesOpenRoundBrackets release];
    [indicesOpenAngleBrackets release];
    [indicesOpenSquareBrackets release];
    [string release];

    return [arrayOfStrings autorelease];
};

@end

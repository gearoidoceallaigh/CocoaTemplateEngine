//
//  CCTemplate.m
//  CocoaTemplateEngine
//
//  Created by xhan on 8/7/13.
//
//

#import "CCTemplate.h"

@implementation CCTemplate

- (id)init
{
    self = [super init];
    self.head = @"{{";
    self.tail = @"}}";
    return self;
}

- (NSString*)scan:(NSString*)string dict:(NSDictionary*)dict
{
    NSMutableString* buffer = [[NSMutableString alloc] initWithCapacity:string.length*2];
    NSString* scanedStr  = nil;
    
    NSScanner* scanner = [[NSScanner alloc] initWithString:string];
    [scanner setCaseSensitive:YES]; // case sensitive
    [scanner setCharactersToBeSkipped:nil]; //not to ignore any chars
    
    // found head
    while ([scanner scanUpToString:self.head intoString:&scanedStr]) {
        [buffer appendString:scanedStr];
        if( scanner.isAtEnd ) break;
        
        //step over head-flag
        [scanner scanString:self.head intoString:nil];
        
        //scan the key-iVar
        scanedStr = nil;
        [scanner scanUpToString:self.tail intoString:&scanedStr];
        
        //step over tail-flag , and check if key-iVar exists
        BOOL tailExist = [scanner scanString:self.tail intoString:nil];
        
        
        if (tailExist ) {
            // trim writespace and newline(if possible)
            NSString* key = [scanedStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            // TODO: should warning key value not exists
            id value = dict[key] ?: @"";
            [buffer appendString:value];
        }else{
            // add head and scanned body back to buffer
            [buffer appendString:self.head];
            if (scanedStr) {
                [buffer appendString:scanedStr];
            }
            
        }
        
    }
    return [NSString stringWithString:buffer];    
}

@end


@implementation NSString (CCTemplate)

- (NSString*)scan:(NSString*)string dict:(NSDictionary*)dict
{
    return [[[CCTemplate alloc] init] scan:string dict:dict];
}

@end
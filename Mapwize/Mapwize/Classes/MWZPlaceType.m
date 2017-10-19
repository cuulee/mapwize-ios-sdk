#import "MWZPlaceType.h"

@implementation MWZPlaceType

- (instancetype)initFromDictionary:(NSDictionary*) dic {
    self = [super init];
    if (![[dic objectForKey:@"_id"] isEqual:NSNull.null]) {
        _identifier = [dic objectForKey:@"_id"];
    }
    if (![[dic objectForKey:@"name"] isEqual:NSNull.null]) {
        _name = [dic objectForKey:@"name"];
    }
    if (![[dic objectForKey:@"style"] isEqual:NSNull.null]) {
        _style = [dic objectForKey:@"style"];
    }
    return self;
}

- (NSDictionary*) toDictionary {
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
    @try {
        if (_identifier) {
            [dic setObject:_identifier forKey:@"id"];
        }
        if (_name) {
            [dic setObject:_name forKey:@"name"];
        }
        if (_style) {
            [dic setObject:[_style toDictionary] forKey:@"style"];
        }
    }
    @catch (NSException* e) {
        @throw e;
    }
    @finally {
        return dic;
    }
}

@end

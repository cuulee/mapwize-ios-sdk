#import "MWZUniverse.h"

@implementation MWZUniverse

- (instancetype)initFromDictionary:(NSDictionary*)dic {
    self = [super init];
    if (![[dic objectForKey:@"_id"] isEqual:NSNull.null]) {
        _identifier = [dic objectForKey:@"_id"];
    }
    if (![[dic objectForKey:@"name"] isEqual:NSNull.null]) {
        _name = [dic objectForKey:@"name"];
    }
    if (![[dic objectForKey:@"alias"] isEqual:NSNull.null]) {
        _alias = [dic objectForKey:@"alias"];
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat: @"MWZUniverse: Identifier=%@ Name=%@ Alias=%@", _identifier, _name, _alias];
}


@end

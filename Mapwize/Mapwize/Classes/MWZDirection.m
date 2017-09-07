#import "MWZDirection.h"
#import "MWZParser.h"

@implementation MWZDirection

- (instancetype)initFromDictionary:(NSDictionary*)dic {
    self = [super init];
    
    if (![[dic objectForKey:@"from"] isEqual:NSNull.null]) {
        _from = [[MWZDirectionResponsePoint alloc] initFromDictionary:[dic objectForKey:@"from"]];
    }
    if (![[dic objectForKey:@"to"] isEqual:NSNull.null]) {
        _to = [[MWZDirectionResponsePoint alloc] initFromDictionary:[dic objectForKey:@"to"]];
    }
    if (![[dic objectForKey:@"distance"] isEqual:NSNull.null]) {
        _distance =  [[dic objectForKey:@"distance"] doubleValue];
    }
    if (![[dic objectForKey:@"traveltime"] isEqual:NSNull.null]) {
        _traveltime =  [[dic objectForKey:@"traveltime"] doubleValue];
    }
    if (![[dic objectForKey:@"bounds"] isEqual:NSNull.null]) {
        _bounds = [[MWZBounds alloc] initWithArray:[dic objectForKey:@"bounds"]];
    }
    if (![[dic objectForKey:@"waypoints"] isEqual:NSNull.null]) {
        _waypoints = [MWZParser positionsFromArray:[dic objectForKey:@"waypoints"]];
    }
    if (![[dic objectForKey:@"route"] isEqual:NSNull.null]) {
        _route = [MWZParser routesFromArray:[dic objectForKey:@"route"]];
    }
    if (![[dic objectForKey:@"subdirections"] isEqual:NSNull.null]) {
        _subdirections = [MWZParser subdirectionsFromArray:[dic objectForKey:@"subdirections"]];
    }
    return self;
}

- (NSDictionary*) toDictionary {
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
    
    [dic setObject:[NSNumber numberWithDouble:_distance] forKey:@"distance"];
    [dic setObject:[NSNumber numberWithDouble:_traveltime] forKey:@"traveltime"];
    if (_from != nil) {
        [dic setObject:[_from toDictionary] forKey:@"from"];
    }
    if (_to != nil) {
        [dic setObject:[_to toDictionary] forKey:@"to"];
    }
    if (_bounds != nil) {
        [dic setObject:[_bounds toArray] forKey:@"bounds"];
    }
    if (_route != nil) {
        NSMutableArray* a = [[NSMutableArray alloc] init];
        for (MWZRoute* p in _route) {
            NSDictionary* d = [p toDictionary];
            [a addObject:d];
        }
        [dic setObject:a forKey:@"route"];
    }
    if (_waypoints != nil) {
        NSMutableArray* a = [[NSMutableArray alloc] init];
        for (MWZDirectionResponsePoint* p in _waypoints) {
            NSDictionary* d = [p toDictionary];
            [a addObject:d];
        }
        [dic setObject:a forKey:@"waypoints"];
    }
    if (_subdirections != nil) {
        NSMutableArray* a = [[NSMutableArray alloc] init];
        for (MWZDirection* p in _subdirections) {
            NSDictionary* d = [p toDictionary];
            [a addObject:d];
        }
        [dic setObject:a forKey:@"subdirections"];
    }
    
    return dic;
}

- (NSString*) toStringJSON {
    
    NSData *userPositionJSON = [NSJSONSerialization dataWithJSONObject:[self toDictionary] options:(NSJSONWritingOptions) 0 error:nil];
    NSString* userPositionString = [[NSString alloc] initWithData:userPositionJSON encoding:NSUTF8StringEncoding];
    
    return userPositionString;
}

@end

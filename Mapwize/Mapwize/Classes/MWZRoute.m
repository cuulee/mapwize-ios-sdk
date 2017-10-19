#import "MWZRoute.h"

@implementation MWZRoute

- (instancetype)initFromDictionary:(NSDictionary*)dic {
    self = [super init];
    if (![[dic objectForKey:@"floor"] isEqual:NSNull.null]) {
        _floor = [dic objectForKey:@"floor"];
    }
    if (![[dic objectForKey:@"fromFloor"] isEqual:NSNull.null]) {
        _fromFloor = [dic objectForKey:@"fromFloor"];
    }
    if (![[dic objectForKey:@"toFloor"] isEqual:NSNull.null]) {
        _toFloor = [dic objectForKey:@"toFloor"];
    }
    if (![[dic objectForKey:@"isStart"] isEqual:NSNull.null]) {
        _isStart = [[dic objectForKey:@"isStart"] boolValue];
    }
    if (![[dic objectForKey:@"isEnd"] isEqual:NSNull.null]) {
        _isEnd = [[dic objectForKey:@"isEnd"] boolValue];
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
    if (![[dic objectForKey:@"timeToEnd"] isEqual:NSNull.null]) {
        _timeToEnd =  [[dic objectForKey:@"timeToEnd"] doubleValue];
    }
    if (![[dic objectForKey:@"connectorTypeTo"] isEqual:NSNull.null]) {
        _connectorTypeTo = [dic objectForKey:@"connectorTypeTo"];
    }
    if (![[dic objectForKey:@"connectorTypeFrom"] isEqual:NSNull.null]) {
        _connectorTypeFrom = [dic objectForKey:@"connectorTypeFrom"];
    }
    if (![[dic objectForKey:@"path"] isEqual:NSNull.null]) {
        _path = [dic objectForKey:@"path"];
    }
    return self;
}

- (NSDictionary*) toDictionary {
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
    
    @try {
        [dic setObject:[NSNumber numberWithDouble:_distance] forKey:@"distance"];
        [dic setObject:[NSNumber numberWithDouble:_traveltime] forKey:@"traveltime"];
        [dic setObject:[NSNumber numberWithDouble:_timeToEnd] forKey:@"timeToEnd"];
        if (_connectorTypeTo != nil) {
            [dic setObject:_connectorTypeTo forKey:@"connectorTypeTo"];
        }
        if (_connectorTypeFrom != nil) {
            [dic setObject:_connectorTypeFrom forKey:@"connectorTypeFrom"];
        }
        [dic setObject:[NSNumber numberWithBool:_isStart] forKey:@"isStart"];
        [dic setObject:[NSNumber numberWithBool:_isEnd] forKey:@"isEnd"];
        if (_path) {
            [dic setObject:_path forKey:@"path"];
        }
        if (_floor) {
            [dic setObject:_floor forKey:@"floor"];
        }
        if (_toFloor) {
            [dic setObject:_toFloor forKey:@"toFloor"];
        }
        if (_fromFloor) {
            [dic setObject:_fromFloor forKey:@"fromFloor"];
        }
        if (_bounds != nil) {
            [dic setObject:[_bounds toArray] forKey:@"bounds"];
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

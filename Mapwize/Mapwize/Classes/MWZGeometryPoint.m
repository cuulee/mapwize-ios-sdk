#import "MWZGeometryPoint.h"

@implementation MWZGeometryPoint

- (instancetype) init {
    self = [super init];
    _type = @"Point";
    return self;
}
    
- (instancetype) initWithCoordinate:(MWZCoordinate*) coordinate {
    self = [super init];
    _type = @"Point";
    _coordinate = coordinate;
    return self;

}

- (instancetype) initWithDictionary:(NSDictionary*) dictionary {
    self = [super init];
    _type = @"Point";
    if (![dictionary[@"coordinates"] isEqual:NSNull.null]) {
        MWZCoordinate* coordinate = [[MWZCoordinate alloc] initWithArray:dictionary[@"coordinates"]];
        _coordinate = coordinate;
    }
    return self;
}


- (NSString*) getType {
    return _type;
}

- (MWZCoordinate*) getCoordinates {
    return _coordinate;
}

- (MWZBounds*) getBounds {
    return [[MWZBounds alloc] initWithSouthWest:_coordinate northEast:_coordinate];
}

- (NSDictionary*) toDictionary {
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
    [dic setObject:_type forKey:@"type"];
    NSArray* arr = [_coordinate toArray];
    if (arr) {
        [dic setObject:arr forKey:@"coordinates"];
    }
    return dic;
}

- (NSString *)description {
    return [NSString stringWithFormat: @"MWZGeometry Type=%@ Coordinate=%@", _type, _coordinate];
}

@end

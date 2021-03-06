#import "MWZGeometryPolygon.h"

@implementation MWZGeometryPolygon

- (instancetype) init {
    self = [super init];
    _type = @"Polygon";
    return self;
}
    
    
- (instancetype) initWithCoordinates:(NSArray*) coordinates {
    self = [super init];
    _type = @"Polygon";
    _coordinates = coordinates;
    return self;
    
}

- (instancetype) initWithDictionary:(NSDictionary*) dictionary {
    self = [super init];
    _type = @"Polygon";
    NSMutableArray* coordinates = [[NSMutableArray alloc] init];
    NSArray* coords = dictionary[@"coordinates"];
    if (coords && ![coords isEqual:NSNull.null]) {
        NSArray* coordinatesJson = coords[0];
        for (NSArray* coordinateJson in coordinatesJson) {
            MWZCoordinate* coordinate = [[MWZCoordinate alloc] initWithArray:coordinateJson];
            [coordinates addObject:coordinate];
        }
        _coordinates = [NSArray arrayWithArray:coordinates];
    }
    
    return self;
}


- (NSString*) getType {
    return _type;
}

- (NSArray*) getCoordinates {
    return _coordinates;
}

- (MWZBounds*) getBounds {
    double latMin = 400;
    double latMax = -400;
    double lonMin = 400;
    double lonMax = -400;
    for (MWZCoordinate* c in _coordinates) {
        if (c.latitude < latMin) {
            latMin = c.latitude;
        }
        if (c.latitude > latMax) {
            latMax = c.latitude;
        }
        if (c.longitude < lonMin) {
            lonMin = c.longitude;
        }
        if (c.longitude > lonMax) {
            lonMax = c.longitude;
        }
    }
    MWZCoordinate* sw = [[MWZCoordinate alloc] initWithLatitude:latMin longitude:lonMin floor:nil];
    MWZCoordinate* ne = [[MWZCoordinate alloc] initWithLatitude:latMax longitude:lonMax floor:nil];
    return [[MWZBounds alloc] initWithSouthWest:sw northEast:ne];
}

- (NSDictionary*) toDictionary {
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
    @try {
        [dic setObject:_type forKey:@"type"];
        NSMutableArray* coords = [[NSMutableArray alloc] init];
        for (MWZCoordinate* coord in _coordinates) {
            NSArray* arr = [coord toArray];
            if (arr) {
                [coords addObject:arr];
            }
        }
        NSMutableArray* allCoord = [[NSMutableArray alloc] init];
        [allCoord addObject:coords];
        [dic setObject:allCoord forKey:@"coordinates"];
    }
    @catch (NSException* e) {
        @throw e;
    }
    @finally {
        return dic;
    }
}

- (NSString *)description {
    return [NSString stringWithFormat: @"MWZGeometry Type=%@ Coordinates=%@", _type, _coordinates];
}

@end

#import "MWZBounds.h"

@implementation MWZBounds

- (instancetype) initWithSouthWest:(MWZCoordinate*) sw northEast:(MWZCoordinate*) ne {
    self = [super init];
    _southWest = sw;
    _northEast = ne;
    return self;
}

- (instancetype)initWithArray:(NSArray*) array {
    MWZCoordinate* sw = [[MWZCoordinate alloc] initWithLatitude:[array[0] doubleValue] longitude:[array[1] doubleValue] floor:nil];
    MWZCoordinate* ne = [[MWZCoordinate alloc] initWithLatitude:[array[2] doubleValue] longitude:[array[3] doubleValue] floor:nil];
    _northEast = ne;
    _southWest = sw;
    return self;
}

- (CLLocationCoordinate2D) getCenter {
    double latitude = (_southWest.latitude + _northEast.latitude)/2.;
    double longitude = (_southWest.longitude + _northEast.longitude)/2.;
    return CLLocationCoordinate2DMake(latitude, longitude);
}

- (NSDictionary*) toDictionary {
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
    NSDictionary* sw = [_southWest toDictionary];
    NSDictionary* ne = [_northEast toDictionary];
    if (sw && ne) {
        [dic setObject:[_southWest toDictionary] forKey:@"southWest"];
        [dic setObject:[_northEast toDictionary] forKey:@"northEast"];
    }
    return dic;
}

- (NSArray*) toArray {
    NSMutableArray* arr = [[NSMutableArray alloc] init];
    NSArray* sw = [_southWest toLatLongArray];
    NSArray* ne = [_northEast toLatLongArray];
    if (sw && ne) {
        [arr addObject:sw];
        [arr addObject:ne];
    }
    return arr;
}

- (NSString*) description {
    return [NSString stringWithFormat: @"MWZBounds SW=%@ NE=%@", _southWest, _northEast];
}

@end

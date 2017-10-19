#import "MWZDirectionResponsePoint.h"

@implementation MWZDirectionResponsePoint

- (instancetype) initWithPlaceId: (NSString*) placeId {
    self = [super init];
    _placeId = placeId;
    return self;
}

- (instancetype) initWithVenueId: (NSString*) venueId {
    self = [super init];
    _venueId = venueId;
    return self;
}

- (instancetype) initWithPlaceListId: (NSString*) placeListId {
    self = [super init];
    _placeListId = placeListId;
    return self;
}



- (instancetype) initWithLatitude: (NSNumber*) latitude longitude: (NSNumber*) longitude floor:(NSNumber*) floor {
    self = [super init];
    _latitude = latitude;
    _longitude = longitude;
    _floor = floor;
    return self;
}

- (instancetype)initFromDictionary:(NSDictionary*)dic {
    self = [super init];
    if (![[dic objectForKey:@"lat"] isEqual:NSNull.null]) {
        _latitude = [dic objectForKey:@"lat"];
    }
    if (![[dic objectForKey:@"lon"] isEqual:NSNull.null]) {
        _longitude = [dic objectForKey:@"lon"];
    }
    if (![[dic objectForKey:@"floor"] isEqual:NSNull.null]) {
        _floor = [dic objectForKey:@"floor"];
    }
    if (![[dic objectForKey:@"placeId"] isEqual:NSNull.null]) {
        _placeId = [dic objectForKey:@"placeId"];
    }
    if (![[dic objectForKey:@"venueId"] isEqual:NSNull.null]) {
        _venueId = [dic objectForKey:@"venueId"];
    }
    if (![[dic objectForKey:@"placeListId"] isEqual:NSNull.null]) {
        _placeListId =[dic objectForKey:@"placeListId"];
    }
    return self;
}

- (NSDictionary*) toDictionary {
    NSMutableDictionary* positionDic = [[NSMutableDictionary alloc] init];
    @try {
        if (_placeId != nil) {
            [positionDic setObject:[self placeId] forKey:@"placeId"];
        }
        if (_venueId != nil) {
            [positionDic setObject:[self venueId] forKey:@"venueId"];
        }
        if (_placeListId != nil) {
            [positionDic setObject:[self placeListId] forKey:@"placeListId"];
        }
        if (_floor != nil) {
            [positionDic setObject:[self floor] forKey:@"floor"];
        }
        if (_latitude != nil) {
            [positionDic setObject:_latitude forKey:@"lat"];
        }
        if (_longitude != nil) {
            [positionDic setObject:_longitude forKey:@"lon"];
        }
    }
    @catch (NSException* e) {
        @throw e;
    }
    @finally {
        return positionDic;
    }
}

- (NSString*) toStringJSON {
    
    NSData *userPositionJSON = [NSJSONSerialization dataWithJSONObject:[self toDictionary] options:(NSJSONWritingOptions) 0 error:nil];
    NSString* userPositionString = [[NSString alloc] initWithData:userPositionJSON encoding:NSUTF8StringEncoding];
    
    return userPositionString;
}

- (NSString *)description {
    return [NSString stringWithFormat: @"MWZDirectionResponsePoint: Latitude=%@ Longitude=%@ Floor=%@ PlaceId=%@ VenueId=%@ PlaceListId=%@", _latitude, _longitude, _floor, _placeId, _venueId, _placeListId];
}

@end

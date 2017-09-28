#import "MWZPlace.h"
#import "MWZGeometryFactory.h"

@implementation MWZPlace

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
    if (![[dic objectForKey:@"venueId"] isEqual:NSNull.null]) {
        _venueId = [dic objectForKey:@"venueId"];
    }
    if (![[dic objectForKey:@"venue"] isEqual:NSNull.null]) {
        _venue = [[MWZVenue alloc] initFromDictionary:[dic objectForKey:@"venue"]];
    }
    if (![[dic objectForKey:@"floor"] isEqual:NSNull.null]) {
        _floor = [dic objectForKey:@"floor"];
    }
    if (![[dic objectForKey:@"translations"] isEqual:NSNull.null]) {
        _translations = [MWZTranslation parseTranslations:[dic objectForKey:@"translations"]];
    }
    if (![[dic objectForKey:@"order"] isEqual:NSNull.null]) {
        _order = [dic objectForKey:@"order"];
    }
    if (![[dic objectForKey:@"placeTypeId"] isEqual:NSNull.null]) {
        _placeTypeId = [dic objectForKey:@"placeTypeId"];
    }
    if (![[dic objectForKey:@"placeType"] isEqual:NSNull.null]) {
        _placeType = [[MWZPlaceType alloc] initFromDictionary:[dic objectForKey:@"placeType"]];
    }
    if (![[dic objectForKey:@"isPublished"] isEqual:NSNull.null]) {
        _isPublished = [[dic objectForKey:@"isPublished"] boolValue];
    }
    if (![[dic objectForKey:@"isSearchable"] isEqual:NSNull.null]) {
        _isSearchable = [[dic objectForKey:@"isSearchable"] boolValue];
    }
    if (![[dic objectForKey:@"isVisible"] isEqual:NSNull.null]) {
        _isVisible = [[dic objectForKey:@"isVisible"] boolValue];
    }
    if (![[dic objectForKey:@"isClickable"] isEqual:NSNull.null]) {
        _isClickable = [[dic objectForKey:@"isClickable"] boolValue];
    }
    if (![[dic objectForKey:@"tags"] isEqual:NSNull.null]) {
        _tags = [dic objectForKey:@"tags"];
    }
    if (![[dic objectForKey:@"style"] isEqual:NSNull.null]) {
        _style = [[MWZStyle alloc] initFromDictionary:[dic objectForKey:@"style"]];
    }
    if (![[dic objectForKey:@"geometry"] isEqual:NSNull.null]) {
        _geometry = [MWZGeometryFactory geometryWithDictionary:[dic objectForKey:@"geometry"]];
    }
    if (![[dic objectForKey:@"marker"] isEqual:NSNull.null]) {
        _marker = [[MWZCoordinate alloc] initWithDictionary:[dic objectForKey:@"marker"]];
        _marker.floor = _floor;
    }
    if (![[dic objectForKey:@"entrance"] isEqual:NSNull.null]) {
        _entrance = [[MWZCoordinate alloc] initWithDictionary:[dic objectForKey:@"entrance"]];
        _entrance.floor = _floor;
    }
    if (![[dic objectForKey:@"data"] isEqual:NSNull.null]) {
        _data = [dic objectForKey:@"data"];
    }
    return self;
}

- (NSDictionary*) toDictionary {
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
    @try {
        if (_identifier != nil)
            [dic setObject:_identifier forKey:@"_id"];
        if (_name != nil)
            [dic setObject:_name forKey:@"name"];
        if (_alias != nil)
            [dic setObject:_alias forKey:@"alias"];
        if (_venueId != nil)
            [dic setObject:_venueId forKey:@"venueId"];
        if (_floor != nil)
            [dic setObject:_floor forKey:@"floor"];
        if (_order != nil)
            [dic setObject:_order forKey:@"order"];
        if (_placeTypeId != nil)
            [dic setObject:_placeTypeId forKey:@"placeTypeId"];
        if (_placeType != nil)
            [dic setObject:[_placeType toDictionary] forKey:@"placeType"];
        if (_venue != nil) {
            [dic setObject:[_venue toDictionary] forKey:@"venue"];
        }
        [dic setObject:[NSNumber numberWithBool:_isPublished] forKey:@"isPublished"];
        [dic setObject:[NSNumber numberWithBool:_isSearchable] forKey:@"isSearchable"];
        [dic setObject:[NSNumber numberWithBool:_isVisible] forKey:@"isVisible"];
        [dic setObject:[NSNumber numberWithBool:_isClickable] forKey:@"isClickable"];
        if (_style != nil)
            [dic setObject:[_style toDictionary] forKey:@"style"];
        if (_geometry != nil)
            [dic setObject:[_geometry toDictionary] forKey:@"geometry"];
        if (_marker != nil)
            [dic setObject:[_marker toDictionary] forKey:@"marker"];
        if (_entrance != nil)
            [dic setObject:[_entrance toDictionary] forKey:@"entrance"];
        if (_data != nil)
            [dic setObject:_data forKey:@"data"];
        
        if (_translations != nil) {
            NSMutableArray* transationArray = [[NSMutableArray alloc] init];
            for (MWZTranslation* tr in _translations) {
                NSDictionary* d = [tr toDictionary];
                [transationArray addObject:d];
            }
            [dic setObject:transationArray forKey:@"translations"];
        }
    }
    @catch (NSException* e) {
        @throw e;
    }
    @finally {
        return dic;
    }
}


- (NSDictionary*) toDirectionDictionary {
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
    if (_identifier) {
        [dic setObject:_identifier forKey:@"placeId"];
    }
    return dic;
}

- (NSString*) toDirectionStringJSON {
    NSData *data = [NSJSONSerialization dataWithJSONObject:[self toDirectionDictionary] options:(NSJSONWritingOptions) 0 error:nil];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (MWZBounds*) getBounds {
    return [_geometry getBounds];
}

- (NSString *)description {
    return [NSString stringWithFormat: @"MWZPlace: Identifier=%@ Name=%@ Alias=%@ VenueId=%@", _identifier, _name, _alias, _venueId];
}

@end

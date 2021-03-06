#import "MWZMeasurement.h"

@implementation MWZMeasurement

- (instancetype) initWithLatitude: (double) latitude longitude: (double) longitude floor:(NSNumber*) floor accuracy: (NSNumber*) accuracy valitidy: (NSNumber*) validity source: (NSString*) source {
    self = [super init];
    _latitude = latitude;
    _longitude = longitude;
    _floor = floor;
    _accuracy = accuracy;
    _validity = validity;
    _source = source;
    return self;
}

- (instancetype)initFromDictionary:(NSDictionary*)dic {
    self = [super init];
    if (![[dic objectForKey:@"latitude"] isEqual:NSNull.null]) {
        _latitude = [[dic objectForKey:@"latitude"] doubleValue];
    }
    if (![[dic objectForKey:@"longitude"] isEqual:NSNull.null]) {
        _longitude = [[dic objectForKey:@"longitude"] doubleValue];
    }
    if (![[dic objectForKey:@"floor"] isEqual:NSNull.null]) {
        _floor = [dic objectForKey:@"floor"];
    }
    if (![[dic objectForKey:@"accuracy"] isEqual:NSNull.null]) {
        _accuracy = [dic objectForKey:@"accuracy"];
    }
    if (![[dic objectForKey:@"validUntil"] isEqual:NSNull.null]) {
        _validUntil = [dic objectForKey:@"validUntil"];
    }
    if (![[dic objectForKey:@"validity"] isEqual:NSNull.null]) {
        _validity = [dic objectForKey:@"validity"];
    }
    if (![[dic objectForKey:@"source"] isEqual:NSNull.null]) {
        _source = [dic objectForKey:@"source"];
    }
    return self;
}

- (NSString*) toStringJSON {
    NSMutableDictionary* userPositionDic = [[NSMutableDictionary alloc] init];
    NSString* userPositionString = @"{}";
    @try {
        [userPositionDic setObject:@(_latitude) forKey:@"latitude"];
        [userPositionDic setObject:@(_longitude) forKey:@"longitude"];
        if (_floor != nil) {
            [userPositionDic setObject:_floor forKey:@"floor"];
        }
        if (_accuracy != nil) {
            [userPositionDic setObject:_accuracy forKey:@"accuracy"];
        }
        if (_validity != nil) {
            [userPositionDic setObject:[self validity] forKey:@"validity"];
        }
        if (_source != nil) {
            [userPositionDic setObject:[self source] forKey:@"source"];
        }
        
        NSData *userPositionJSON = [NSJSONSerialization dataWithJSONObject:userPositionDic options:(NSJSONWritingOptions) 0 error:nil];
        userPositionString = [[NSString alloc] initWithData:userPositionJSON encoding:NSUTF8StringEncoding];
    }
    @catch (NSException* e) {
        @throw e;
    }
    @finally {
        return userPositionString;
    }
}

- (NSString *)description {
    return [NSString stringWithFormat: @"MWZMeasurement: Latitude=%f Longitude=%f Floor=%@ Accuracy=%@ Validity=%@ Source=%@", _latitude, _longitude, _floor, _accuracy, _validity, _source];
}

@end

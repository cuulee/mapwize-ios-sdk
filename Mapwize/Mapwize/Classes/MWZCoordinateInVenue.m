#import "MWZCoordinateInVenue.h"

@implementation MWZCoordinateInVenue

- (instancetype) initWithLatitude:(double)latitude longitude:(double)longitude floor:(NSNumber *)floor venueId:(NSString*) venueId {
    self = [super initWithLatitude:latitude longitude:longitude floor:floor];
    self.venueId = venueId;
    return self;
}

- (instancetype) initWithCoordinate:(MWZCoordinate*) coodinate venueId:(NSString*) venueId {
    self = [super initWithLatitude:coodinate.latitude longitude:coodinate.longitude floor:coodinate.floor];
    self.venueId = venueId;
    return self;
}

- (NSDictionary*) toDirectionDictionary {
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
    @try {
        [dic setObject:[NSNumber numberWithDouble:self.coordinate.latitude] forKey:@"lat"];
        [dic setObject:[NSNumber numberWithDouble:self.coordinate.longitude] forKey:@"lon"];
        if (self.floor != nil) {
            [dic setObject:self.floor forKey:@"floor"];
        }
        if (self.venueId != nil) {
            [dic setObject:self.venueId forKey:@"venueId"];
        }
    }
    @catch (NSException* e) {
        @throw e;
    }
    @finally {
        return dic;
    }
}

- (NSString*) toDirectionStringJSON {
    NSData *data = [NSJSONSerialization dataWithJSONObject:[self toDirectionDictionary] options:(NSJSONWritingOptions) 0 error:nil];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end

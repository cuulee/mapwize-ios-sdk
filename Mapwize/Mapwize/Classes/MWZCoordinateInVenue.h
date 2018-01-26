#import "MWZCoordinate.h"

@interface MWZCoordinateInVenue : MWZCoordinate

@property (nonatomic, strong) NSString* venueId;

- (instancetype) initWithLatitude:(double)latitude longitude:(double)longitude floor:(NSNumber *)floor venueId:(NSString*) venueId;

- (instancetype) initWithCoordinate:(MWZCoordinate*) coodinate venueId:(NSString*) venueId;

@end

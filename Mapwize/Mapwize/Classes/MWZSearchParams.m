#import "MWZSearchParams.h"

@implementation MWZSearchParams

- (NSDictionary*) toDictionary {
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
    @try {
        if (_query) {
            [dic setObject:_query forKey:@"query"];
        }
        if (_venueId) {
            [dic setObject:_venueId forKey:@"venueId"];
        }
        if (_organizationId) {
            [dic setObject:_organizationId forKey:@"organizationId"];
        }
        if (_universeId) {
            [dic setObject:_universeId forKey:@"universeId"];
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

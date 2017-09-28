#import "MWZCustomMarkerOptions.h"

@implementation MWZCustomMarkerOptions

- (NSDictionary*) toDictionary {
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
    if (_iconUrl) {
        [dic setObject:_iconUrl forKey:@"iconUrl"];
    }
    if (_iconAnchor) {
        [dic setObject:_iconAnchor forKey:@"iconAnchor"];
    }
    if (_iconSize) {
        [dic setObject:_iconSize forKey:@"iconSize"];
    }
    return dic;
}
    
@end

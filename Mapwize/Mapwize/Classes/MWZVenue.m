#import "MWZVenue.h"
#import "MWZGeometryFactory.h"

@implementation MWZVenue

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
    if (![[dic objectForKey:@"defaultLanguage"] isEqual:NSNull.null]) {
        _defaultLanguage = [dic objectForKey:@"defaultLanguage"];
    }
    if (![[dic objectForKey:@"supportedLanguages"] isEqual:NSNull.null]) {
        _supportedLanguages = [dic objectForKey:@"supportedLanguages"];
    }
    if (![[dic objectForKey:@"icon"] isEqual:NSNull.null]) {
        _icon = [dic objectForKey:@"icon"];
    }
    if (![[dic objectForKey:@"geometry"] isEqual:NSNull.null]) {
        _geometry = [MWZGeometryFactory geometryWithDictionary:[dic objectForKey:@"geometry"]];
    }
    if (![[dic objectForKey:@"data"] isEqual:NSNull.null]) {
        _data = [dic objectForKey:@"data"];
    }
    if (![[dic objectForKey:@"marker"] isEqual:NSNull.null]) {
        _marker = [[MWZCoordinate alloc] initWithDictionary:[dic objectForKey:@"marker"]];
    }
    if (![[dic objectForKey:@"isPublished"] isEqual:NSNull.null]) {
        _isPublished = [[dic objectForKey:@"isPublished"] boolValue];
    }
    if (![[dic objectForKey:@"areQrcodesDeployed"] isEqual:NSNull.null]) {
        _areQrcodesDeployed = [[dic objectForKey:@"areQrcodesDeployed"] boolValue];
    }
    if (![[dic objectForKey:@"areIbeaconsDeployed"] isEqual:NSNull.null]) {
        _areIbeaconsDeployed = [[dic objectForKey:@"areIbeaconsDeployed"] boolValue];
    }
    return self;
}

- (NSDictionary*) toDictionary {
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
    if (_identifier != nil)
        [dic setObject:_identifier forKey:@"_id"];
    if (_name != nil)
        [dic setObject:_name forKey:@"name"];
    if (_alias != nil)
        [dic setObject:_alias forKey:@"alias"];
    [dic setObject:[NSNumber numberWithBool:_isPublished] forKey:@"isPublished"];
    if (_geometry != nil)
        [dic setObject:[_geometry toDictionary] forKey:@"geometry"];
    if (_marker != nil)
        [dic setObject:[_marker toDictionary] forKey:@"marker"];
    if (_data != nil)
        [dic setObject:_data forKey:@"data"];
    if (_defaultLanguage != nil)
        [dic setObject:_defaultLanguage forKey:@"defaultLanguage"];
    if (_supportedLanguages != nil)
        [dic setObject:_supportedLanguages forKey:@"supportedLanguages"];
    
    return dic;

}

- (MWZBounds*) getBounds {
    return [_geometry getBounds];
}

-(NSString *)description {
    return [NSString stringWithFormat: @"MWZVenue: Identifier=%@ Name=%@ Alias=%@", _identifier, _name, _alias];
}

@end

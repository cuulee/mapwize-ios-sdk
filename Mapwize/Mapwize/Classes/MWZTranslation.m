#import "MWZTranslation.h"

@implementation MWZTranslation

- (instancetype)initFromDictionary:(NSDictionary*)dic {
    self = [super init];
    if (![[dic objectForKey:@"title"] isEqual:NSNull.null]) {
        _title = [dic objectForKey:@"title"];
    }
    if (![[dic objectForKey:@"subTitle"] isEqual:NSNull.null]) {
        _subTitle = [dic objectForKey:@"subTitle"];
    }
    if (![[dic objectForKey:@"details"] isEqual:NSNull.null]) {
        _details = [dic objectForKey:@"details"];
    }
    if (![[dic objectForKey:@"language"] isEqual:NSNull.null]) {
        _language = [dic objectForKey:@"language"];
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat: @"MWZTranslation: Language=%@ Title=%@ Subtitle=%@ Details=%@", _language, _title, _subTitle, _details];
}

+ (NSArray<MWZTranslation*>*) parseTranslations:(NSArray*) translationJSON {
    NSMutableArray* translations = [[NSMutableArray alloc] init];
    if (translationJSON != nil) {
        for (NSDictionary* dic in translationJSON) {
            MWZTranslation* translation = [[MWZTranslation alloc] initFromDictionary:dic];
            [translations addObject:translation];
        }
    }
    return [[NSArray alloc] initWithArray:translations];
}

- (NSDictionary*) toDictionary {
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
    
    @try {
        if (_title != nil)
            [dic setObject:_title forKey:@"title"];
        if (_subTitle != nil)
            [dic setObject:_subTitle forKey:@"subTitle"];
        if (_details != nil)
            [dic setObject:_details forKey:@"details"];
        if (_language != nil)
            [dic setObject:_language forKey:@"language"];
    }
    @catch (NSException* e) {
        @throw e;
    }
    @finally {
        return dic;
    }
}

@end

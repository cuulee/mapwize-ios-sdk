#import "MWZSessionManager.h"

@implementation MWZSessionManager

- (id)init {
    
    NSDictionary *dict = [[NSBundle mainBundle] infoDictionary];
    NSString *serverUrl = dict[@"MWZServerUrl"];
    if (!serverUrl) {
        serverUrl = @"https://api.mapwize.io";
    }
    
    self = [super initWithBaseURL:[NSURL URLWithString:serverUrl]];
    
    if(!self) return nil;
    
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    
    return self;
}

+ (id)sharedManager {
    static MWZSessionManager *_sessionManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sessionManager = [[self alloc] init];
    });
    
    return _sessionManager;
}


@end

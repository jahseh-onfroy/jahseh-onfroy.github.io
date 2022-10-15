%hook NSBundle

- (id)infoDictionary {
    NSMutableDictionary *plist = [%orig mutableCopy];
    plist[@"CFBundleVersion"] = @"";
    plist[@"CFBundleShortVersionString"] = @"";
    return plist;
}

%end
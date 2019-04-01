#import "TinyURL.h"
/*
 URL shortening services like tinyurl.com or vk.cc allow you to enter a URL
 such as https://drive.google.com/file/d/1EBGP1ntXPGVSfYyKGenOdzgh_hna4vg4/view
 and get back a short one such as https://vk.cc/9dEj5S
 
 Design the encode and decode methods for the TinyURL service.
 There is no restriction on how your encode/decode algorithm should work.
 You just need to ensure that a URL can be encoded to a tiny URL
 and the tiny URL can be decoded to the original URL.
 */
@interface TinyURL ()
@property (nonatomic, retain) NSMutableDictionary * dictionaryOfURLs;

@end
@implementation TinyURL


- (NSURL *)encode:(NSURL *)originalURL {

_dictionaryOfURLs= [[NSMutableDictionary alloc] init];
    NSString *temporaryString =[NSString stringWithFormat:@"%lu", [[originalURL absoluteString] hash]];
    NSString  *stringURL = [[NSString stringWithFormat:@"https://%@" , temporaryString] autorelease];
[_dictionaryOfURLs setObject:[originalURL absoluteString] forKey:stringURL];
    NSURL *returnedURL  = [[[[NSURL alloc] initWithString:stringURL] absoluteURL] autorelease];
    return returnedURL;
}

- (NSURL *)decode:(NSURL *)shortenedURL {
    NSString * stringURL = [[_dictionaryOfURLs objectForKey:[shortenedURL absoluteString]] autorelease];
    
    NSURL *resultURL = [[[NSURL alloc] initWithString:stringURL] autorelease];
   
    return resultURL;
}
// your code here
-(void) dealloc {
    
[_dictionaryOfURLs release];

[super dealloc];
}

@end

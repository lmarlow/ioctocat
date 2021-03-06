#import "GHGistComments.h"
#import "GHGistComment.h"
#import "GHGist.h"
#import "NSURL+Extensions.h"


@interface GHGistComments ()
@property(nonatomic,weak)GHGist *gist;
@end


@implementation GHGistComments

- (id)initWithGist:(GHGist *)gist {
	self = [super init];
	if (self) {
		self.gist = gist;
	}
	return self;
}

- (NSURL *)resourcePath {
	// Dynamic resourcePath, because it depends on the
	// gist id which isn't always available in advance
	return [NSString stringWithFormat:kGistCommentsFormat, self.gist.gistId];
}

- (void)setValues:(id)values {
	self.items = [NSMutableArray array];
	for (NSDictionary *dict in values) {
		GHGistComment *comment = [[GHGistComment alloc] initWithGist:self.gist];
		[comment setValues:dict];
		[self addObject:comment];
	}
}

@end
#import "public/MSHFJelloLayer.h"

@implementation MSHFJelloLayer

- (id<CAAction>)actionForKey:(NSString *)event {
  if (self.shouldAnimate) {
    if ([event isEqualToString:@"path"]) {

      CABasicAnimation *animation =
          [CABasicAnimation animationWithKeyPath:event];
      animation.duration = 0.15f;

      return animation;
    }
  }
  return [super actionForKey:event];
}

@end
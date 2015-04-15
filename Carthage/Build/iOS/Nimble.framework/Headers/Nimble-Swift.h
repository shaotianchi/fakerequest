// Generated by Swift version 1.1 (swift-600.0.56.1)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if defined(__has_include) && __has_include(<uchar.h>)
# include <uchar.h>
#elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
#endif

typedef struct _NSZone NSZone;

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted) 
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if defined(__has_feature) && __has_feature(modules)
@import Foundation;
@import ObjectiveC;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"

SWIFT_CLASS("_TtC6Nimble14FailureMessage")
@interface FailureMessage
@property (nonatomic, copy) NSString * expected;
@property (nonatomic, copy) NSString * actualValue;
@property (nonatomic, copy) NSString * to;
@property (nonatomic, copy) NSString * postfixMessage;
- (instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (NSString *)stringValue;
@end


SWIFT_PROTOCOL("_TtP6Nimble13NMBCollection_")
@protocol NMBCollection
@property (nonatomic, readonly) NSInteger count;
@end


SWIFT_PROTOCOL("_TtP6Nimble13NMBComparable_")
@protocol NMBComparable
- (NSComparisonResult)NMB_compare:(id <NMBComparable>)otherObject;
@end


SWIFT_PROTOCOL("_TtP6Nimble12NMBContainer_")
@protocol NMBContainer
- (BOOL)containsObject:(id)object;
@end


SWIFT_PROTOCOL("_TtP6Nimble20NMBDoubleConvertible_")
@protocol NMBDoubleConvertible
@property (nonatomic, readonly) double doubleValue;
@end

@protocol NMBMatcher;

SWIFT_CLASS("_TtC6Nimble14NMBExpectation")
@interface NMBExpectation : NSObject
- (instancetype)initWithActualBlock:(NSObject * (^)(void))actualBlock negative:(BOOL)negative file:(NSString *)file line:(NSUInteger)line OBJC_DESIGNATED_INITIALIZER;
@property (nonatomic, readonly, copy) NMBExpectation * (^ withTimeout)(NSTimeInterval);
@property (nonatomic, readonly, copy) void (^ to)(id <NMBMatcher>);
@property (nonatomic, readonly, copy) void (^ toNot)(id <NMBMatcher>);
@property (nonatomic, readonly, copy) void (^ notTo)(id <NMBMatcher>);
@property (nonatomic, readonly, copy) void (^ toEventually)(id <NMBMatcher>);
@property (nonatomic, readonly, copy) void (^ toEventuallyNot)(id <NMBMatcher>);
@end

@class SourceLocation;

SWIFT_PROTOCOL("_TtP6Nimble10NMBMatcher_")
@protocol NMBMatcher
- (BOOL)matches:(NSObject * (^)(void))actualBlock failureMessage:(FailureMessage *)failureMessage location:(SourceLocation *)location;
@end


SWIFT_CLASS("_TtC6Nimble23NMBObjCBeCloseToMatcher")
@interface NMBObjCBeCloseToMatcher <NMBMatcher>
- (BOOL)matches:(NSObject * (^)(void))actualExpression failureMessage:(FailureMessage *)failureMessage location:(SourceLocation *)location;
@property (nonatomic, readonly, copy) NMBObjCBeCloseToMatcher * (^ within)(double);
@end


SWIFT_CLASS("_TtC6Nimble14NMBObjCMatcher")
@interface NMBObjCMatcher <NMBMatcher>
- (BOOL)matches:(NSObject * (^)(void))actualBlock failureMessage:(FailureMessage *)failureMessage location:(SourceLocation *)location;
@end


@interface NMBObjCMatcher (SWIFT_EXTENSION(Nimble))
+ (NMBObjCMatcher *)beIdenticalToMatcher:(NSObject *)expected;
@end


@interface NMBObjCMatcher (SWIFT_EXTENSION(Nimble))
+ (NMBObjCMatcher *)beginWithMatcher:(id)expected;
@end


@interface NMBObjCMatcher (SWIFT_EXTENSION(Nimble))
+ (NMBObjCMatcher *)beGreaterThanOrEqualToMatcher:(id <NMBComparable>)expected;
@end


@interface NMBObjCMatcher (SWIFT_EXTENSION(Nimble))
+ (NMBObjCMatcher *)containMatcher:(NSObject *)expected;
@end

@class NMBObjCRaiseExceptionMatcher;

@interface NMBObjCMatcher (SWIFT_EXTENSION(Nimble))
+ (NMBObjCRaiseExceptionMatcher *)raiseExceptionMatcher;
@end


@interface NMBObjCMatcher (SWIFT_EXTENSION(Nimble))
+ (NMBObjCMatcher *)beGreaterThanMatcher:(id <NMBComparable>)expected;
@end


@interface NMBObjCMatcher (SWIFT_EXTENSION(Nimble))
+ (NMBObjCMatcher *)beLessThanMatcher:(id <NMBComparable>)expected;
@end


@interface NMBObjCMatcher (SWIFT_EXTENSION(Nimble))
+ (id <NMBMatcher>)equalMatcher:(NSObject *)expected;
@end

@class NSNumber;

@interface NMBObjCMatcher (SWIFT_EXTENSION(Nimble))
+ (NMBObjCBeCloseToMatcher *)beCloseToMatcher:(NSNumber *)expected within:(double)within;
@end


@interface NMBObjCMatcher (SWIFT_EXTENSION(Nimble))
+ (NMBObjCMatcher *)beLessThanOrEqualToMatcher:(id <NMBComparable>)expected;
@end


@interface NMBObjCMatcher (SWIFT_EXTENSION(Nimble))
+ (id <NMBMatcher>)beAnInstanceOfMatcher:(Class)expected;
@end


@interface NMBObjCMatcher (SWIFT_EXTENSION(Nimble))
+ (id <NMBMatcher>)beAKindOfMatcher:(Class)expected;
@end


@interface NMBObjCMatcher (SWIFT_EXTENSION(Nimble))
+ (NMBObjCMatcher *)endWithMatcher:(id)expected;
@end


@interface NMBObjCMatcher (SWIFT_EXTENSION(Nimble))
+ (NMBObjCMatcher *)beNilMatcher;
@end


@interface NMBObjCMatcher (SWIFT_EXTENSION(Nimble))
@end


@interface NMBObjCMatcher (SWIFT_EXTENSION(Nimble))
+ (NMBObjCMatcher *)beTruthyMatcher;
+ (NMBObjCMatcher *)beFalsyMatcher;
@end


SWIFT_CLASS("_TtC6Nimble28NMBObjCRaiseExceptionMatcher")
@interface NMBObjCRaiseExceptionMatcher <NMBMatcher>
- (BOOL)matches:(NSObject * (^)(void))actualBlock failureMessage:(FailureMessage *)failureMessage location:(SourceLocation *)location;
@end


SWIFT_PROTOCOL("_TtP6Nimble20NMBOrderedCollection_")
@protocol NMBOrderedCollection <NMBCollection>
- (NSInteger)indexOfObject:(id)object;
@end


@interface NSArray (SWIFT_EXTENSION(Nimble)) <NMBContainer>
@end


@interface NSArray (SWIFT_EXTENSION(Nimble)) <NMBOrderedCollection>
@end


@interface NSArray (SWIFT_EXTENSION(Nimble))
@end


@interface NSDecimalNumber (SWIFT_EXTENSION(Nimble)) <NMBDoubleConvertible>
@end


@interface NSDictionary (SWIFT_EXTENSION(Nimble)) <NMBCollection>
@end


@interface NSHashTable (SWIFT_EXTENSION(Nimble)) <NMBContainer>
@end


@interface NSHashTable (SWIFT_EXTENSION(Nimble)) <NMBCollection>
@end


@interface NSNumber (SWIFT_EXTENSION(Nimble)) <NMBDoubleConvertible>
@end


@interface NSNumber (SWIFT_EXTENSION(Nimble)) <NMBComparable>
- (NSComparisonResult)NMB_compare:(id <NMBComparable>)otherObject;
@end


@interface NSSet (SWIFT_EXTENSION(Nimble)) <NMBContainer>
@end


@interface NSSet (SWIFT_EXTENSION(Nimble)) <NMBCollection>
@end


@interface NSString (SWIFT_EXTENSION(Nimble)) <NMBComparable>
- (NSComparisonResult)NMB_compare:(id <NMBComparable>)otherObject;
@end


SWIFT_CLASS("_TtC6Nimble14SourceLocation")
@interface SourceLocation
@property (nonatomic, readonly, copy) NSString * file;
@property (nonatomic, readonly) NSUInteger line;
@property (nonatomic, readonly, copy) NSString * description;
@end

#pragma clang diagnostic pop
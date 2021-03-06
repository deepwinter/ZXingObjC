/*
 * Copyright 2012 ZXing authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "ZXGeoParsedResult.h"
#import "ZXParsedResultType.h"

@interface ZXGeoParsedResult ()

@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nonatomic) double altitude;
@property (nonatomic, copy) NSString *query;

@end

@implementation ZXGeoParsedResult

@synthesize latitude;
@synthesize longitude;
@synthesize altitude;
@synthesize query;

- (id)initWithLatitude:(double)aLatitude longitude:(double)aLongitude altitude:(double)anAltitude query:(NSString *)aQuery {
  if (self = [super initWithType:kParsedResultTypeGeo]) {
    self.latitude = aLatitude;
    self.longitude = aLongitude;
    self.altitude = anAltitude;
    self.query = aQuery;
  }

  return self;
}

+ (id)geoParsedResultWithLatitude:(double)latitude longitude:(double)longitude altitude:(double)altitude query:(NSString *)query {
  return [[self alloc] initWithLatitude:latitude longitude:longitude altitude:altitude query:query];
}


- (NSString *)geoURI {
  NSMutableString *result = [NSMutableString string];
  [result appendFormat:@"geo:%f,%f", self.latitude, self.longitude];
  if (self.altitude > 0) {
    [result appendFormat:@",%f", self.altitude];
  }
  if (self.query != nil) {
    [result appendFormat:@"?%@", query];
  }
  return result;
}

- (NSString *)displayResult {
  NSMutableString *result = [NSMutableString string];
  [result appendFormat:@"%f, %f", self.latitude, self.longitude];
  if (self.altitude > 0.0) {
    [result appendFormat:@", %f", self.altitude];
    [result appendString:@"m"];
  }
  if (self.query != nil) {
    [result appendFormat:@" (%@)", self.query];
  }
  return result;
}

@end

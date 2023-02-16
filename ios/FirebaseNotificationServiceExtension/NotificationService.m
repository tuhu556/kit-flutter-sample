//
//  NotificationService.m
//  FirebaseNotificationServiceExtension
//
//  Created by hiep pham on 16/02/2023.
//

#import "NotificationService.h"
@import Firebase;

@interface NotificationService ()

@property (nonatomic, strong) void (^contentHandler)(UNNotificationContent *contentToDeliver);
@property (nonatomic, strong) UNMutableNotificationContent *bestAttemptContent;

@end

@implementation NotificationService

- (void)didReceiveNotificationRequest:(UNNotificationRequest *)request withContentHandler:(void (^)(UNNotificationContent * _Nonnull))contentHandler {
    self.contentHandler = contentHandler;
    self.bestAttemptContent = [request.content mutableCopy];
    
    self.bestAttemptContent.title = [NSString stringWithFormat:@"%@",
    self.bestAttemptContent.title];

  // Call FIRMessaging extension helper API.
  [[FIRMessaging extensionHelper] populateNotificationContent:self.bestAttemptContent
                                            withContentHandler:contentHandler];
}

- (void)serviceExtensionTimeWillExpire {
    // Called just before the extension will be terminated by the system.
    // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
    self.contentHandler(self.bestAttemptContent);
}

@end

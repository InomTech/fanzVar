abstract class NotificationsStates {}

class Initial extends NotificationsStates {}

class IsLoading extends NotificationsStates {}

class NotificationsError extends NotificationsStates {
  final String error;
  NotificationsError(this.error);
}

class GetNotifications extends NotificationsStates {}

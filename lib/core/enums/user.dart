enum UserStatus { ACTIVE, INACTIVE, SUSPENDED, PENDING }

extension UserStatusExtension on UserStatus {
  String get displayName {
    switch (this) {
      case UserStatus.ACTIVE:
        return 'Active';
      case UserStatus.INACTIVE:
        return 'Inactive';
      case UserStatus.SUSPENDED:
        return 'Suspended';
      case UserStatus.PENDING:
        return 'Pending';
    }
  }
}

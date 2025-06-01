abstract class EditProfileScreenStates {}

class Initial extends EditProfileScreenStates {}

class IsLoading extends EditProfileScreenStates {}

class ImagePicked extends EditProfileScreenStates {}

class ImageUpload extends EditProfileScreenStates {}

class JoiningState extends EditProfileScreenStates {}

class Joining2State extends EditProfileScreenStates {}

class EditProfileScreenError extends EditProfileScreenStates {
  final String error;
  EditProfileScreenError(this.error);
}

class LogoutSuccess extends EditProfileScreenStates {}

class ChangeDarkMood extends EditProfileScreenStates {
  bool isDardMode;
  ChangeDarkMood(this.isDardMode);
}

class SelectPlayer extends EditProfileScreenStates {}

class SelectPlayerAgeRange extends EditProfileScreenStates {}

class FilePickSuccess extends EditProfileScreenStates {}

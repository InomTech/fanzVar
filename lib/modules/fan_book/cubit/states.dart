abstract class FanBookStates {}

class Initial extends FanBookStates {}

class IsLoading extends FanBookStates {}

class SongsListLoadedSuccessfuly extends FanBookStates {
  final songsList;
  SongsListLoadedSuccessfuly(this.songsList);
}

class SongsListLoadedSuccessfully extends FanBookStates {}

class FanBookError extends FanBookStates {
  final String error;
  FanBookError(this.error);
}

class AblumListLoadedSuccessfuly extends FanBookStates {
  final albumList;
  AblumListLoadedSuccessfuly(this.albumList);
}

class TogglePassword extends FanBookStates {}

class InitializeCurrentUser extends FanBookStates {}

class VideosListLoadedSuccessfuly extends FanBookStates {
  final videosList;
  VideosListLoadedSuccessfuly(this.videosList);
}

class SongsIndexState extends FanBookStates {}

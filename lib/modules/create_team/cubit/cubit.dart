import 'package:fanzhashem/modules/create_team/cubit/states.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateTeamCubit extends Cubit<CreateTeamStates> {
  CreateTeamCubit() : super(Initial());

  static CreateTeamCubit get(context) => BlocProvider.of(context);

  final nameController = TextEditingController();
  final coachController = TextEditingController();
  final teamCaptainController = TextEditingController();
  final playerPositionController = TextEditingController();
  final playerController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  String? selectedPlayer;

  List<String> players = ["Mo Salah", "Messy", "Abu Treka"];

  String? selectedPlayerAgeRange;

  List<String> playerAgeRanges = ["12-20", "20-25", "25-30"];

  bool selectedPlayerAgeRangeError = false;

  bool selectedPlayerError = false;

  selectPlayer(String player) {
    selectedPlayer = player;
    emit(SelectPlayer());
  }

  selectPlayerAgeRange(String playerAgeRange) {
    selectedPlayerAgeRange = playerAgeRange;
    emit(SelectPlayerAgeRange());
  }

  submit() {
    if (formKey.currentState!.validate() &&
        selectedPlayerAgeRange != null &&
        selectedPlayer != null) {
      toggleIsLoading();

      selectedPlayerAgeRangeError = false;
      selectedPlayerError = false;

      emit(SubmitSuccess());

      toggleIsLoading();
    } else {
      if (selectedPlayerAgeRange.toString().isEmpty ||
          selectedPlayerAgeRange == null) {
        selectedPlayerAgeRangeError = true;
      } else {
        selectedPlayerAgeRangeError = false;
      }

      if (selectedPlayer.toString().isEmpty || selectedPlayer == null) {
        selectedPlayerError = true;
      } else {
        selectedPlayerError = false;
      }

      showToast(msg: "All fields are required");

      emit(SubmitError());
    }
  }

  toggleIsLoading() {
    isLoading = !isLoading;
    emit(IsLoading());
  }
}

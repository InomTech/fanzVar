abstract class SuggestedProjectsStates {}

class Initial extends SuggestedProjectsStates {}
class VotedState extends SuggestedProjectsStates {}
class FavourtState extends SuggestedProjectsStates {}
class GetSuggestedProjectsState extends SuggestedProjectsStates {
  final suggestedProjects;
  GetSuggestedProjectsState(this.suggestedProjects);
}

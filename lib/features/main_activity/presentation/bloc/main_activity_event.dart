part of 'main_activity_bloc.dart';

abstract class MainActivityEvent extends Equatable {
  const MainActivityEvent();
}

class OpenOptionsPage extends MainActivityEvent {
  @override
  List<Object> get props => null;
}

class OpenWelcomePage extends MainActivityEvent {
  @override
  List<Object> get props => null;
}

class OpenDataManagementPage extends MainActivityEvent {
  final String userUID;

  OpenDataManagementPage({@required this.userUID});
  @override
  List<Object> get props => [this.userUID];
}

class FetchUserModelData extends MainActivityEvent {
  final String userUID;

  FetchUserModelData({@required this.userUID});

  @override
  List<Object> get props => [this.userUID];
}

class SaveUserModelData extends MainActivityEvent {
  final String userUID;
  final UserDataModel userDataModel;

  SaveUserModelData({@required this.userUID, @required this.userDataModel});

  @override
  List<Object> get props => [this.userUID, this.userDataModel];
}

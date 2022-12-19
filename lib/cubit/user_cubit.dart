import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/api_return_value.dart';
import '../services/user_services.dart';
import '../signin_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> getProfile(String token) async {
    ApiReturnValue<User>? result = await UserServices.getProfile(token);
    if (result?.value != null) {
      emit(UserLoaded(user: result?.value));
    } else {
      emit(UserLoadingFailed(result?.message));
    }
  }
}

import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../core/bloc/ez_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((final event, final emit) {
      // TODO: implement event handler
    });
  }
}

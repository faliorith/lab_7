import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pages_bloc_event.dart';
part 'pages_bloc_state.dart';

class PagesBlocBloc extends Bloc<PagesBlocEvent, PagesBlocState> {
  PagesBlocBloc() : super(PagesBlocInitial()) {
    on<PagesBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

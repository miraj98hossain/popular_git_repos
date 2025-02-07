// import 'package:delta_hospital/app/data/models/patient_portal_user_list_response.dart';
// import 'package:delta_hospital/app/domain/repositories/app_repository.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// sealed class AddedPatUserListEvent {}

// final class GetAddedPatUserListEvent extends AddedPatUserListEvent {
//   final String refId;

//   GetAddedPatUserListEvent({required this.refId});
// }

// @immutable
// sealed class AddedPatUserListState {}

// final class AddedPatUserListInitial extends AddedPatUserListState {}

// final class AddedPatUserListLoading extends AddedPatUserListState {}

// final class AddedPatUserListSuccess extends AddedPatUserListState {
//   final List<PatientPortalUser> patientPortalUserList;
//   AddedPatUserListSuccess({required this.patientPortalUserList});
// }

// final class AddedPatUserListError extends AddedPatUserListState {
//   final Object error;
//   AddedPatUserListError({required this.error});
// }

// class AddedPatUserListBloc
//     extends Bloc<AddedPatUserListEvent, AddedPatUserListState> {
//   final AppRepository _appRepository;
//   AddedPatUserListBloc(this._appRepository) : super(AddedPatUserListInitial()) {
//     on<GetAddedPatUserListEvent>((event, emit) async {
//       emit(AddedPatUserListLoading());
//       try {
//         var response = await _appRepository.finalPatientPortalUserByRefId(
//             refId: event.refId);
//         emit(AddedPatUserListSuccess(patientPortalUserList: response));
//       } catch (e) {
//         emit(AddedPatUserListError(error: e));
//       }
//     });
//   }
// }

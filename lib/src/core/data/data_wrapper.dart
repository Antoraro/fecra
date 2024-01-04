import '../domain/errors.dart';

class DataWrapper<DomainObject> {}

abstract class DataWrapperDataState<DomainObject>
    extends DataWrapper<DomainObject> {
  DomainObject data;

  DataWrapperDataState(this.data);
}

abstract class DataWrapperHasData<DomainObject>
    extends DataWrapperDataState<DomainObject> {
  DataWrapperHasData(super.data);
}

class DataWrapperCacheData<DomainObject>
    extends DataWrapperHasData<DomainObject> {
  DataWrapperCacheData(super.data);
}

class DataWrapperLiveData<DomainObject>
    extends DataWrapperHasData<DomainObject> {
  DataWrapperLiveData(super.data);
}

class DataWrapperError<DomainObject> extends DataWrapper<DomainObject> {
  final String? errorText;
  final Error? error;

  DataWrapperError({this.error, this.errorText}) : super();

  Error get errorOrUnknown => error ?? UnknownError();
}

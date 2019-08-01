
import 'package:dio/dio.dart';

enum Status { SUCCESS, FORM_DATA_ERROR, DIO_ERROR }

class BaseApiResponse {

  Status status;
  Map data;
  DioError error;

  BaseApiResponse.onSuccess(this.data): status = Status.SUCCESS;
  BaseApiResponse.onFormDataError(this.data): status = Status.FORM_DATA_ERROR;
  BaseApiResponse.onDioError(this.error): status = Status.DIO_ERROR;

}


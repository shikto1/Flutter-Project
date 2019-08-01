
enum Status { ON_LOADING, ON_COMPLETED, ON_ERROR }

class ApiResponse<T> {

  Status status;
  T data;
  String message;

  ApiResponse.onLoading(this.message) : status = Status.ON_LOADING;
  ApiResponse.onCompleted(this.data) : status = Status.ON_COMPLETED;
  ApiResponse.onError(this.message) : status = Status.ON_ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }

}


enum ResponseStatus { ON_SUCCESS, ON_FORM_DATA_INVALID }

class BaseApiResponse {

  ResponseStatus status;
  Map data;
  Map<String, String> errorMap;

  BaseApiResponse.onSuccess(this.data): status = ResponseStatus.ON_SUCCESS;
  BaseApiResponse.onFromDataInvalid(this.errorMap): status = ResponseStatus.ON_FORM_DATA_INVALID;

}


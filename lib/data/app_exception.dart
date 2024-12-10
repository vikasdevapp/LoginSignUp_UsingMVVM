class AppException implements Exception{

  final _message;
  final _prefix;

  AppException(this._message, this._prefix);

  String toString(){
    return '$_prefix $_message';
  }

}

class FetchDataException extends AppException{
  FetchDataException([String? message]):super (message,'Error During Communication');
}

class BadRequestException extends AppException{
  BadRequestException([String? message]):super(message,'Invalid Request');
}

class UnauthorizedException extends AppException{
  UnauthorizedException(String? meesage):super(meesage,"Unauthorized Request");
}

class InValidInputException extends AppException{
  InValidInputException(String? meesage):super(meesage,"Invalid Request");
}
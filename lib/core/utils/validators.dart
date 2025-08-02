class Validators {
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập email';
    }
    
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Email không đúng định dạng';
    }
    
    return null;
  }
  
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    }
    
    if (value.length < 6) {
      return 'Mật khẩu phải có ít nhất 6 ký tự';
    }
    
    return null;
  }
  
  static String? required(String? value, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập ${fieldName ?? 'thông tin'}';
    }
    
    return null;
  }
  
  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập số điện thoại';
    }
    
    if (!RegExp(r'^[0-9]{10,11}$').hasMatch(value)) {
      return 'Số điện thoại không đúng định dạng';
    }
    
    return null;
  }
  
  static String? minLength(String? value, int minLength, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập ${fieldName ?? 'thông tin'}';
    }
    
    if (value.length < minLength) {
      return '${fieldName ?? 'Thông tin'} phải có ít nhất $minLength ký tự';
    }
    
    return null;
  }
  
  static String? maxLength(String? value, int maxLength, {String? fieldName}) {
    if (value != null && value.length > maxLength) {
      return '${fieldName ?? 'Thông tin'} không được vượt quá $maxLength ký tự';
    }
    
    return null;
  }
} 
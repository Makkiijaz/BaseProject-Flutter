
int validateInt(var data) {
  try {
    if (data != null && data is int) {
      return data;
    } else if (data is String) {
      return int.parse(data);
    } else if (data is double) {
      return data.toInt();
    }
  } catch (e) {
    return 0;
  }
  return 0;
}

String validateString(var data) {
  try {
    if (data == null) {
      return "";
    }
    if (data is String) {
      return data;
    } else {
      return "$data";
    }
  } catch (e) {
    return "";
  }
}

double validateDouble(var data) {
  try {
    if (data != null && data is double) {
      return data;
    } else if (data is String) {
      return double.parse(data);
    } else if (data is int) {
      return data.toDouble();
    }
  } catch (e) {
    return 0.00;
  }
  return 0.00;
}

bool validateBool(var data) {
  try {
    if (data != null && data is bool) {
      return data;
    } else if (data is String) {
      if (data == "true") {
        return true;
      } else {
        return false;
      }
    } else if (data is int) {
      if (data > 0) {
        return true;
      } else {
        return false;
      }
    }
  } catch (e) {
    return false;
  }
  return false;
}

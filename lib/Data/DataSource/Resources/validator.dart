

import 'package:hbk/Data/DataSource/Resources/imports.dart';

class Validate {
  // static String? email(v) {
  //   Pattern pattern =
  //       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  //   RegExp regExp = RegExp(pattern.toString());
  //   if (v.trim().isEmpty) {
  //     return "Please provide email";
  //   } else if (!regExp.hasMatch(v)) {
  //     return AppStrings.enterValidEmail;
  //   }
  //   return null;
  // }
  static String? trainingDuration(v) {
    if (v.trim().isEmpty) {
      return "Training Duration Required";
    }

    return null;
  }
  static String? trainingClub(v) {
    if (v.trim().isEmpty) {
      return "Club Name Required";
    }

    return null;
  }
  static String? trainingObjective(v) {
    if (v.trim().isEmpty) {
      return "Training Objective Required";
    }

    return null;
  }
  static String? password(v) {
    if (v.trim().isEmpty) {
      return "Please provide password";
    }
    if (v.length < 6) {
      return "Must be greater than 6";
    }
    return null;
  }

  static String? activity(v) {
    if (v.trim().isEmpty) {
      return "Activity Name Required";
    }

    return null;
  }
  static String? trainingName(v) {
    if (v.trim().isEmpty) {
      return "Training Name Required";
    }

    return null;
  }
  static String? trainingCoachName(v) {
    if (v.trim().isEmpty) {
      return "Coach Name Required";
    }

    return null;
  }
  static String? tournamentDate(v) {
    if (v.trim().isEmpty) {
      return "Tournament Date Required";
    }

    return null;
  }
  static String? trainingDate(v) {
    if (v.trim().isEmpty) {
      return "Date Required";
    }

    return null;
  }
  static String? trainingTime(v) {
    if (v.trim().isEmpty) {
      return "Time Required";
    }

    return null;
  }

  static String? activityNotes(v) {
    if (v.trim().isEmpty) {
      return "Suggestion Required";
    }

    return null;
  }
  static String? coachFeedback(v) {
    if (v.trim().isEmpty) {
      return "Coach Feedback Required";
    }

    return null;
  }
  static String? feedbackNotes(v) {
    if (v.trim().isEmpty) {
      return "Notes for match required";
    }

    return null;
  }

  static String? activityDate(v) {
    if (v.trim().isEmpty) {
      return "Activity Date required";
    }

    return null;
  }
  static String? addTaskDate(v) {
    if (v.trim().isEmpty) {
      return "Task Date required";
    }

    return null;
  }
  static String? addTaskTime(v) {
    if (v.trim().isEmpty) {
      return "Task Time required";
    }

    return null;
  }
  static String? lessonDate(v) {
    if (v.trim().isEmpty) {
      return "Date required";
    }

    return null;
  }

  // for date of birth customDatePickerWithValidation
  static String? activityDateOfBirth(v) {
    if (v.trim().isEmpty) {
      return "Date of birth required";
    }

    return null;
  }

  static String? activityColorCode(v) {
    if (v.trim().isEmpty) {
      return "Color Code Required";
    }
    if (v.length < 6) {
      return "Must be greater than 6";
    }
    return null;
  }

  static String? activityColor(v) {
    if (v.trim().isEmpty) {
      return "Color Code Required";
    }

    return null;
  }

  // for validating country
  static String? validateCountry(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Country name';
    } else if (RegExp(r'[0-9]').hasMatch(value)) {
      return 'Country name should not contain numeric characters';
    } else if (RegExp(r'^\d{1,10}\s').hasMatch(value)) {
      return 'Country name should not contain numbers at the beginning';
    } else if (RegExp(r'\d{1,10}$').hasMatch(value)) {
      return 'Country name should not contain numbers at the end';
    }
    return null;
  }

  // for validating city
  static String? validateCity(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter City name';
    } else if (RegExp(r'[0-9]').hasMatch(value)) {
      return 'City name should not contain numeric characters';
    } else if (RegExp(r'^\d{1,10}\s').hasMatch(value)) {
      return 'City name should not contain numbers at the beginning';
    } else if (RegExp(r'\d{1,10}$').hasMatch(value)) {
      return 'City name should not contain numbers at the end';
    }
    return null;
  }

  static String? loginScreenPassword(v) {
    if (v.trim().isEmpty) {
      return "Please provide password";
    }
    return null;
  }
}

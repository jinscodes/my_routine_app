enum ExerciseType {
  count,
  time,
}

ExerciseType? stringToExerciseType(String str) {
  try {
    return ExerciseType.values
        .firstWhere((e) => e.toString().split('.').last == str);
  } catch (e) {
    return null;
  }
}

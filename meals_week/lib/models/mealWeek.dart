
class MealWeek {

  String weekDay;
  Map<String, String> meals;

  MealWeek(this.weekDay, this.meals);

  MealWeek.fromJson(Map<String, dynamic> p_json) :
    weekDay = p_json['nameDay'],
    meals = p_json['meals'];

  Map<String, dynamic> toJson() => {
    weekDay:meals,
  };

}
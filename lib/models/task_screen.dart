// To parse this JSON data, do
//
//     final taskDetails = taskDetailsFromJson(jsonString);

import 'dart:convert';

TaskDetails taskDetailsFromJson(String str) => TaskDetails.fromJson(json.decode(str));

String taskDetailsToJson(TaskDetails data) => json.encode(data.toJson());

class TaskDetails {
    String title;
    String description;

    TaskDetails({
        required this.title,
        required this.description,
    });

    factory TaskDetails.fromJson(Map<String, dynamic> json) => TaskDetails(
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
    };
}

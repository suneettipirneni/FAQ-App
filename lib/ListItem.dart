class ListItem {
  String title;
  String description;
  bool isExpanded = false;

  ListItem(String title, String description) {
    this.title = title;
    this.description = description;
  }

  ListItem.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    description = json["description"];
  }
}
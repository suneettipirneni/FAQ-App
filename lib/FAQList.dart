import 'package:faq/ListItem.dart';
import 'package:flutter/material.dart';

// Handles state changes for the items.
class _FAQListState extends State<FAQList> {
  List<ListItem> items;

  _FAQListState(List<ListItem> items) {
    this.items = items;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
          children: [
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  // Toggle state on the callback
                  items[index].isExpanded = !isExpanded;
                });
              },
              // Create an expansion panel for each item.
              children: items.map<ExpansionPanel>((ListItem item) {
                  return ExpansionPanel(
                      body: ListTile(
                        leading: Icon(Icons.format_quote),
                        title: Text(item.description),
                      ),
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          leading: Icon(Icons.question_answer_outlined),
                          title: Text(item.title),
                        );
                      },
                      isExpanded: item.isExpanded
                  );
              }).toList(),
            ),
          ],
        )
    );
  }
}

class FAQList extends StatefulWidget {
  final List<ListItem> items;

  FAQList({Key key, this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FAQListState(items);
  }
}

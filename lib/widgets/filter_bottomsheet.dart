import 'package:flutter/material.dart';

class FilterBottomSheet extends StatelessWidget {
   FilterBottomSheet({super.key});
   int _selectedIndex = 0;

  final List<Map<String, dynamic>> _menuItems = [
    {'title': 'Sort By',  },
    {'title': 'Location', },
    {'title': 'Training Name',  },
    {'title': 'Training ',  },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title and Close Button Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sort and Filters',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context); // Close the Bottom Sheet
                },
              ),
            ],
          ),
          Divider(),
          SizedBox(height: 10),

          // Two Columns
          Row(
            children: [
          Container(
            height: MediaQuery.of(context).size.height/3,
          width: MediaQuery.of(context).size.height/6,
            color: Colors.black12,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    _menuItems[index]['title'],
                    style: TextStyle(
                      color: _selectedIndex == index ? Colors.black45 : Colors.black,
                      fontWeight: _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  tileColor: _selectedIndex == index ? Colors.black12 : null,
                  onTap: () {

                    _selectedIndex = index;


                  },
                );
              },
            ),
          ),

              Container(
                height: MediaQuery.of(context).size.height/3,
                width: MediaQuery.of(context).size.height/4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      // Search TextField
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Search',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.search),
                        ),
                        // onChanged: _filterItems,
                      ),
                      SizedBox(height: 10),
                      // ListView of checkable items
                      Expanded(
                        child: ListView.builder(
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            final item = 'abcd';
                            return ListTile(
                              leading: Checkbox(
                                value: false,
                                onChanged: (bool? value) {
                                  // _toggleItemCheck(item);
                                },
                              ),
                              title: Text("item.title"),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



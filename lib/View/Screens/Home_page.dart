import 'package:flutter/material.dart';
import 'package:hsjfkjshj/controller/api_data_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wall Paper App"),
        centerTitle: true,
      ),
      body: Consumer<ApiController>(
        builder: (context, pro, _) {
          List data = pro.data;
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onSubmitted: (val) {
                      pro.search(val: val);
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemBuilder: (context, index) => ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              "detail_page",
                              arguments: data[index],
                            );
                          },
                          child: Image.network(
                            data[index]["largeImageURL"],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: data.length,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// FutureBuilder(
// future: ApiHelper.apiHelper.getMultipleResponce(),
// builder: (context, snapShot) {
// if (snapShot.hasData) {
// List<Posts> allposts = snapShot.data!;
//
// return ListView.builder(
// itemBuilder: (context, index) => Card(
// child: ListTile(
// title: Text("Title: ${allposts[index].name}"),
// subtitle: Text("Body : ${allposts[index].body}"),
// leading: Text(" ${allposts[index].id}"),
// trailing: Text(" ${allposts[index].userID}"),
// ),
// ),
// itemCount: allposts.length,
// );
// } else if (snapShot.hasError) {
// return Text("ERROR: ${snapShot.error}");
// } else {
// return const CircularProgressIndicator();
// }
// },
// ),

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_app/components/bottom_up_transition.dart';
import 'package:my_app/dto/issues.dart';
import 'package:my_app/endpoints/endpoint.dart';
import 'package:my_app/screens/UTS/issues_Post_screen.dart';
import 'package:my_app/services/data_services.dart';

class IssuesListScreen extends StatefulWidget {
  const IssuesListScreen({Key? key}) : super(key: key);

  @override
  _IssuesListScreenState createState() => _IssuesListScreenState();
}

class _IssuesListScreenState extends State<IssuesListScreen> {
  // Future<List<Issues>>? _Issues;

  @override
  void initState() {
    super.initState();
    // _Issues = DataService.fetchIssues();
  }

  List<Issues> dataIssues = [
    Issues(
      idIssues: 1,
      title: 'lorem',
      deskripsi:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
      rating: 2,
      createdAt: DateTime.now(),
      updatedAt: null,
    ),
    Issues(
      idIssues: 2,
      title: 'lorem',
      deskripsi:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
      rating: 3,
      createdAt: DateTime.now(),
      updatedAt: null,
    ),
    Issues(
      idIssues: 3,
      title: 'lorem',
      deskripsi:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
      rating: 4,
      createdAt: DateTime.now(),
      updatedAt: null,
    ),
  ];

  void showIsian(Issues item) {
    showModalBottomSheet(
      isScrollControlled:
          true, // Mengizinkan bottom sheet untuk ditarik ke atas
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.idIssues.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10),
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(8.0),
              //   child: Image.network(
              //     Uri.parse('${Endpoint.baseURLLive}/public/${item.imageUrl!}')
              //         .toString(),
              //     errorBuilder: (context, error, stackTrace) =>
              //         const Icon(Icons.error),
              //     // height: 200,
              //     width: double.infinity,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              
              SizedBox(height: 10),
              Text(
                "Title: ${item.title}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RatingBar(
                itemSize: 20,
                ratingWidget: RatingWidget(
                  full: const Icon(
                    Icons.star,
                    color: Colors.black,
                  ),
                  half: const Icon(
                    Icons.star_half,
                    color: Colors.black,
                  ),
                  empty: const Icon(
                    Icons.star_border,
                    color: Colors.black,
                  ),
                ),
                ignoreGestures: true,
                onRatingUpdate: (double rating) {},
                initialRating: item.rating.toDouble(),
              ),
              SizedBox(height: 5),
              Text(
                "Deskripsi: ${item.deskripsi}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Di post pada?: ${item.createdAt}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {},
                  ),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('API UTS'),
          backgroundColor: Colors.blueGrey,
        ),
        body: ListView.builder(
          itemCount: dataIssues.length,
          itemBuilder: (context, index) {
            final item = dataIssues[index];
            return GestureDetector(
              onTap: () {
                showIsian(item);
              },
              child: Container(
                height: 180,
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  border: Border.all(color: const Color(0xFFE0E0E0)),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8.0),
                        // image: DecorationImage(
                        //     fit: BoxFit.cover,
                        //     image: NetworkImage(
                        //       Uri.parse(
                        //               '${Endpoint.baseURLLive}/public/${item.imageUrl!}')
                        //           .toString(),
                        //     )),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          (item.deskripsi.length > 100)
                              ? item.deskripsi.substring(0, 100) + '...'
                              : item.deskripsi,
                          style: const TextStyle(fontSize: 16),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        RatingBar(
                          itemSize: 20,
                          ratingWidget: RatingWidget(
                            full: const Icon(
                              Icons.star,
                              color: Colors.black,
                            ),
                            half: const Icon(
                              Icons.star_half,
                              color: Colors.black,
                            ),
                            empty: const Icon(
                              Icons.star_border,
                              color: Colors.black,
                            ),
                          ),
                          ignoreGestures: true,
                          onRatingUpdate: (double rating) {},
                          initialRating: item.rating.toDouble(),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {},
                            ),
                          ],
                        )
                      ],
                    )),
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.blueGrey,
          tooltip: 'Increment',
          onPressed: () {
            // Navigator.push(context, BottomUpRoute(page: const ()));
          },
          label: const Row(
            children: [
              Text(
                'Issues',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              Icon(
                Icons.contact_support,
                color: Colors.white,
                size: 28,
              ),
            ],
          ),
        ));
  }
}

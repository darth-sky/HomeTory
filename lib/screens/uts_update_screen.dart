import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_app/dto/issues.dart';
import 'package:my_app/endpoints/endpoint.dart';
import 'package:my_app/screens/UTS/issues_list_screen.dart';
import 'package:my_app/screens/testuts.dart';

class UtsUpdateScreen extends StatefulWidget {
  const UtsUpdateScreen({Key? key, required this.issues}) : super(key: key);

  final Issues issues;

  @override
  _UtsUpdateScreenState createState() => _UtsUpdateScreenState();
}

class _UtsUpdateScreenState extends State<UtsUpdateScreen> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();

  File? galleryFile;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.issues.title;
    _descController.text = widget.issues.deskripsi;
  }

  _showPicker({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future getImage(
    ImageSource img,
  ) async {
    final pickedFile = await picker.pickImage(source: img);
    XFile? xfilePick = pickedFile;
    setState(
      () {
        if (xfilePick != null) {
          galleryFile = File(pickedFile!.path);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }

  Future<void> _updateDataWithImage(BuildContext context) async {
    if (galleryFile == null) {
      return; // Handle case where no image is selected
    }

    var request = MultipartRequest(
        'POST', Uri.parse('${Endpoint.dataNIM}/${widget.issues.idIssues}'));
    request.fields['title_issues'] = _titleController.text;
    request.fields['description_issues'] = _descController.text;
    request.fields['rating'] = rating.toString();
    if (galleryFile != null) {
      var multipartFile = await MultipartFile.fromPath(
        'image', // ganti field sesui in
        galleryFile!.path,
      );
      request.files.add(multipartFile);
    }

    request.send().then((response) {
      // Handle response (success or error)
      if (response.statusCode == 200) {
        debugPrint('Data and image posted successfully!');
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Testuts()));
      } else {
        debugPrint('Error posting data: ${response.statusCode}');
      }
    });
  }

  @override
  void dispose() {
    _titleController.dispose(); // Dispose of controller when widget is removed
    _descController.dispose();
    super.dispose();
  }

  double rating = 0;
  void ratingUpdate(double userRating) {
    setState(() {
      rating = userRating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Update Issues'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Submit Update\nissues yang dimiliki!',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Masukkan judul dari masalah yang dimiliki!',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 2,
              ),
              TextField(
                controller: _titleController,
                maxLength: 50,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: "Judul",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Masukkan deskripsi dari masalah!',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              TextField(
                controller: _descController,
                maxLength: 150,
                maxLines: 4,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: "Deskripsi",
                ),
              ),
              const Text('Berikan Rating!',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              RatingBar(
                minRating: 1,
                maxRating: 5,
                allowHalfRating: false,
                ratingWidget: RatingWidget(
                  full: const Icon(
                    Icons.star,
                    color: Colors.blueGrey,
                  ),
                  half: const Icon(
                    Icons.star_half,
                    color: Colors.blueGrey,
                  ),
                  empty: const Icon(
                    Icons.star_border,
                    color: Colors.blueGrey,
                  ),
                ),
                onRatingUpdate: ratingUpdate,
                initialRating: widget.issues.rating.toDouble(),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Masukkan Attachment yang diperlukan!',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: () {
                  _showPicker(context: context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            Colors.black, // Warna border hitam untuk semua sisi
                      ),
                      color: Colors.grey.shade200),
                  width: double.infinity, // Fill available space
                  height: 150, // Adjust height as needed
                  // color: Colors.grey[200], // Placeholder color
                  child: galleryFile == null
                      ? Center(
                          child: Image.network(
                            width: 200,
                            Uri.parse(
                                    '${Endpoint.baseURLLive}/public/${widget.issues.imageUrl!}')
                                .toString(),
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.error),
                          ),
                        )
                      : Center(
                          child: Image.file(galleryFile!),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        tooltip: 'Increment',
        onPressed: () {
          _updateDataWithImage(context);
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';

class FileDownLoaderPage extends StatefulWidget {
  @override
  _FileDownLoaderPageState createState() => _FileDownLoaderPageState();
}

class _FileDownLoaderPageState extends State<FileDownLoaderPage> {
  // final imgUrl = "https://unsplash.com/photos/iEJVyyevw-U/download?force=true";
  final hwp = "https://drive.google.com/u/0/uc?id=1lkaH3AHBfZiPgMjxe6QRXb_-1jvvNk9Q&export=download";
  bool downloading = false;
  var progressString = "";

  @override
  void initState() {
    super.initState();
    downloadFile();
  }

  Future<void> downloadFile() async {
    Dio dio = Dio();

    try {
      var dir = await getApplicationDocumentsDirectory();

      await dio.download(hwp, "${dir.path}/myhwp.hwp", onReceiveProgress: (rec, total) {
        print("Rec: ${rec}, Total: ${total}");

        setState(() {
          downloading = true;
          progressString = ((rec/total)*100).toStringAsFixed(0)+"%";
        });
      });

    } catch (e) {
      print(e);
    }

    setState(() {
      downloading = false;
      progressString = "Completed";
    });
    print("Download Completed");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appbar"),
      ),
      body: Center(
        child: downloading
            ? Container(
                height: 120,
                width: 200,
                child: Card(
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Downloading File: ${progressString}",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              )
            : Text("No Data"),
      ),
    );
  }
}

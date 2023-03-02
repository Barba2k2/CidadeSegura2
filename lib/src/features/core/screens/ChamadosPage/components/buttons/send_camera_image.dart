import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../constants/colors_constants.dart';

class EnviarFotoCamera extends StatefulWidget {
  const EnviarFotoCamera({super.key});

  @override
  State<EnviarFotoCamera> createState() => _EnviarFotoCameraState();
}

class _EnviarFotoCameraState extends State<EnviarFotoCamera> {
  final FirebaseStorage storage = FirebaseStorage.instance;

  bool uploading = false;
  double total = 0;
  List<Reference> refs = [];
  List<String> arquivos = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadImages();
  }

  loadImages() async {
    refs = (await storage.ref('chamdos/images').listAll()).items;
    for (var ref in refs) {
      arquivos.add(await ref.getDownloadURL());
    }

    setState(() {
      loading = false;
    });
  }

  Future<XFile?> getGalleryImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.camera);
    return image;
  }

  Future<UploadTask> upload(String path) async {
    File file = File(path);
    try {
      String ref = 'chamados/images/img-${DateTime.now().toString()}.jpg';
      var imageUrl = storage.ref(ref).putFile(file);
      return Future.value(imageUrl);
    } on FirebaseException catch (e) {
      throw Exception('Erro no upload $e.code');
    }
  }

  pickAndUploadImage() async {
    XFile? file = await getGalleryImage();
    if (file != null) {
      UploadTask task = await upload(file.path);

      task.snapshotEvents.listen(
        (TaskSnapshot snapshot) async {
          if (snapshot.state == TaskState.running) {
            setState(() {
              uploading = true;
              total = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
            });
          } else if (snapshot.state == TaskState.success) {
            arquivos.add(await snapshot.ref.getDownloadURL());
            refs.add(snapshot.ref);
            setState(() => uploading = false);
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: pickAndUploadImage(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text(
              'Selecione uma Foto',
              style: TextStyle(
                fontWeight: semiBold,
                fontSize: 16,
                color: white,
              ),
            ),
            Icon(Icons.attach_file_rounded),
          ],
        ),
      ),
    );
  }
}

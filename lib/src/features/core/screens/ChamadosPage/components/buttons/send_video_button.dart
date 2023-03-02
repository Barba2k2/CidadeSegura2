import 'package:flutter/material.dart';
import '../../../../../../constants/colors_constants.dart';
import '../../../../../../constants/text_strings.dart';
import '../../chamados_page.dart';

class EnviarVideo extends StatelessWidget {
  const EnviarVideo({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChamadosPage(),
              ),
            );
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text(
              tSendVideo,
              style:
                  TextStyle(fontWeight: semiBold, fontSize: 16, color: white),
            ),
            SizedBox(width: 10),
            Icon(Icons.video_call_sharp),
          ],
        ),
      ),
    );
  }
}

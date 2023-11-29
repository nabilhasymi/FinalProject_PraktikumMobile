import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Camera extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CameraState();
  }
}

class _CameraState extends State<Camera> {
  final ImagePicker _picker = ImagePicker();

  Future<String?> getImage(bool isCamera) async {
    final XFile? image;
    if (isCamera) {
      image = await _picker.pickImage(source: ImageSource.camera);
    } else {
      image = await _picker.pickImage(source: ImageSource.gallery);
    }
    return image?.path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF800000),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardButton(
              onPressed: () async {
                String? imagePath = await getImage(false);
                if (imagePath != null) {
                  Navigator.pop(context, imagePath);
                }
              },
              icon: Icons.image,
              text: 'Choose from gallery',
            ),
            SizedBox(height: 20),
            CardButton(
              onPressed: () async {
                String? imagePath = await getImage(true);
                if (imagePath != null) {
                  Navigator.pop(context, imagePath);
                }
              },
              icon: Icons.camera_alt,
              text: 'Take with camera',
            ),
          ],
        ),
      ),
    );
  }
}

class CardButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? icon;
  final String? text;

  const CardButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // Set your desired width
      height: 60, // Set your desired height
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(0.5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 20),
                SizedBox(height: 3),
                Text(
                  text!,
                  style: TextStyle(
                    color: Colors.grey[850],
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

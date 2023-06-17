import 'package:flutter/material.dart';
import 'package:resala/core/utils/app_constance.dart';
import '../../../../../core/utils/assets_manager.dart';
import 'profile_update_alert_widgets/profile_update_widget_alert.dart';

class ProfileWidgetImageTitle extends StatelessWidget {
  const ProfileWidgetImageTitle(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.funChangeImage,
      required this.funChangeTitle})
      : super(key: key);
  final String imageUrl;
  final String title;
  final Function() funChangeImage;
  final Function(String value) funChangeTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 28),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(150),
              bottomRight: Radius.circular(150)),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0XFF662C47), Color(0XFFCB5D50)])),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 1 / 2.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                if (imageUrl.isEmpty || imageUrl == AppConstance.baseUrl) {
                  funChangeImage();
                }
              },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(
                    left: 45, right: 45, top: 35, bottom: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white),
                child: imageUrl.isEmpty || imageUrl == AppConstance.baseUrl
                    ? const Icon(Icons.cloud_upload_outlined,
                        color: Colors.black, size: 60)
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),
          ),
          Text(title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: FontAssets.arabicSmoothFont)),
          IconButton(
              onPressed: () async {
                await showDialog(
                    context: context,
                    builder: (context) => ProfileUpdateWidgetAlert(
                        updateFunList: (val){},
                        isName: true,
                        isBrunch: false,
                        isList: false,
                        updateFunSingle: funChangeTitle,
                        hintText: title));
              },
              icon: const Icon(Icons.draw, color: Colors.white, size: 24)),
        ],
      ),
    );
  }
}

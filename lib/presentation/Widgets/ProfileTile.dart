import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  ProfileTile({
    super.key,
    
    required this.icon,
    required this.onTap,
    required this.title,
  });

  Function() onTap;
  IconData icon;
  String title;
 

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ListTile(
      onTap: onTap,
      leading: Container(
        width: width / 9,
        height: width / 9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromRGBO(145, 104, 58, 1),
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: width / 18,
        ),
      ),
      trailing: 
           Container(
              width: width / 11,
              height: width / 11,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color.fromRGBO(145, 104, 58, 1),
              ),
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            )
          ,
    );
  }
}

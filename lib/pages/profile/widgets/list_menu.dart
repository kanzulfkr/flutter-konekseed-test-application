import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListMenu extends StatelessWidget {
  const ListMenu({
    super.key,
    required this.iconName,
    required this.name,
    required this.description,
    required this.onTap,
  });
  final IconData iconName;
  final String name;
  final String description;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: const Color.fromRGBO(240, 240, 248, 1),
              child: Icon(
                iconName,
                color: const Color.fromARGB(255, 34, 92, 208),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              width: 200,
              margin: const EdgeInsets.only(right: 28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                  ),
                  Text(
                    description,
                    style: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(150, 152, 156, 1),
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 24,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Color.fromRGBO(150, 152, 156, 1),
              ),
            )
          ],
        ),
      ),
    );
  }
}

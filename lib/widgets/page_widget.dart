import 'package:flutter/material.dart';

class PageWidget extends StatelessWidget {
  final String text;
  final Color color;
  final String tag; // Tag for Hero animation

  const PageWidget(this.text, this.color, this.tag);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        // Hero animation with additional effects
        child: Hero(
          tag: tag, // Unique tag for each page
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

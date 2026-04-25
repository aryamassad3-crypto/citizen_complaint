import 'package:flutter/material.dart';

class ComplaintsScreen extends StatelessWidget {
  // دالة مساعدة للـ Popup
  void _showPopup(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('موافق'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xffd0dad9),
      appBar: AppBar(
        title: Text(
          'ادارة الشكاوى',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 23, 105, 26),
        actions: [
          // زر + (POST)
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () {
              _showPopup(context, 'POST', 'تم تنفيذ طلب POST (إضافة بيانات)');
            },
            tooltip: 'POST',
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 7,
        itemBuilder: (context, index) {
          final int itemNumber = index + 1;

          return Card(
            color: Color(0xfff5f5f5),
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'شكوى رقم $itemNumber',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color:Color.fromARGB(255, 23, 105, 26),),
                  ),
                  Row(
                    children: [
                      // زر EDIT (أيقونة فقط)
                      IconButton(
                        icon: Icon(Icons.edit, color:const Color.fromARGB(118, 0, 0, 0), size: 22),
                        onPressed: () {
                          _showPopup(context, 'EDIT', 'تم تعديل الشكوى رقم $itemNumber');
                        },
                        tooltip: 'EDIT',
                      ),
                      const SizedBox(width: 8),
                      // زر DELETE (أيقونة فقط)
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red[700], size: 22),
                        onPressed: () {
                          _showPopup(context, 'DELETE', 'تم حذف الشكوى رقم $itemNumber');
                        },
                        tooltip: 'DELETE',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
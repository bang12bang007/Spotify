// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:my_restaurant/model/expand.dart';

// class bottom_Page extends StatefulWidget {
//   const bottom_Page({super.key, required this.onAdd});
//   final void Function(Expand expand) onAdd;
//   @override
//   State<bottom_Page> createState() => _Bottom_State();
// }

// class _Bottom_State extends State<bottom_Page> {
//   final _titleController = TextEditingController();
//   final _priceController = TextEditingController();
//   final _dateController = TextEditingController();
//   Category _isSelectDrop = Category.food;
//   @override
//   void dispose() {
//     _titleController.dispose();
//     _priceController.dispose();
//     _dateController.dispose();
//     super.dispose();
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     DateTime? pickerDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );
//     if (pickerDate != null) {
//       setState(() {
//         _dateController.text = format(pickerDate);
//       });
//     }
//   }

//   void _submitDataButton() {
//     final priceData = double.tryParse(_priceController.text);
//     if (_titleController.text.trim().isEmpty ||
//         priceData == null ||
//         _dateController.text.trim().isEmpty) {
//       showDialog(
//         context: context,
//         builder: (ctx) => AlertDialog(
//           title: const Text("Erorr"),
//           content: const Text("Vui long nhap du lieu"),
//           actions: [
//             TextButton(
//                 onPressed: () {
//                   Navigator.pop(ctx);
//                 },
//                 child: const Text("Oke"))
//           ],
//         ),
//       );
//     } else {
//       try {
//         final parsedDate = DateFormat('dd-MM-yyyy').parse(_dateController.text);
//         widget.onAdd(Expand(
//             title: _titleController.text,
//             amount: priceData,
//             time: parsedDate,
//             category: _isSelectDrop));
//         Navigator.pop(context);
//       } catch (erorr) {
//         showDialog(
//           context: context,
//           builder: (ctx) => AlertDialog(
//             title: const Text("Error"),
//             content: const Text("Ngày tháng không hợp lệ"),
//             actions: [
//               TextButton(
//                   onPressed: () {
//                     Navigator.pop(ctx);
//                   },
//                   child: const Text("OK"))
//             ],
//           ),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         children: [
//           TextField(
//             controller: _titleController,
//             maxLength: 40,
//             decoration: const InputDecoration(label: Text("Title")),
//           ),
//           TextField(
//             controller: _priceController,
//             keyboardType: TextInputType.number,
//             decoration:
//                 const InputDecoration(label: Text("Price"), prefixText: '\$'),
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           Row(
//             children: [
//               Expanded(
//                 child: TextField(
//                   controller: _dateController,
//                   maxLength: 30,
//                   decoration: const InputDecoration(
//                     label: Text("Date Time"),
//                   ),
//                 ),
//               ),
//               IconButton(
//                 onPressed: () {
//                   _selectDate(context);
//                 },
//                 icon: const Icon(Icons.calendar_month),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               DropdownButton(
//                   value: _isSelectDrop,
//                   items: Category.values
//                       .map(
//                         (category) => DropdownMenuItem(
//                           value: category,
//                           child: Text(category.name.toString().toUpperCase()),
//                         ),
//                       )
//                       .toList(),
//                   onChanged: (values) {
//                     setState(() {
//                       if (values == null) {
//                         return;
//                       } else {
//                         _isSelectDrop = values;
//                       }
//                     });
//                   }),
//               ElevatedButton(
//                 onPressed: _submitDataButton,
//                 child: const Text("Save"),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: const Text("Cancel"),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

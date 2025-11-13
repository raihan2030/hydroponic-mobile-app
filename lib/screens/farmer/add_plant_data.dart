import 'package:flutter/material.dart';
import 'package:hydroponics_app/theme/app_colors.dart';
import 'package:hydroponics_app/widgets/styled_date_picker_field.dart';
import 'package:hydroponics_app/widgets/styled_elevated_button.dart';

class AddPlantData extends StatefulWidget{
  const AddPlantData({super.key});

  @override
  State<AddPlantData> createState() => _AddPlantDataState();
}

class _AddPlantDataState extends State<AddPlantData>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          icon: Icon(Icons.arrow_back)
        ),
        title: const Text('Tambah Data Tanaman', style: TextStyle(fontWeight: FontWeight.bold),),
        titleSpacing: 10,
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primary,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Jumlah bibit:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
              _gap(10),
              TextFormField(
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silakan masukkan jumlah bibit yang Anda tanam';
                  }
                  return null;
                },
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Masukkan jumlah bibit',
                  filled: true,
                  fillColor: Color.fromARGB(255, 236, 236, 236),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
              ),
              _gap(15),
              Text('Tanggal Tanam:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
              _gap(10),
              StyledDatePickerField(),
              _gap(20),
              StyledElevatedButton(
                text: 'Tambah Data', 
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    /// do something
                  }
                },
                foregroundColor: Colors.white,
                backgroundColor: AppColors.primary,
              )
            ]
          ),
        ),
      )
    );
  }

  Widget _gap(double height){
    return SizedBox(height: height,);
  }
}
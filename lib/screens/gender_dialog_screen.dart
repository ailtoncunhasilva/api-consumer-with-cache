import 'package:flutter/material.dart';
import 'package:gs_challenge/components/dropdown_gender.dart';
import 'package:provider/provider.dart';

class GenderDialogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 2,
          right: 2,
          top: 6,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selecione o gênero',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 14),
                    child: Consumer<DropdownGender>(
                      builder: (_, dropdownGender, __) {
                        return DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            //labelText: 'Filtrar por gênero:',
                            hintText: 'Filtrar por gênero:',
                          ),
                          items: dropdownGender.genderList,
                          value: dropdownGender.itemSelected,
                          onChanged: (value1) {
                            dropdownGender.itemSelected = value1;
                          },
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 45,
                      width: double.maxFinite,
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text('Filtrar'),
                        onPressed: () {
                          Navigator.of(context)
                              .pop(context.read<DropdownGender>().itemSelected);// return item selected of the dropdown list
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

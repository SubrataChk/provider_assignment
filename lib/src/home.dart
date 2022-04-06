import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_assignment/src/list.dart';
import 'package:provider_assignment/src/provider/provider.dart';
import 'package:provider_assignment/src/widget/button.dart';
import 'package:provider_assignment/src/widget/textfield.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    DataProvider dataPro = Provider.of<DataProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xffEEEEEE),
      appBar: AppBar(
        backgroundColor: Color(0xff39AEA9),
        elevation: 0,
        title: Text(
          "Provider Assignment",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
        ),
        actions: [
          // Icon(
          // Icons.countertops,
          // color: Colors.black,
          // )
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 2.h,
          ),
          CustomTextField(
            hintText: "Name",
            controller: name,
          ),
          CustomTextField(
            hintText: "Email",
            controller: email,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  title: "Add",
                  onTap: () {
                    dataPro.addData(name.text, email.text);
                  },
                ),
                CustomButton(
                  title: "List",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ListData()));
                  },
                ),
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: ListView.builder(
                itemCount: dataPro.data.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Consumer<DataProvider>(
                          builder: (context, dataPro, child) {
                        return ListTile(
                          leading: Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 8.w,
                          ),
                          title: Text(
                            "${dataPro.data[index].name}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          subtitle: Text("${dataPro.data[index].email}"),
                          trailing: IconButton(
                              onPressed: () {
                                dataPro.deleteData(index);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 8.w,
                              )),
                        );
                      }),
                    ),
                  );
                }),
          ))
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_assignment/src/provider/provider.dart';
import 'package:sizer/sizer.dart';

class ListData extends StatelessWidget {
  const ListData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataProvider dataPro = Provider.of<DataProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xffEEEEEE),
      appBar: AppBar(
        backgroundColor: Color(0xffEEEEEE),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 7.w,
            )),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: ListView.builder(
                  itemCount: context.watch<DataProvider>().data.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: ListTile(
                          leading: Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 8.w,
                          ),
                          title: Text(
                            "${context.watch<DataProvider>().data[index].name}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          subtitle: Text(
                              "${context.watch<DataProvider>().data[index].email}"),
                          trailing: IconButton(
                              onPressed: () {
                                dataPro.deleteData(index);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 8.w,
                              )),
                        ),
                      ),
                    );
                  }),
            )),
          ],
        ),
      ),
    );
  }
}

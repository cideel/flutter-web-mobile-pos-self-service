import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posweb/Config/theme.dart';
import 'package:posweb/Presentation/Controller/AddOrderPopUp/popupController.dart';

class History extends StatelessWidget {
  final HistoryTitle historyTitle = Get.put(HistoryTitle());
  final OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    // Fetch order history when the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print("OrderController is not null, fetching order history...");
      orderController.fetchOrderHistory();
    });

    return SafeArea(
      child: ScreenUtilInit(
        designSize: Size(375, 854),
        builder: (context, child) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                Get.back(); // Kembali ke halaman sebelumnya
              },
              icon: Icon(Icons.arrow_back_ios_new),
            ),
            centerTitle: true,
            toolbarHeight: 126.h,
            title: Container(
              color: Colors.white, // Background color for the title
              child: Obx(() {
                return Text(
                  historyTitle.title.value,
                  style: GoogleFonts.roboto(
                    color: AppColor.primary,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0, // Remove shadow
            flexibleSpace: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          body: Obx(() {
            if (orderController.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (orderController.orders.isEmpty) {
              return Center(
                child: Text("No orders found"),
              );
            } else {
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                itemCount: orderController.orders.length,
                itemBuilder: (context, index) {
                  final order = orderController.orders[index];
                  print("Order: $order");
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: Column(
                      children: [
                        SizedBox(height: 20.h,),
                        Container(
                          width: 335.w,
                          height: 70.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    order['order_date'] ?? '', // Tampilkan tanggal pesanan
                                    style: GoogleFonts.montserrat(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    "Meja : ${order['table_number'] ?? ''}", // Tampilkan nomor meja
                                    style: GoogleFonts.montserrat(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "No Pesanan : ${order['id'] ?? ''}", // Tampilkan nomor pesanan
                                    style: GoogleFonts.montserrat(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(
                                    order['payment_status'] ?? '', // Tampilkan status pembayaran
                                    textAlign: TextAlign.justify,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 19.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Total Harga :",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Image.asset(
                                        "assets/icon-money.png",
                                        width: 12.w,
                                        height: 12.h,
                                      ),
                                      SizedBox(width: 5.w,),
                                      Text(
                                        overflow: TextOverflow.ellipsis,
                                        order['total_price']?.toString() ?? '', // Tampilkan total harga
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          )),
                        Divider()
                      ],
                    ),
                  );
                },
              );
            }
          }),
        ),
      ),
    );
  }
}

class HistoryTitle extends GetxController {
  var title = "Riwayat".obs;
}




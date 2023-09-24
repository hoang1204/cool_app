import 'package:brandshop/home/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemView extends StatefulWidget {
  const ItemView({super.key, required this.item});

  final Product item;
  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      padding: EdgeInsets.only(top: 16, right: 16, bottom: 32, left: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Hiển thị hình ảnh sản phẩm
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Row(
              children: [
                Image.network(
                  widget.item.productImage!,
                  height: 200,
                  width: 200,
                ),
                SizedBox(width: 8.0),
                // Hiển thị mô tả sản phẩm
                Flexible(
                  child: Text(
                    widget.item.productDescription ?? "",
                    maxLines: 8,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),

          SizedBox(height: 16.0),
          // Hiển thị tên sản phẩm
          Text(
            widget.item.productName ?? "",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          // Nút thêm vào giỏ hàng
          ElevatedButton(
            onPressed: () {
              // Xử lý khi người dùng nhấn nút thêm vào giỏ hàng
              Get.back(); // Đóng Bottom Sheet
              // Thêm sản phẩm vào giỏ hàng ở đây
            },
            child: Text('Thêm vào giỏ hàng'),
          ),
        ],
      ),
    );
  }
}

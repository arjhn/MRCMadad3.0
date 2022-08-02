import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerNewsTile extends StatefulWidget {
  const ShimmerNewsTile({Key? key}) : super(key: key);

  @override
  _ShimmerNewsTileState createState() => _ShimmerNewsTileState();
}

class _ShimmerNewsTileState extends State<ShimmerNewsTile> {

  late Size size;

  @override
  Widget build(BuildContext context) {

    size=MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width*0.95,
        height: 266,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildImageShimmer(),
            buildTextShimmer(),
            buildFooterShimmer()
          ],
        ),
      ),
    );
  }

  Widget buildImageShimmer(){
    return Shimmer.fromColors(
        child: Container(
          height: 181,
          width: size.width*0.95,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5)
              ),
              color: Colors.grey[400]!
          ),
        ),
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[200]!
    );
  }

  Widget buildTextShimmer(){
    return Shimmer.fromColors(
        child: Container(
          height: 64,
          width: size.width*0.95,
          decoration: BoxDecoration(
              color: Colors.grey[400]!
          ),
        ),
        baseColor: Colors.grey[400]!,
        highlightColor: Colors.grey[300]!
    );
  }

  Widget buildFooterShimmer(){
    return Shimmer.fromColors(
        child: Container(
          height: 21,
          width: size.width*0.95,
          decoration: BoxDecoration(
              color: Colors.grey[400]!
          ),
        ),
        baseColor: Colors.grey[500]!,
        highlightColor: Colors.grey[400]!
    );
  }

}

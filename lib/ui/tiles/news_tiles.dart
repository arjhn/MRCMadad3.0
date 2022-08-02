import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mrc_madad_3/router/swipe_navigation.dart';
import 'package:mrc_madad_3/ui/home_screen/web_view.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

class NewsCardTile extends StatefulWidget {

  final String imageURL;
  final String title;
  final String publisher;
  final String postURL;
  final String description;
  final String dateString;
  final String language;

  const NewsCardTile({
    Key? key,
    required this.imageURL,
    required this.title,
    required this.publisher,
    required this.postURL,
    required this.description,
    required this.dateString,
    required this.language
  }) : super(key: key);

  @override
  _NewsCardTileState createState() => _NewsCardTileState();
}

class _NewsCardTileState extends State<NewsCardTile> {

  late Size size;

  @override
  Widget build(BuildContext context) {

    size=MediaQuery.of(context).size;

    return GestureDetector(
      onTap: (){
        Navigator.push(context, CustomPageRouteBuilder(child: NewsWebView(title: widget.title, newsURL: widget.postURL)));
      },
      child: Container(
        width: size.width,
        height: 275,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(6),topRight: Radius.circular(6))
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildImageComponent(), // displays the image
            buildTileDescription(), // displays the news description and it is not curtailed
            buildTileFooter(),// displays general details like share and stuuff
          ],
        ),
      ),
    );
  }

  Widget buildImageComponent(){
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 181,
        maxWidth: size.width
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5)
        ),
        child: CachedNetworkImage(
          imageUrl: widget.imageURL,
          placeholder: (context,url) {
            return Shimmer.fromColors(
                child: Container(
                  height: 181,
                  width:size.width,
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
          },
          errorWidget: (context,url,error)=>new Icon(Icons.error),
          fadeOutDuration: new Duration(seconds: 1),
          fadeInDuration: new Duration(seconds: 1),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  Widget buildTileDescription(){
    return Container(
      height: 64,
        width:size.width,
        padding: const EdgeInsets.all(2),
        child:Text(widget.title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Brandon Grotesque',
            fontSize: 20
          ),)
    );
  }

  Widget buildTileFooter(){
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: size.width
      ),
      child: Container(
        height: 30,
        width:size.width,
        color: Color.fromRGBO(220, 216, 216, 0.6),
        child: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 10,),
              Text(
                widget.publisher,
                style: TextStyle(
                  fontFamily: 'Zen Tokyo Zoo',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              Expanded(child: SizedBox()),
              IconButton(
                padding: EdgeInsets.symmetric(horizontal: 2),
                  onPressed: (){
                    Share.share(widget.postURL);
                  },
                  icon: Icon(Icons.share,size: 20,)
              ),
              Icon(Icons.history,size: 20),
              Text('25m')
            ],
          ),
        ),
      ),
    );
  }
}

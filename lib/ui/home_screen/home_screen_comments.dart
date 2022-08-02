//-------------------------------CustomSliver Appbar + code-------------------------------------------------------------------------------------------------

/**
    CustomScrollView(
    slivers: <Widget>[
    buildSliverAppBar(context, refOfProviderLocale),
    SliverList(
    delegate: (refOfProviderNews.enumNewsFetch==EnumNewsFetch.Complete)?
    buildNewsCardList(refOfProviderNews, refOfProviderLocale,context):
    buildShimmerCardList(context)
    )
    ],
    );

SliverChildListDelegate buildShimmerCardList(BuildContext context) {
  return SliverChildListDelegate([
    ListView.builder(
      itemBuilder: (context,int index){
        return ShimmerNewsTile();
      },
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 5,
    )
  ]);
}

SliverChildBuilderDelegate buildNewsCardList(ProviderNews refOfProviderNews, ProviderLocale refOfProviderLocale,BuildContext context) {
  return SliverChildBuilderDelegate(
          (context,int index){
        print('Image URL ${refOfProviderNews.newByLanguage['en']![index].imageURL}');
        //refOfProviderLocale.appLocale.toString()
        return NewsCardTile(
            imageURL: refOfProviderNews.newByLanguage['en']![index].imageURL ?? '',
            title: refOfProviderNews.newByLanguage['en']![index].title ?? '',
            description: refOfProviderNews.newByLanguage['en']![index].description ?? '',
            postURL: refOfProviderNews.newByLanguage['en']![index].url ?? '',
            dateString: refOfProviderNews.newByLanguage['en']![index].dateString ?? '',
            publisher: refOfProviderNews.newByLanguage['en']![index].publisher ?? '',
            language: refOfProviderNews.newByLanguage['en']![index].language ?? '');
      },
      childCount: refOfProviderNews.newByLanguage['en']!.length
    //(refOfProviderNews.newByLanguage['en']!.length != null)?refOfProviderNews.newByLanguage['en']!.length:0
  );
}

SliverAppBar buildSliverAppBar(BuildContext context, ProviderLocale refOfProviderLocale) {
  return SliverAppBar(
    toolbarHeight: 53,
    backgroundColor: Colors.white,
    floating: true,
    elevation: 2,
    leading: IconButton(
      onPressed: (){

      },
      icon: Icon(Icons.menu,color: Colors.black.withOpacity(0.6),),
    ),
    title: Text(AppLocalizations.of(context)?.homeAppBarHeading ?? 'Home',
        style: TextStyleAppBar().StyleOfAppBar['en']
    ),
    actions: [
      IconButton(
          onPressed: (){

          },
          icon: Icon(Icons.notifications,color: Colors.black.withOpacity(0.6),)
      ),
      IconButton(
          onPressed: (){

          },
          icon: Icon(Icons.settings_suggest,color: Colors.black.withOpacity(0.6),)
      )
    ],
  );
}
 */

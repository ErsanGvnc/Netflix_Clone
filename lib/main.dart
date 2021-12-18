// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_element, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:netflix_clone/LanguageChangeProvider.dart';
import 'package:netflix_clone/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LanguageChangeProvider>(
      create: (context) => LanguageChangeProvider(),
      child: Builder(
        builder: (context) => MaterialApp(
          locale: Provider.of<LanguageChangeProvider>(context, listen: true)
              .currentLocale,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          home: AnaSayfa(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  String dropdownValue = 'Türkçe';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // void initState() {
    //   super.initState();
    //   controller = VideoPlayerController.network(
    //       "https://assets.nflxext.com/ffe/siteui/acquisition/ourStory/fuji/desktop/video-tv-0819.m4v");
    // }

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 150,
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: Image(
            fit: BoxFit.contain,
            image: AssetImage(
              'assets/images/netflix_logo1.png',
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Container(
                //   decoration:
                //       BoxDecoration(border: Border.all(color: Colors.white)),
                //   child: DropdownButton<String>(
                //     value: dropdownValue,
                //     icon: Icon(Icons.arrow_drop_down),
                //     iconSize: 24,
                //     elevation: 16,
                //     onChanged: (String? newValue) {
                //       setState(() {
                //         dropdownValue = newValue!;
                //       });
                //     },
                //     items: <String>['Türkçe', 'English']
                //         .map<DropdownMenuItem<String>>((String value) {
                //       return DropdownMenuItem<String>(
                //         value: value,
                //         child: Text(value),
                //       );
                //     }).toList(),
                //   ),
                // ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.transparent,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.language, color: Colors.white),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          S.of(context).turk,
                          //"Türkçe",
                          style: TextStyle(color: Colors.white),
                        ),
                        PopupMenuButton(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                          color: Colors.grey,
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              child: InkWell(
                                onTap: () {
                                  context
                                      .read<LanguageChangeProvider>()
                                      .changeLocale("tr");
                                },
                                child: Text(
                                  "Türkçe",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              value: 1,
                            ),
                            PopupMenuItem(
                              child: InkWell(
                                onTap: () {
                                  context
                                      .read<LanguageChangeProvider>()
                                      .changeLocale("en");
                                },
                                child: Text(
                                  "English",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              value: 2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                // Container(
                //   color: Colors.red,
                //   child: Text(
                //     "Oturum Aç",
                //     style: TextStyle(color: Colors.white),
                //   ),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     color: Colors.white,
                //   ),
                //   height: 10,
                // ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        S.of(context).ot,
                        //"Oturum Aç",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.redAccent[700],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: height / 1.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.srgbToLinearGamma(),
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/back.jpg',
                    ),
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 300),
                        child: Container(
                          //color: Colors.yellow,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                S.of(context).sin,
                                //"Sınırsız film, dizi ve çok \ndaha fazlası.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                ),
                              ),
                              Text(
                                S.of(context).ist,
                                //"İstediğiniz yerde izleyin. İstediğiniz zaman iptal edin.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                S.of(context).izl,
                                //"İzlemeye hazır mısınız? Üyelik oluşturmak veya üyeliğinize erişmek için e‑posta adresinizi girin.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 400,
                                    color: Colors.white,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        labelText: S.of(context).eps,
                                        fillColor: Colors.white,
                                        // border: OutlineInputBorder(
                                        //   borderSide: BorderSide(),
                                        // ),
                                      ),
                                    ),
                                  ),
                                  // Container(
                                  //   width: 100,
                                  //   height: 53,
                                  //   color: Colors.red,
                                  //   child: Center(
                                  //     child: Row(
                                  //       children: [
                                  //         // Text(
                                  //         //   "Başlayın",
                                  //         //   style: TextStyle(
                                  //         //       color: Colors.white,
                                  //         //       fontWeight: FontWeight.bold),
                                  //         // ),
                                  //         // Icon(Icons.arrow_forward_ios),
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      //width: 100,
                                      height: 50,
                                      color: Colors.redAccent[700],
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            S.of(context).bas,
                                            //"Başlayın",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey[900],
                thickness: 10,
              ),
              Container(
                color: Colors.transparent,
                width: double.infinity,
                height: height / 2.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        color: Colors.black,
                        width: width / 3,
                        //height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              S.of(context).tel,
                              //"Televizyonunuzda \nizleyebilirsiniz.",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              S.of(context).akl,
                              //"Akıllı TV, PlayStation, Xbox, Chromecast, Apple TV, Blu-ray oynatıcılar ve daha fazlasında seyredin.",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        width: width / 3,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                            colorFilter: ColorFilter.srgbToLinearGamma(),
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/images/back.jpg',
                            ),
                          ),
                        ),
                        //child: VideoPlayerWidget(),
                        // child: VideoItems(
                        //   videoPlayerController: VideoPlayerController.network(
                        //       'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4'),
                        //   looping: false,
                        //   autoplay: false,
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey[900],
                thickness: 10,
              ),
              Container(
                color: Colors.transparent,
                width: double.infinity,
                height: height / 2.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        width: width / 3,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                            colorFilter: ColorFilter.srgbToLinearGamma(),
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/images/back.jpg',
                            ),
                          ),
                        ),
                        //child: VideoPlayerWidget(),
                        // child: VideoItems(
                        //   videoPlayerController: VideoPlayerController.network(
                        //       'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4'),
                        //   looping: false,
                        //   autoplay: false,
                        // ),
                      ),
                    ),
                    //buraya dokunma resimler değişince zaten tam oturacak
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        color: Colors.black,
                        width: width / 3,
                        //height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              S.of(context).cev,
                              //"Çevrimdışı izlemek için \niçerikleri indirin.",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              S.of(context).ens,
                              //"En sevdiğiniz içerikleri kolayca kaydedin ve her zaman izleyecek bir şeyleriniz olsun.",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey[900],
                thickness: 10,
              ),
              Container(
                color: Colors.transparent,
                width: double.infinity,
                height: height / 2.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        color: Colors.black,
                        width: width / 3,
                        //height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              S.of(context).yer,
                              //"İstediğiniz her yerde \nizleyin.",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              S.of(context).eks,
                              //"Ekstra ücret ödemeden telefonda, tablette, bilgisayarda, televizyonda sınırsız film ve dizi izleyin.",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        width: width / 3,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                            colorFilter: ColorFilter.srgbToLinearGamma(),
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/images/back.jpg',
                            ),
                          ),
                        ),
                        //child: VideoPlayerWidget(),
                        // child: VideoItems(
                        //   videoPlayerController: VideoPlayerController.network(
                        //       'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4'),
                        //   looping: false,
                        //   autoplay: false,
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey[900],
                thickness: 10,
              ),
              Container(
                color: Colors.transparent,
                width: double.infinity,
                height: height / 2.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        width: width / 3,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                            colorFilter: ColorFilter.srgbToLinearGamma(),
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/images/child.png',
                            ),
                          ),
                        ),
                        //child: VideoPlayerWidget(),
                        // child: VideoItems(
                        //   videoPlayerController: VideoPlayerController.network(
                        //       'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4'),
                        //   looping: false,
                        //   autoplay: false,
                        // ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        color: Colors.black,
                        width: width / 3,
                        //height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              S.of(context).coc,
                              //"Çocuklarınız için \nprofiller oluşturun.",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              S.of(context).uye,
                              //"Üyeliğinize dâhil olan bu ücretsiz deneyim sayesinde çocuklarınız, sadece onlara özel bir alanda en sevdikleri karakterlerle maceralara atılabilir.",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey[900],
                thickness: 10,
              ),
              SizedBox(height: 30),
              Text(
                S.of(context).sik,
                //"Sıkça Sorulan Sorular",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              SizedBox(height: 30),
              Container(
                color: Colors.transparent,
                width: 650,
                //height: 600,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        color: Colors.grey[800],
                        width: 650,
                        height: 70,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                S.of(context).s1,
                                //"Netflix nedir?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        color: Colors.grey[800],
                        width: 650,
                        height: 70,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                S.of(context).s2,
                                //"Netflix'in maliyeti nedir?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        color: Colors.grey[800],
                        width: 650,
                        height: 70,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                S.of(context).s3,
                                //"Nerede izleyebilirim?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        color: Colors.grey[800],
                        width: 650,
                        height: 70,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                S.of(context).s4,
                                //"Nasıl iptal ederim?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        color: Colors.grey[800],
                        width: 650,
                        height: 70,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                S.of(context).s5,
                                //"Netflix'de neler izleyebilirim?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        color: Colors.grey[800],
                        width: 650,
                        height: 70,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                S.of(context).s6,
                                //"Netflix çocuklar için uygun mudur?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 300),
                  child: Container(
                    //color: Colors.yellow,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          S.of(context).izl,
                          //"İzlemeye hazır mısınız? Üyelik oluşturmak veya üyeliğinize erişmek için e‑posta adresinizi girin.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 400,
                              color: Colors.white,
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                  labelText: S.of(context).eps,
                                  fillColor: Colors.white,
                                  // border: OutlineInputBorder(
                                  //   borderSide: BorderSide(),
                                  // ),
                                ),
                              ),
                            ),
                            // Container(
                            //   width: 100,
                            //   height: 53,
                            //   color: Colors.red,
                            //   child: Center(
                            //     child: Row(
                            //       children: [
                            //         // Text(
                            //         //   "Başlayın",
                            //         //   style: TextStyle(
                            //         //       color: Colors.white,
                            //         //       fontWeight: FontWeight.bold),
                            //         // ),
                            //         // Icon(Icons.arrow_forward_ios),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                //width: 100,
                                height: 50,
                                color: Colors.redAccent[700],
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      S.of(context).bas,
                                      //"Başlayın",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 80),
              Divider(
                color: Colors.grey[900],
                thickness: 10,
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                color: Colors.transparent,
                width: 650,
                //height: double.infinity,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).sor,
                      //"Sorularınız mı var? 0850-390-7444 numaralı telefonu arayın",
                      //textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      color: Colors.transparent,
                      width: double.infinity,
                      //height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.transparent,
                                height: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        S.of(context).a1,
                                        //"SSS",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        S.of(context).a2,
                                        //"Yatırımcı İlişkileri",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        S.of(context).a3,
                                        //"Kullanım Koşulları",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        S.of(context).a4,
                                        //"Bize Ulaşın",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.transparent,
                                height: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        S.of(context).b1,
                                        //"Yardım Merkezi",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        S.of(context).b2,
                                        //"İş İmkanları",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        S.of(context).b3,
                                        //"Gizlilik",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        S.of(context).b4,
                                        //"Hız Testi",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.transparent,
                                height: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        S.of(context).c1,
                                        //"Hesap",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        S.of(context).c2,
                                        //"Hediye Kartı Kullan",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        S.of(context).c3,
                                        //"Çerez Tercihleri",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        S.of(context).c4,
                                        //"Yasal Hükümler",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.transparent,
                                height: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        S.of(context).d1,
                                        //"Medya Merkezi",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        S.of(context).d2,
                                        //"İzleme Yolları",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        S.of(context).d3,
                                        //"Kurumsal Bilgiler",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        S.of(context).d4,
                                        //"Sadece Netflix'te",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          Container(
                            width: 140,
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.transparent,
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(Icons.language, color: Colors.grey),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      S.of(context).turk,
                                      //"Türkçe",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    PopupMenuButton(
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.white,
                                      ),
                                      color: Colors.grey,
                                      itemBuilder: (context) => [
                                        PopupMenuItem(
                                          child: InkWell(
                                            onTap: () {
                                              context
                                                  .read<
                                                      LanguageChangeProvider>()
                                                  .changeLocale("tr");
                                            },
                                            child: Text(
                                              "Türkçe",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          value: 1,
                                        ),
                                        PopupMenuItem(
                                          child: InkWell(
                                            onTap: () {
                                              context
                                                  .read<
                                                      LanguageChangeProvider>()
                                                  .changeLocale("en");
                                            },
                                            child: Text(
                                              "English",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          value: 2,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            S.of(context).net,
                            //"Netflix Türkiye",
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

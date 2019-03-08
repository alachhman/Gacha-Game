import 'dart:math';

import 'package:flutter/material.dart';


class SummonScreenWidget extends StatelessWidget {
  SummonScreenWidget();
  final List<List<String>> bannerInfo = [
    ["https://c-3sux78kvnkay76x24mgskvkjogx2eiax78ykijtx2eius.g00.gamepedia.com/g00/3_c-3kdboay.mgskvkjog.ius_/c-3SUXKVNKAY76x24nzzvyx3ax2fx2fmgskvkjog.iax78ykijt.iusx2fkdboay_mgskvkjog_ktx2fjx2fjkx2fMging-Sex78g.vtmx3fbkx78youtx3d6i07g97gih20j65348643l3604g360j6x26o76i.sgx78qx3dosgmk_\$/\$/\$/\$/\$","Banner1"],
    ['https://c-3sux78kvnkay76x24mgskvkjogx2eiax78ykijtx2eius.g00.gamepedia.com/g00/3_c-3kdboay.mgskvkjog.ius_/c-3SUXKVNKAY76x24nzzvyx3ax2fx2fmgskvkjog.iax78ykijt.iusx2fkdboay_mgskvkjog_ktx2f4x2f4lx2fMging-Omtgiou.vtmx3fbkx78youtx3d44j985kli454jj2g20i594l2837h8l9gx26o76i.sgx78qx3dosgmk_\$/\$/\$/\$/\$',"Banner2"],
    ['https://c-3sux78kvnkay76x24mgskvkjogx2eiax78ykijtx2eius.g00.gamepedia.com/g00/3_c-3kdboay.mgskvkjog.ius_/c-3SUXKVNKAY76x24nzzvyx3ax2fx2fmgskvkjog.iax78ykijt.iusx2fkdboay_mgskvkjog_ktx2f4x2f4lx2fMging-Omtgiou.vtmx3fbkx78youtx3d44j985kli454jj2g20i594l2837h8l9gx26o76i.sgx78qx3dosgmk_\$/\$/\$/\$/\$',"Banner3"],
    ['https://c-3sux78kvnkay76x24mgskvkjogx2eiax78ykijtx2eius.g00.gamepedia.com/g00/3_c-3kdboay.mgskvkjog.ius_/c-3SUXKVNKAY76x24nzzvyx3ax2fx2fmgskvkjog.iax78ykijt.iusx2fkdboay_mgskvkjog_ktx2f4x2f4lx2fMging-Omtgiou.vtmx3fbkx78youtx3d44j985kli454jj2g20i594l2837h8l9gx26o76i.sgx78qx3dosgmk_\$/\$/\$/\$/\$',"Banner4"],
    ['https://c-3sux78kvnkay76x24mgskvkjogx2eiax78ykijtx2eius.g00.gamepedia.com/g00/3_c-3kdboay.mgskvkjog.ius_/c-3SUXKVNKAY76x24nzzvyx3ax2fx2fmgskvkjog.iax78ykijt.iusx2fkdboay_mgskvkjog_ktx2f4x2f4lx2fMging-Omtgiou.vtmx3fbkx78youtx3d44j985kli454jj2g20i594l2837h8l9gx26o76i.sgx78qx3dosgmk_\$/\$/\$/\$/\$',"Banner5"],
    ['https://c-3sux78kvnkay76x24mgskvkjogx2eiax78ykijtx2eius.g00.gamepedia.com/g00/3_c-3kdboay.mgskvkjog.ius_/c-3SUXKVNKAY76x24nzzvyx3ax2fx2fmgskvkjog.iax78ykijt.iusx2fkdboay_mgskvkjog_ktx2f4x2f4lx2fMging-Omtgiou.vtmx3fbkx78youtx3d44j985kli454jj2g20i594l2837h8l9gx26o76i.sgx78qx3dosgmk_\$/\$/\$/\$/\$',"Banner6"]
  ];
  final List<String> pool = ["assets/cherche.png","assets/chrom.png"];
  Widget build(BuildContext context) {
    return Scaffold(
      body: bannerList(),
    );
  }
  Widget bannerList(){
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: bannerInfo.length,
      itemBuilder:(context, position){
        return banner(context, position);
      },
    );
  }
  Card banner(BuildContext context, int position){
    double maxWidth = MediaQuery.of(context).size.width;
    return Card(
      margin: new EdgeInsets.all(5.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              InkWell(
                child: new FlatButton(
                  color: Colors.blue,
                  child: Text("More Info"),
                  splashColor: Colors.blue,
                ),
                onTap: (){
                  print("More Info " + position.toString() + " Tapped");
                  showDialog(
                    context: context,
                    child: Dialog(context, position)
                  );
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth * 0.9),
                child: Image.network(bannerInfo[position][0],
                fit: BoxFit.fill,
                )
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("Summon"),
                color: Theme.of(context).accentColor,
                onPressed: (){
                  print("Summon " + position.toString() +  " Pressed");
                  showDialog(
                    context: context,
                    child: gacharesults(),
                  );
                },
              )
            ],
          )
        ],
      ),
      elevation: 5,
      color: Colors.white,
    );
  }
  Card Dialog(BuildContext context, int position){
    return Card(
      elevation: 20,
      margin: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Divider(
            color: Colors.black,
            height: 10,
          ),
          Text(bannerInfo[position][1]),
        ],
      )
    );
  }
  Card gacharesults(){
    Random rand = new Random();
    //unit rarity is hardcoded for now, will be finalized and dependant on the unit in the future.
    int starCount = rand.nextInt(5);
    int result = rand.nextInt(pool.length);
    String obtained = pool[result];
    return Card(
      elevation: 20,
      margin: EdgeInsets.fromLTRB(70, 220, 70, 300),
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      child:
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/backgrounds/summonBackground.PNG"),
              fit: BoxFit.fill,
              alignment: Alignment.topCenter,
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("You've Obtained",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(obtained)
                  ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                ],
              ),
            ],
          ),
        )
    );
  }
}
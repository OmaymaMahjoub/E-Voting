import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voting_app_mobile/http/vote_http.dart';
import 'package:voting_app_mobile/pages/login.dart';

class Vote extends StatefulWidget {
  final String name = 'Omayma';
  final String surname = 'Mahjoub';
  final String hexValue = '';

  @override
  _VoteState createState() => _VoteState();
}

class _VoteState extends State<Vote> {
  int selectedCandidateIndex = -1;

  //VoteHttp voteHttp = new VoteHttp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(widget.name + " " + widget.surname),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
          leading: IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginStateless()), (Route<dynamic> route) => false);
              }),
          actions: [
            IconButton(
              icon: Icon(Icons.bar_chart),
              //onPressed: (){print('hello');},
              onPressed: () {
                _showAlertDialog(context, "Election results", 'Condidate 1');
                /*voteHttp.getElectionResults(widget.hexValue).then((response) {
                  if (response["status"] == "OK") {
                    String content = "";
                    for (int i = 0; i < response["candidates"].length; i++) {
                      content += response["candidates"][i] +
                          ": " +
                          response["voteCounts"][i] +
                          "\n";
                    }
                    _showAlertDialog(context, "Election results", content);
                  } else {
                    _showAlertDialog(
                        context, "Election results", 'Condidate 1');
                  }
                });*/
              },
            )
          ],
        ),
        /*floatingActionButton: FloatingActionButton(
          child: Icon(Icons.how_to_vote_sharp),
          onPressed: () {
            voteHttp.checkMyVote(widget.hexValue).then((response) {
              if (response["status"] == "OK") {
                _showAlertDialog(context, "Your Vote",
                    "You voted for: " + response["votedCandidate"]);
              } else {
                _showAlertDialog(context, "Your Vote", response["reason"]);
              }
            });
          },
        ),*/
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Text(
                  "Welcome to Elections!",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                ),
              ),
              Container(
                child: FutureBuilder<Map<String, dynamic>>(
                    //future: voteHttp.getCandidates(),
                    builder: (context, snapshot) {
                  //if (snapshot.hasData) {
                  List<String> candidates = [
                    'Condidate 1',
                    'Condidate 2',
                    'Condidate 3'
                  ];

                  /*for (var k in snapshot.data.keys) {
                      candidates.add(snapshot.data[k]);
                    }*/
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: candidates.length,
                      itemBuilder: (context, index) {
                        return Card(
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
                            elevation: 5,
                            margin: const EdgeInsets.fromLTRB(15, 30, 15, 0),
                            color: selectedCandidateIndex == index ? Colors.blue : Colors.red,
                            child: ListTile(
                              leading: Icon(Icons.person),
                              title: Text(
                                candidates[index],
                                style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: selectedCandidateIndex == index ? FontWeight.bold : FontWeight.normal),
                              ),
                              onTap: () {
                                setState(() {
                                  selectedCandidateIndex == index ? selectedCandidateIndex = -1 : selectedCandidateIndex = index;
                                });
                              },
                            ));
                      });
                  /*} else {
                    return Center();
                  }*/
                }),
              ),
              SizedBox(
                height: 5,
              ),
              MaterialButton(
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10)),
                height: 50,
                color: selectedCandidateIndex != -1 ? Colors.green : Colors.black12,
                child: Text(
                  'Vote',
                  style: TextStyle(color: Colors.black87, fontSize: 20.0),
                ),
                onPressed: () {
                  print('Select condidate');
                },
                /*onPressed: () {
                  if (selectedCandidateIndex != -1) {
                    voteHttp
                        .castVote(selectedCandidateIndex, widget.hexValue)
                        .then((response) {
                      if (response["status"] == "OK") {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          response["msg"],
                          style: TextStyle(fontSize: 20),
                        )));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          response["reason"],
                          style: TextStyle(fontSize: 20),
                        )));
                      }
                    });
                  }
                },*/
              ),
            ],
          ),
        ));
  }

  _showAlertDialog(BuildContext context, String title, String content) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              content: Text(
                content,
                style: TextStyle(fontSize: 20),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              actions: <Widget>[
                new MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: new Text(
                      "OK",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ))
              ]);
        });
  }
}

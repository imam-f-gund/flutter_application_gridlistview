import 'package:flutter/material.dart';
    import 'data.dart';
    
    void main() {
      runApp(MaterialApp(
        //hide debug banner
        debugShowCheckedModeBanner: false,
        title: "Switch Grid to List",
        home: MyApp(),
      ));
    }
    
    class MyApp extends StatefulWidget {
      const MyApp({Key? key}) : super(key: key);
    
      @override
      _MyAppState createState() => _MyAppState();
    }
    
    class _MyAppState extends State<MyApp> {
      var status = 0;
    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
              title: Text("App News"),
              actions: [
                IconButton(
                  //if 0 then display icon list if other than zero display icon grid
                  icon: status == 0 ? Icon(Icons.list) : Icon(Icons.grid_view),
                  tooltip: 'Open shopping cart',
                  onPressed: () {
                    //required to add state,
                    //setstate is used to change the state,
                    //when the status variable is changed, the whole page will be re-rendered automatically
                    setState(() {
                      if (status == 0) {
                        status = 1;
                      } else {
                        status = 0;
                      }
                    });
                  },
                ),
              ],
            ),
            // if status 0 then show lisview if status other than 0 show grid view
            body: status == 0
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.network(data[index]['image']),
                        title: Text(data[index]['title']),
                        subtitle: Text(data[index]['desc']),
                        trailing: Icon(Icons.bookmark),
                      );
                    },
                    itemCount: data.length,
                  )
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Card(
                          //add shadow
                          elevation: 5,
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          data[index]['image'],
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                              ListTile(
                                title: Text(data[index]['title']),
                                subtitle: Text(data[index]['desc']),
                                trailing: Icon(Icons.bookmark),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: data.length));
      }
    }

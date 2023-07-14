import 'package:flutter/material.dart';

class RequestWidget extends StatelessWidget {
  const RequestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      elevation: 25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // Container(
          //   margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          //   child: Column(
          //     mainAxisSize: MainAxisSize.min,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Container(
          //         padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
          //         color: Colors.red,
          //         child: const Text(
          //           "Very Urgent",
          //           style: TextStyle(color: Colors.white, fontSize: 15),
          //         ),
          //       ),
          //       Container(
          //         color: Colors.black87,
          //           padding: const EdgeInsets.all(5),
          //           child: const Text(
          //             "O+",
          //             style: TextStyle(color: Colors.white, fontSize: 35),
          //           )),
          //     ],
          //   ),
          // ),//previous try
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.20,
                  margin: const EdgeInsets.only(
                    left: 8,
                    top: 8,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  color: Colors.red,
                  child: const FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      "Urgent",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  color: Colors.black87,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 8, bottom: 5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  child: const Text(
                    "O+",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Saleem",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              Text(
                "18. Male. 9.5km. 9hr",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_downward_outlined))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gigqo_assignment/core/constants/colors.dart';
import 'package:gigqo_assignment/modules/main/models/track.dart';

class TrackItemWidget extends StatelessWidget {
  const TrackItemWidget({
    Key? key,

    required this.track,
    required this.press,
  }) : super(key: key);

  final Track track;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 2.0, bottom: 2.0, right: 8.0),
        child: Card(
          color: bodyColor,
          elevation: 0,
          child: Row(
            children: [
              Container(
                height: 80.0,
                width: 80.0,
                decoration:
                BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: primaryColor)
                  )
                ),
                child: Image.network(track.cover),
              ),
              Expanded(
                child: Container(
                  height: 80.0,
                  decoration:
                  BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1, color: primaryColor)
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                            children: [
                              TextSpan(
                                text: "Name: ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                              TextSpan(
                                  text: "${track.name}",
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                            children: [
                              TextSpan(
                                  text: "Artists: ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300)),
                              TextSpan(
                                  text: "${track.artists}",
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                            children: [
                              TextSpan(
                                  text: "Year: ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300)),
                              TextSpan(
                                  text: "${track.year}",
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
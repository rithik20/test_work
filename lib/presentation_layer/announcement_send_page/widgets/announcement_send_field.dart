import 'package:flutter/material.dart';

class SendAnnouncementToStudents extends StatelessWidget {
  const SendAnnouncementToStudents({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: MediaQuery.of(context).size.height / 5,
      decoration: const BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      child: Column(
        children: [
          Expanded(
            child: TextFormField(
              maxLines: null,
              decoration: const InputDecoration(
                hintText: "Enter Your Announcement Here",
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 12.0, right: 12.0),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(right: 10.0),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(5.0))
                  ),
                  child: Row(
                    children: [
                      IconButton(onPressed: (){}, icon: const Row(
                        children: [
                          Icon(Icons.attach_file),
                          Text("Attach File")
                        ],
                      )),
                    ],
                  )),
              Container(
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                    shape: BoxShape.circle
                  ),child: IconButton(onPressed: (){}, icon: const Icon(Icons.send, color: Colors.white,))),
            ],
          ),
        ],
      ),
    );
  }
}

class Button2 extends StatelessWidget {
  const Button2({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            maxLines: null,
            decoration: const InputDecoration(
              hintText: "Enter Your Announcement Here",
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 12.0, right: 12.0),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.attach_file)),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.purple,
                  shape: BoxShape.circle
                ),
                  child: IconButton(onPressed: (){}, icon: const Icon(Icons.send, color: Colors.white,))),
            ],
          ),
        ),
      ],
    );
  }
}


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mediocare/components/appointment_card.dart';
import 'package:mediocare/components/doctor_card.dart';
import 'package:mediocare/screens/doctor_details.dart';
import 'package:mediocare/utils/config.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> medCat = [
    {
      "icons": FontAwesomeIcons.userDoctor,
      "category": "General",
    },
    {
      "icons": FontAwesomeIcons.heartPulse,
      "category": "Cardiology",
    },
    {
      "icons": FontAwesomeIcons.lungs,
      "category": "Respirations",
    },
    {
      "icons": FontAwesomeIcons.hand,
      "category": "Dermatology",
    },
    {
      "icons": FontAwesomeIcons.personPregnant,
      "category": "Gynecology",
    },
    {
      "icons": FontAwesomeIcons.teeth,
      "category": "Dental",
    },
  ];
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Mohit',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                            'assets/mohit_image-removebg-preview-removebg-preview.jpg'),
                      ),
                    ),
                  ],
                ),
                Config.spaceSmall,
                const Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                SizedBox(
                  height: Config.heightSize * 0.07,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List<Widget>.generate(medCat.length, (index) {
                      return Card(
                        margin: EdgeInsets.only(right: 20),
                        color: Config.primaryColor,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FaIcon(medCat[index]['icons'],
                                  color: Colors.white),
                              SizedBox(width: 20),
                              Text(
                                medCat[index]['category'],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Config.spaceSmall,
                const Text(
                  'Appointment Today',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                AppointmentCard(),
                Config.spaceSmall,
                Text('Top Doctors',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Config.spaceSmall,
                Column(
                  children: List.generate(10, (index) {
                    return DoctorCard(
                      route: 'doc_details',
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

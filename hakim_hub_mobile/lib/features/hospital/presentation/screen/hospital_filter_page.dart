import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/core/utils/colors.dart';
import 'package:hakim_hub_mobile/core/utils/icons.dart';
import 'package:hakim_hub_mobile/core/utils/ui_converter.dart';

import '../../../../core/shared_widgets/formfield.dart';
import '../widgets/build_chips_widget.dart';

class HospitalDoctorFilterPage extends StatefulWidget {
  const HospitalDoctorFilterPage({Key? key}) : super(key: key);

  @override
  State<HospitalDoctorFilterPage> createState() =>
      _HospitalDoctorFilterPageState();
}

class _HospitalDoctorFilterPageState extends State<HospitalDoctorFilterPage> {
  bool isSwitched = false;
  int sliderValue = 10;
  List<String> chipList = [
    "Endocrinologists",
    "Emergency",
    "Allergist",
    "Nursing Home",
    "Oncologists",
  ];
  final Map<String, String> universityLogos = {
    'Addis Ababa University':
        '/home/fenet/Desktop/hakim_hub_mobile/hakim_hub_mobile/hakim_hub_mobile/assets/images/aau.png',
    'Harvard University': 'assets/images/email_icon.png',
    'Stanford University': 'assets/images/map.png',
    'University of Oxford': 'assets/images/doctor_image.png',
  };
  List<String> selectedList = [];
  String _selectedEducation = 'Addis Ababa University';

  List<String> _educationOptions = [
    'Addis Ababa University',
    'Harvard University',
    'Stanford University',
    'University of Oxford',
  ];
  void delete(String serviceName) {
    setState(() {
      selectedList.remove(serviceName);
    });
  }

  void add(String serviceName) {
    setState(() {
      selectedList.add(serviceName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: UIConverter.getComponentHeight(context, 35),
        left: UIConverter.getComponentWidth(context, 27),
        right: UIConverter.getComponentWidth(context, 27),
      ),
      decoration: const BoxDecoration(
        color: secondryTextColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: UIConverter.getComponentHeight(context, 650),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: cancel,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Text(
                  "Filter docters",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: titleTextColor,
                  ),
                ),
                GestureDetector(
                  child: check,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Open Now",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: UIConverter.getComponentWidth(context, 32),
                ),
                Material(
                  child: Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                    activeTrackColor: secondaryColor,
                    activeColor: primaryColor,
                    inactiveThumbColor: primaryColor,
                    inactiveTrackColor: secondryTextColor,
                    trackOutlineColor: MaterialStateColor.resolveWith(
                      (states) => primaryColor,
                    ),
                  ),
                )
              ],
            ),
            Text(
              "Education",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w200,
                color: primaryColor,
              ),
            ),
            Material(
              child: Theme(
                data: Theme.of(context).copyWith(
                  // Set the properties of the DropdownButtonThemeData object
                  textButtonTheme: TextButtonThemeData(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.grey.withOpacity(0.5);
                          }
                          return Colors.transparent;
                        },
                      ),
                    ),
                  ),
                ),
                child: DropdownButton<String>(
                  value: _selectedEducation,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedEducation = newValue!;
                    });
                  },
                  items: _educationOptions
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Row(
                        children: [
                          // Get the corresponding logo asset from the map
                          Image.asset(
                            universityLogos[value]!,
                            height: 20,
                            width: 20,
                          ),
                          SizedBox(width: 10),
                          Text(value),
                        ],
                      ),
                    );
                  }).toList(),
                  icon: null,
                ),
              ),
            ),
            SizedBox(
              height: UIConverter.getComponentHeight(context, 10),
            ),
            const Text(
              "Year of exprience",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w200,
                color: primaryColor,
              ),
            ),
            SizedBox(
              height: UIConverter.getComponentHeight(context, 5),
            ),
            Material(
              child: SliderTheme(
                data: const SliderThemeData(
                  activeTrackColor: primaryColor,
                  inactiveTrackColor: backgroundColor,
                  trackShape: RoundedRectSliderTrackShape(),
                  trackHeight: 4.0,
                  thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius: 10.0,
                    elevation: 5,
                  ),
                  thumbColor: secondaryColor,
                  overlayShape: RoundSliderOverlayShape(
                    overlayRadius: 20.0,
                  ),
                  tickMarkShape: RoundSliderTickMarkShape(),
                  activeTickMarkColor: primaryColor,
                  inactiveTickMarkColor: backgroundColor,
                  valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                  valueIndicatorColor: primaryColor,
                  valueIndicatorTextStyle: TextStyle(
                    color: secondryTextColor,
                  ),
                ),
                child: SizedBox(
                  width: UIConverter.getComponentWidth(context, 376),
                  child: Slider(
                    value: sliderValue.toDouble(),
                    min: 1,
                    max: 50,
                    divisions: 50,
                    label: '${sliderValue.round()} years',
                    onChanged: (double value) {
                      setState(() {
                        sliderValue = value.round();
                      });
                    }, // add missing closing parenthesis here
                  ),
                ),
              ),
            ),
            SizedBox(
              height: UIConverter.getComponentHeight(context, 20),
            ),
            const Text(
              "speciality",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.normal,
                color: primaryColor,
              ),
            ),
            SizedBox(
              height: UIConverter.getComponentHeight(context, 20),
            ),
            Material(
              child: Wrap(
                spacing: 6.0,
                runSpacing: 6.0,
                children: chipList
                    .map((e) => BuildChip(
                          label: e,
                          onDeleted: (serviceName) => delete(serviceName),
                          onAdd: (serviceName) => add(serviceName),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hakim_hub_mobile/core/utils/colors.dart';
import 'package:hakim_hub_mobile/core/utils/ui_converter.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/bloc/image_bloc/image_bloc.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/bloc/image_bloc/image_event.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/bloc/image_bloc/image_state.dart';
import 'package:shimmer/shimmer.dart';

class DoctorCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  DoctorCard({required this.imageUrl, required this.title, required this.subtitle});

  @override
  _DoctorCardState createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  late ImageLoadBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: UIConverter.getComponentHeight(context, 5),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          buildCard(context, widget.title, widget.subtitle),
          Positioned(
            top: -UIConverter.getComponentHeight(context, 5),
            child: BlocProvider(
              create: (context) => _bloc,
              child: BlocBuilder<ImageLoadBloc, ImageLoadState>(
                builder: (context, state) {
                  if (state is ImageNotLoadedState || state is ImageLoadingState) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: CircleAvatar(
                        backgroundColor: shimmerColor,
                        radius: UIConverter.getComponentHeight(context, 83) / 2,
                      ),
                    );
                  } else {
                    return CircleAvatar(
                      backgroundColor: shimmerColor,
                      radius: UIConverter.getComponentHeight(context, 83) / 2,
                      backgroundImage: NetworkImage(widget.imageUrl),
                      onBackgroundImageError: (exception, stackTrace) {
                        AssetImage(widget.imageUrl);
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _bloc = ImageLoadBloc();
    ImageStream stream = NetworkImage(widget.imageUrl).resolve(ImageConfiguration.empty);
    stream.addListener(ImageStreamListener((info, synchronousCall) {
      _bloc.add(ImageLoaded());
    }));
  }
}

Widget buildCard(BuildContext context, String doctorName, String doctorSpecialization) {
  return Card(
    color: Colors.white,
    shadowColor: Colors.black,
    elevation: UIConverter.getComponentHeight(context, 8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(UIConverter.getComponentHeight(context, 20)),
    ),
    child: SizedBox(
      height: UIConverter.getComponentHeight(context, 150.69),
      width: UIConverter.getComponentWidth(context, 190.22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: UIConverter.getComponentHeight(context, 78),
          ),
          Text(
            doctorName,
            maxLines: 1,
            style: TextStyle(
              color: primaryTextColor,
              fontFamily: 'Poppins',
              fontSize: UIConverter.getComponentHeight(context, 17),
            ),
          ),
          Text(
            doctorSpecialization,
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              fontSize: UIConverter.getComponentHeight(context, 15),
            ),
          ),
        ],
      ),
    ),
  );
}
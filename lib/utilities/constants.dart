import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

const String name = "FanzVar";
const String assetImageBaseUrl = "assets/images/";
const String networkImageBaseUrl = "";
const String baseUrl = "https://fanzvar.inom-techs.com";
const String googleDriveBaseUrl =
    "https://drive.google.com/drive/folders/1D-YL7rOPzLMyLaw7JU4PCai6ETg5zsyF";
const String googleapiKey = "AIzaSyB6w26RG9WZC25CiAf2wdjYclSBY-4AB7Q";
final usersRef = FirebaseFirestore.instance.collection('users');
final String formattedNowDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
const String loremTxt =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    " Donec interdum metus eu tortor varius, vitae tristique ante vehicula. "
    "Donec consequat felis nec risus finibus, vitae pharetra lacus ultrices. "
    "Praesent ac quam ut ex tempor semper. Morbi fermentum cursus lorem, quis tincidunt eros "
    "luctus ac. Aliquam blandit pharetra pellentesque. Donec justo sapien, auctor "
    "pellentesque eros a, porta sodales metus. Suspendisse imperdiet felis a interdum finibus."
    " Etiam arcu elit, finibus a massa quis, luctus molestie leo. Donec imperdiet "
    "leo at libero euismod, et pulvinar enim accumsan. Proin quis felis et eros pulvinar rutrum. "
    "Cras porttitor urna sed ante egestas, nec vulputate dui vehicula.";

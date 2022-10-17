import 'package:flutter/material.dart';
import 'package:video_plyare/Screen/vidio.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Video Player",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),


        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [

              const SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height * 0.85,
                color: Colors.white,
                child:  ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: videos.length,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {

                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => VideoScreenPage(videos: videos[index],)

                          ),);
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 180,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                              ),
                              color: Colors.teal.withOpacity(0.25),
                              image: DecorationImage(
                                image: AssetImage(videos[index].image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 15),
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color:Colors.grey,

                            ),
                            alignment: Alignment.centerRight,
                            child: Center(
                              child: Text(
                                videos[index].categories,
                                style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
class Videos {
  final int id;
  final String categories;
  final String image;
  final String video;
  final String video2;

  Videos({
    required this.id,
    required this.categories,
    required this.image,
    required this.video,
    required this.video2,
  });
}

List<Videos> videos = [
  Videos(
    id: 1,
    categories: 'Animal',
    image: 'assets/images/animal.jpg',
    video: 'assets/images/animal1.mp4',
    video2: 'assets/images/animal2.mp4',
  ),
  Videos(
    id: 2,
    categories: 'Brids',
    image: 'assets/images/birds.jpg',
    video: 'assets/images/Bird vidio1.mp4',
    video2: 'assets/images/birdvidio2.mp4',

  ),
  Videos(
    id: 3,
    categories: 'Cars',
    image: 'assets/images/car.jpg',
    video: 'assets/images/Mercedes Glk - 1406.mp4',
    video2: 'assets/images/car.mp4',

  ),
  Videos(
    id: 4,
    categories: 'Lions',
    image: 'assets/images/lion.jpg',
    video: 'assets/images/lions.mp4',
    video2: 'assets/images/MSM1.mp4',

  ),
];
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
// ignore: must_be_immutable
class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  final List _steps = [
    {
      'title': 'Didihkan air dalam panci (sekitar 400-500 ml).',
      'check': Icons.check_box_outline_blank
    },
    {
      'title':
          'Sambil menunggu mi matang, siapkan bumbu di piring atau mangkuk.',
      'check': Icons.check_box_outline_blank
    },
    {
      'title':
          'Setelah mi matang, tiriskan air (untuk varian goreng) atau sisakan sedikit air (untuk varian kuah)',
      'check': Icons.check_box_outline_blank
    },
    {
      'title':
          'Campurkan mi dengan bumbu yang sudah disiapkan, aduk hingga merata.',
      'check': Icons.check_box_outline_blank
    },
    {
      'title': 'Sajikan Inomie dan nikmati!',
      'check': Icons.check_box_outline_blank
    },
  ];

  var _favoriteIcon = Icons.favorite_border_outlined;
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                // background infromation
                Container(
                  width: double.infinity,
                  height: screen.width * 1.27,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 240, 109, 53),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        child: Image.asset(
                          'assets/IndomieGorengAceh.jpg',
                          scale: 2,
                          fit: BoxFit.fitWidth,
                          width: double.infinity,
                          height: 300,
                        ),
                      ),
                      const SizedBox(height: 30),
                      // title
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Indomie',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      // description
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Indomie adalah mi instan populer yang dikenal dengan rasa lezat dan bumbu khas. Mudah disajikan dan menjadi favorit di berbagai negara sebagai hidangan cepat dan nikmat',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // rating & favorite
                Positioned(
                  top: 272,
                  left: 28,
                  child: SizedBox(
                    width: 360,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('4.7/5'),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18)),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (_favoriteIcon == Icons.favorite) {
                                  _favoriteIcon =
                                      Icons.favorite_border_outlined;
                                } else {
                                  _favoriteIcon = Icons.favorite;
                                }
                              });
                            },
                            icon: Icon(
                              _favoriteIcon,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // TO-DO
                Positioned(
                  top: 510,
                  left: 81,
                  child: Container(
                    width: 250,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Text(
                      'TO-DO',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 45),
            Expanded(
              child: ListView.builder(
                itemCount: _steps.length,
                itemBuilder: (context, index) => Container(
                  height: 100,
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: ListTile(
                    leading: Text(
                      '${index + 1}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    title: Text(
                      _steps[index]['title'],
                      style: const TextStyle(fontSize: 12),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          if (_steps[index]['check'] ==
                              Icons.check_box_outline_blank) {
                            _steps[index]['check'] = Icons.check_box;
                          } else {
                            _steps[index]['check'] =
                                Icons.check_box_outline_blank;
                          }
                        });
                      },
                      icon: Icon(
                        _steps[index]['check'],
                        color: Color.fromARGB(255, 159, 95, 22),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

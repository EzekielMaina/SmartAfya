import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'mental_health_screen.dart';
import 'cancer_screen.dart';
import 'diabetes_screen.dart';
import 'heart_disease_screen.dart';

class SpecializedScreen extends StatefulWidget {
  @override
  _SpecializedScreenState createState() => _SpecializedScreenState();
}

class _SpecializedScreenState extends State<SpecializedScreen> {
  List<String> _filteredDiseases = [];

  Widget searchResults() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search disease',
              border: InputBorder.none,
              icon: Icon(Icons.search),
            ),
            onChanged: (value) {
              setState(() {
                _filteredDiseases = searchDisease(value);
              });
            },
          ),
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _filteredDiseases.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.withOpacity(0.3),
                    width: 1.0,
                  ),
                ),
              ),
              child: ListTile(
                title: Text(
                  _filteredDiseases[index],
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  _showExercisesDialog(_filteredDiseases[index]);
                },
              ),
            );
          },
        ),
      ],
    );
  }

  List<String> searchDisease(String query) {
    List<String> results = [];
    if (query.isNotEmpty) {
      for (String disease in _diseaseList) {
        if (disease.toLowerCase().contains(query.toLowerCase())) {
          results.add(disease);
        }
      }
    }
    return results;
  }

  final List<Map<String, dynamic>> _specializedList = [
    {
      'title': 'Cancer',
      'image': 'assets/cancer.jpg',
      'description':
          'Cancer is a group of diseases involving abnormal cell growth with the potential to invade or spread to other parts of the body.',
      'screen': CancerScreen(),
    },
    {
      'title': 'Diabetes',
      'image': 'assets/diabetes.jpg',
      'description':
          'Diabetes is a metabolic disease that causes high blood sugar. The hormone insulin moves sugar from the blood into your cells to be stored or used for energy.',
      'screen': DiabetesScreen(),
    },
    {
      'title': 'Heart Disease',
      'image': 'assets/heart.jpg',
      'description':
          'Heart disease refers to a range of conditions that affect your heart. Diseases under the heart disease umbrella include blood vessel diseases, such as coronary artery disease.',
      'screen': HeartDiseaseScreen(),
    },
    {
      'title': 'Mental Health',
      'image': 'assets/mental.jpg',
      'description':
          'Mental health includes our emotional, psychological, and social well-being. It affects how we think,how we handle stress, feel, act , relate to others, and make choices.',
      'screen': MentalHealthScreen(),
    },
  ];
  List<String> _diseaseList = [
    'Asthma',
    'Malaria',
    'Tuberculosis',
    'HIV/AIDS',
    'Heart Disease',
    'Sickle Cell Anemia',
    'Yellow Fever',
    'Cholera',
    'Meningitis',
    'Cancer',
    'Hypertension',
    'Ebola Virus Disease',
    'Polio',
    'Diabetes',
    'Measles',
    'Typhoid Fever',
    'Pneumonia',
    'Leprosy',
    'Rabies',
    'Mental Health',
    // add more diseases here
  ];

  List<String> _cancerExercises = [
    'Walking',
    'Yoga',
    'Swimming',
    'Pilates',
    'Cycling',
    'Strength Training',
    'Dancing',
    'Tai Chi',
    'Rowing',
    'Kickboxing'
    // add more exercises here
  ];

  List<String> _diabetesExercises = [
    'Strength Training',
    'Aerobics',
    'Cycling',
    'Hiking',
    'Walking',
    'Pilates',
    'Yoga',
    'Swimming',
    'Dancing',
    'Rowing'
    // add more exercises here
  ];

  List<String> _heartDiseaseExercises = [
    'Brisk Walking',
    'Low-impact Aerobics',
    'Cycling',
    'Swimming',
    'Strength Training',
    'Dancing',
    'Yoga',
    'Pilates',
    'Tai Chi',
    'Water Aerobics'
    // add more exercises here
  ];

  List<String> _mentalHealthExercises = [
    'Meditation',
    'Deep Breathing',
    'Yoga',
    'Pilates',
    'Walking',
    'Jogging',
    'Hiking',
    'Swimming',
    'Dancing',
    'Boxing'
    // add more exercises here
  ];

  List<String> _hypertensionExercises = [
    'Brisk Walking',
    'Jogging',
    'Cycling',
    'Swimming',
    'Strength Training',
    'Yoga',
    'Tai Chi',
    'Pilates',
    'Rowing',
    'Aerobics'
    // add more exercises here
  ];

  List<String> _asthmaExercises = [
    'Yoga',
    'Pilates',
    'Walking',
    'Swimming',
    'Cycling',
    'Dancing',
    'Strength Training',
    'Water Aerobics',
    'Tai Chi',
    'Low-impact Aerobics'
    // add more exercises here
  ];

  List<String> _malariaExercises = [
    'Resting',
    'Light Exercise',
    'Walking',
    'Gentle Stretching',
    'Deep Breathing',
    'Yoga',
    'Pilates',
    'Tai Chi',
    'Swimming',
    'Cycling'
    // add more exercises here
  ];

  List<String> _tuberculosisExercises = [
    'Resting',
    'Deep Breathing',
    'Light Exercise',
    'Yoga',
    'Pilates',
    'Tai Chi',
    'Walking',
    'Gentle Stretching',
    'Cycling',
    'Swimming'
    // add more exercises here
  ];

  List<String> _hivAidsExercises = [
    'Walking',
    'Yoga',
    'Pilates',
    'Swimming',
    'Cycling',
    'Strength Training',
    'Dancing',
    'Tai Chi',
    'Aerobics',
    'Rowing'
// add more exercises here
  ];

  List<String> _sickleCellAnemiaExercises = [
    'Walking',
    'Jogging',
    'Swimming',
    'Cycling',
    'Dancing',
    'Aerobics',
    'Strength Training',
    'Pilates',
    'Yoga',
    'Tai Chi'
// add more exercises here
  ];

  List<String> _yellowFeverExercises = [
    'Resting',
    'Drinking Fluids',
    'Keeping Cool',
    'Avoiding Exertion',
    'Seeking Medical Care',
    'Watching for Complications',
    'Eating Healthy',
    'Getting Plenty of Rest',
    'Managing Symptoms',
    'Staying Hydrated'
// add more exercises here
  ];

  List<String> _choleraExercises = [
    'Drinking Plenty of Fluids',
    'Oral Rehydration Solution (ORS)',
    'Intravenous (IV) Fluids',
    'Antibiotics',
    'Zinc Supplements',
    'Maintaining Cleanliness and Sanitation',
    'Staying at Home',
    'Avoiding Solid Foods',
    'Seeking Medical Care',
    'Resting'
// add more exercises here
  ];

  List<String> _meningitisExercises = [
    'Resting',
    'Taking Medication',
    'Drinking Plenty of Fluids',
    'Getting Plenty of Rest',
    'Eating Healthy Foods',
    'Avoiding Exertion',
    'Managing Symptoms',
    'Staying Hydrated',
    'Keeping Cool',
    'Seeking Medical Care'
// add more exercises here
  ];

  List<String> _ebolaVirusDiseaseExercises = [
    'Resting',
    'Drinking Fluids',
    'Taking Pain Relievers',
    'Seeking Medical Care',
    'Isolating the Sick',
    'Washing Hands Frequently',
    'Avoiding Close Contact with Sick People',
    'Wearing Protective Clothing',
    'Disinfecting Surfaces and Objects',
    'Practicing Safe Burial Rituals'
// add more exercises here
  ];

  List<String> _polioExercises = [
    'Strength Training',
    'Walking',
    'Swimming',
    'Cycling',
    'Aerobics',
    'Yoga',
    'Pilates',
    'Tai Chi',
    'Water Aerobics',
    'Low-impact Aerobics'
// add more exercises here
  ];

  List<String> _measlesExercises = [
    'Resting',
    'Drinking Fluids',
    'Taking Medication',
    'Seeking Medical Care',
    'Managing Symptoms',
    'Staying Hydrated',
    'Eating Healthy Foods',
    'Getting Plenty of Rest',
    'Avoiding Exertion',
    'Keeping Cool'
// add more exercises here
  ];

  List<String> _typhoidFeverExercises = [
    'Resting',
    'Drinking Fluids',
    'Taking Antibiotics',
    'Eating Healthy Foods',
    'Getting Plenty of Rest',
    'Managing Symptoms',
    'Staying Hydrated',
    'Avoiding Exertion',
    'Seeking Medical Care',
    'Maintaining Cleanliness and Sanitation'
// add more exercises here
  ];

  List<String> _pneumoniaExercises = [
    'Resting',
    'Taking Medication',
    'Drinking Fluids',
    'Getting Plenty of Rest',
    'Eating Healthy Foods',
    'Managing Symptoms',
    'Staying Hydrated'
  ];

  List<String> _leprosyExercises = [
    'Gentle Stretching',
    'Walking',
    'Water Aerobics',
    'Yoga',
    'Tai Chi',
    'Pilates',
    'Swimming',
    'Cycling',
    'Rowing',
    'Low-impact Aerobics'
    // add more exercises here
  ];

  List<String> _rabiesExercises = [
    'Resting',
    'Stretching',
    'Deep Breathing',
    'Yoga',
    'Pilates',
    'Tai Chi',
    'Walking',
    'Swimming',
    'Cycling',
    'Light Strength Training'
    // add more exercises here
  ];

  List<String> _filteredDiseaseList = [];

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _filteredDiseaseList = _diseaseList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Specialized',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 400.0,
                child: Swiper(
                  itemCount: _specializedList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildCard(context, _specializedList[index]);
                  },
                  pagination: SwiperPagination(),
                  // control: SwiperControl(),
                  viewportFraction: 0.8,
                  scale: 0.9,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Disease related work out',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search disease',
                        border: InputBorder.none,
                        icon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 200.0,
                child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: _diseaseList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.withOpacity(0.3),
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: ListTile(
                        title: Text(
                          _diseaseList[index],
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          _showExercisesDialog(_diseaseList[index]);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, Map<String, dynamic> data) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => data['screen']),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: AssetImage(data['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  data['title'],
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  data['description'],
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showExercisesDialog(String disease) {
    List<String> exercises = [];

    switch (disease) {
      case 'Cancer':
        exercises = _cancerExercises;
        break;
      case 'Diabetes':
        exercises = _diabetesExercises;
        break;
      case 'Heart Disease':
        exercises = _heartDiseaseExercises;
        break;
      case 'Mental Health':
        exercises = _mentalHealthExercises;
        break;
      case 'Hypertension':
        exercises = _hypertensionExercises;
        break;
      case 'Asthma':
        exercises = _asthmaExercises;
        break;
      case 'Malaria':
        exercises = _malariaExercises;
        break;
      case 'Tuberculosis':
        exercises = _tuberculosisExercises;
        break;
      case 'HIV/AIDS':
        exercises = _hivAidsExercises;
        break;
      case 'Sickle Cell Anemia':
        exercises = _sickleCellAnemiaExercises;
        break;
      case 'Yellow Fever':
        exercises = _yellowFeverExercises;
        break;
      case 'Cholera':
        exercises = _choleraExercises;
        break;
      case 'Meningitis':
        exercises = _meningitisExercises;
        break;
      case 'Ebola Virus Disease':
        exercises = _ebolaVirusDiseaseExercises;
        break;
      case 'Polio':
        exercises = _polioExercises;
        break;
      case 'Measles':
        exercises = _measlesExercises;
        break;
      case 'Typhoid Fever':
        exercises = _typhoidFeverExercises;
        break;
      case 'Pneumonia':
        exercises = _pneumoniaExercises;
        break;
      case 'Leprosy':
        exercises = _leprosyExercises;
        break;
      case 'Rabies':
        exercises = _rabiesExercises;
        break;

      default:
        break;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Routine practices for $disease',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: exercises
                  .map((exercise) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          '- $exercise',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ))
                  .toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Close',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

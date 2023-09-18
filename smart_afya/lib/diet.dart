import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'mental_health_screen.dart';
import 'cancer_screen.dart';
import 'diabetes_screen.dart';
import 'heart_disease_screen.dart';

class DSpecializedScreen extends StatefulWidget {
  @override
  _DSpecializedScreenState createState() => _DSpecializedScreenState();
}

class _DSpecializedScreenState extends State<DSpecializedScreen> {
  List<String> _filteredDiseases = [];

  Widget searchResults() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search diet',
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
          'A balanced diet can help people with cancer feel better and stay stronger. It is key to eat a variety of foods, including whole grains, fruits and vegetables.... ',
      'screen': DSpecializedScreen,
    },
    {
      'title': 'Diabetes',
      'image': 'assets/diabetes.jpg',
      'description':
          'A healthy diet is essential in managing diabetes. Eating a balanced diet with plenty of fruits, vegetables and healthy fats can help keep blood sugar levels under control.',
      'screen': DSpecializedScreen(),
    },
    {
      'title': 'Heart Disease',
      'image': 'assets/heart.jpg',
      'description':
          'A healthy diet is essential in preventing and managing heart disease. Eating a diet rich in vegetables, whole grains, lean proteins, and healthy fats can help keep your heart healthy.',
      'screen': DSpecializedScreen(),
    },
    {
      'title': 'Mental Health',
      'image': 'assets/mental.jpg',
      'description':
          'Nutrition plays an important role in maintaining good mental health. Eating a balanced diet with healthy fats can help support brain function and regulate mood. ',
      'screen': DSpecializedScreen(),
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

  List<String> _AsthmaDiet = [
    'Foods rich in vitamin C, such as citrus fruits, berries, and leafy green vegetables, as they have been shown to improve lung function',
    'Foods high in vitamin E, such as nuts, seeds, and avocados, as they have been linked to reduced asthma symptoms',
    'Foods containing magnesium, such as spinach, almonds, and black beans, as magnesium can help relax the airways and reduce inflammation',
    'Omega-3 fatty acids found in fatty fish like salmon or supplements, as they have anti-inflammatory effects that can benefit individuals with asthma',
    'Limiting intake of processed and fried foods, sugary beverages, and trans fats, as they can contribute to inflammation and worsen asthma symptoms'
  ];

  List<String> _MalariaDiet = [
    'Foods rich in iron, such as red meat, poultry, fish, beans, and leafy green vegetables, as malaria can lead to anemia',
    'Foods containing vitamin B6, such as bananas, nuts, and seeds, as they may help reduce the severity of malaria symptoms',
    'Foods containing vitamin C, such as citrus fruits, berries, and bell peppers, as they can help boost the immune system and fight off infections',
    'Foods containing vitamin E, such as nuts, seeds, and leafy green vegetables, as they have antioxidant properties that can protect cells from damage caused by malaria',
    'Avoiding excessive alcohol consumption, as alcohol can weaken the immune system and increase the risk of malaria complications'
  ];

  List<String> _TuberculosisDiet = [
    'Foods rich in protein, such as lean meat, fish, eggs, beans, and dairy products, as they can help repair and maintain body tissues damaged by tuberculosis',
    'Foods containing vitamin A, such as carrots, sweet potatoes, and leafy green vegetables, as vitamin A is essential for maintaining a healthy immune system and can help fight tuberculosis infections',
    'Foods containing vitamin D, such as fatty fish, eggs, and fortified cereals, as vitamin D can help regulate the immune system and may reduce the risk of developing active tuberculosis',
    'Limiting intake of processed and packaged foods, sugary beverages, and trans fats, as they can weaken the immune system and increase the risk of tuberculosis complications',
    'Drinking plenty of fluids, such as water, tea, and soup, to prevent dehydration and support overall health'
  ];

  List<String> _HIVAIDSDiet = [
    'Foods rich in protein, such as lean meat, poultry, fish, beans, and nuts, as they can help repair and maintain body tissues damaged by HIV/AIDS',
    'Foods containing iron, such as red meat, poultry, fish, beans, and leafy green vegetables, as iron is essential for the immune system and can help fight infections',
    'Foods containing zinc, such as shellfish, lean meat, beans, and nuts, as zinc is important for maintaining a healthy immune system and can help reduce the risk of HIV-related complications',
    'Foods containing vitamin B12, such as eggs, milk, and fortified cereals, as HIV/AIDS can lead to vitamin B12 deficiency',
    'Avoiding excessive alcohol consumption and smoking, as they can weaken the immune system and increase the risk of HIV/AIDS complications'
  ];
  List<String> _HeartDiseaseDiet = [
    'Foods rich in fiber, such as whole grains, fruits, vegetables, and legumes, as fiber can help reduce cholesterol levels and improve heart health',
    'Foods rich in omega-3 fatty acids, such as fatty fish, flaxseed, chia seeds, and walnuts, as they can help lower triglycerides and reduce the risk of heart disease',
    'Foods containing unsaturated fats, such as olive oil, avocado, nuts, and seeds, as they can help lower LDL (bad) cholesterol levels and improve heart health',
    'Foods containing potassium, such as bananas, potatoes, tomatoes, and beans, as potassium can help lower blood pressure and reduce the risk of heart disease',
    'Limiting intake of saturated fats, such as butter, cheese, and fatty meats, as they can raise LDL (bad) cholesterol levels and increase the risk of heart disease'
  ];

  List<String> _SickleCellAnemiaDiet = [
    'Foods rich in folate, such as leafy green vegetables, citrus fruits, and fortified cereals, as folate can help produce healthy red blood cells',
    'Foods containing iron, such as lean meat, poultry, fish, beans, and leafy green vegetables, as iron is essential for producing hemoglobin and preventing anemia',
    'Foods containing vitamin B12, such as eggs, milk, and fortified cereals, as sickle cell anemia can lead to vitamin B12 deficiency',
    'Drinking plenty of fluids, such as water and herbal tea, to prevent dehydration and support overall health',
    'Avoiding excessive alcohol consumption and smoking, as they can worsen the symptoms of sickle cell anemia'
  ];

  List<String> _YellowFeverDiet = [
    'Foods rich in vitamin C, such as citrus fruits, berries, and leafy green vegetables, as vitamin C can help boost the immune system and fight off infections',
    'Foods containing vitamin E, such as nuts, seeds, and leafy green vegetables, as they have antioxidant properties that can protect cells from damage caused by yellow fever',
    'Foods containing zinc, such as shellfish, lean meat, beans, and nuts, as zinc is important for maintaining a healthy immune system and can help reduce the risk of yellow fever complications',
    'Drinking plenty of fluids, such as water, coconut water, and herbal tea, to prevent dehydration and support overall health',
    'Limiting intake of processed and packaged foods, sugary beverages, and trans fats, as they can weaken the immune system and increase the risk of yellow fever complications'
  ];

  List<String> _CholeraDiet = [
    'Foods rich in potassium, such as bananas, potatoes, tomatoes, and beans, as potassium can help replace lost electrolytes and prevent dehydration',
    'Foods containing vitamin C, such as citrus fruits, berries, and bell peppers, as they can help boost the immune system and fight off infections',
    'Foods containing zinc, such as shellfish, lean meat, beans, and nuts, as zinc is important for maintaining a healthy immune system and can help reduce the risk of cholera complications',
    'Drinking plenty of fluids, such as water, coconut water, and herbal tea, to prevent dehydration and support overall health',
    'Avoiding excessive alcohol consumption and smoking, as they can worsen the symptoms of cholera'
  ];

  List<String> _MeningitisDiet = [
    'Foods containing vitamin C, such as citrus fruits, berries, and bell peppers, as they can help boost the immune system and fight off infections',
    'Foods containing vitamin E, such as nuts, seeds, and leafy green vegetables, as they have antioxidant properties that can protect cells from damage caused by meningitis',
    'Foods containing vitamin B6, such as bananas, avocados, and lean meats, as vitamin B6 can help strengthen the immune system and prevent infections',
    'Drinking plenty of fluids, such as water, coconut water, and herbal tea, to prevent dehydration and support overall health',
    'Avoiding excessive alcohol consumption and smoking, as they can weaken the immune system and increase the risk of meningitis complications'
  ];

  List<String> _CancerDiet = [
    'Eating a diet rich in fruits and vegetables, as they contain antioxidants and other compounds that can help reduce the risk of cancer',
    'Foods containing whole grains, such as whole wheat bread, brown rice, and oatmeal, as they can provide fiber and other nutrients that can help reduce the risk of cancer',
    'Foods containing lean protein, such as fish, poultry, and legumes, as they can help maintain muscle mass and support overall health during cancer treatment',
    'Drinking plenty of fluids, such as water, to stay hydrated and support overall health',
    'Limiting intake of red and processed meats, sugary foods and beverages, and alcohol, as they can increase the risk of cancer'
  ];

  List<String> _HypertensionDiet = [
    'Eating a diet rich in fruits and vegetables, as they are low in sodium and high in potassium, which can help lower blood pressure',
    'Foods containing whole grains, such as whole wheat bread, brown rice, and oatmeal, as they can provide fiber and other nutrients that can help lower blood pressure',
    'Foods containing lean protein, such as fish, poultry, and legumes, as they can help maintain muscle mass and support overall health',
    'Limiting intake of sodium, processed foods, and sugary foods and beverages, as they can increase blood pressure',
    'Drinking plenty of fluids, such as water, to stay hydrated and support overall health'
  ];

  List<String> _EbolaDiet = [
    'Foods rich in vitamin C, such as citrus fruits, berries, and leafy green vegetables, as vitamin C can help boost the immune system and fight off infections',
    'Foods containing zinc, such as shellfish, lean meat, beans, and nuts, as zinc is important for maintaining a healthy immune system and can help reduce the risk of Ebola complications',
    'Foods containing selenium, such as nuts, seeds, and fish, as selenium can help support the immune system and protect against viral infections',
    'Drinking plenty of fluids, such as water, coconut water, and herbal tea, to prevent dehydration and support overall health',
    'Limiting intake of processed and packaged foods, sugary beverages, and trans fats, as they can weaken the immune system and increase the risk of Ebola complications'
  ];

  List<String> _PolioDiet = [
    'Foods containing vitamin A, such as sweet potatoes, carrots, and leafy green vegetables, as vitamin A can help support the immune system and reduce the risk of polio complications',
    'Foods containing vitamin C, such as citrus fruits, berries, and bell peppers, as they can help boost the immune system and fight off infections',
    'Foods containing zinc, such as shellfish, lean meat, beans, and nuts, as zinc is important for maintaining a healthy immune system and can help reduce the risk of polio complications',
    'Drinking plenty of fluids, such as water and herbal tea, to prevent dehydration and support overall health',
    'Limiting intake of processed and packaged foods, sugary beverages, and trans fats, as they can weaken the immune system and increase the risk of polio complications'
  ];

  List<String> _DiabetesDiet = [
    'Foods with a low glycemic index, such as whole grains, non-starchy vegetables, nuts, and beans, as they can help regulate blood sugar levels',
    'Foods high in fiber, such as fruits, vegetables, and whole grains, as fiber can help slow the absorption of sugar and improve blood sugar control',
    'Foods containing healthy fats, such as nuts, seeds, avocado, and fatty fish, as they can help improve insulin sensitivity and reduce the risk of heart disease',
    'Foods containing lean protein, such as poultry, fish, tofu, and legumes, as they can help regulate blood sugar levels and promote feelings of fullness',
    'Limiting intake of sugary beverages, processed foods, and saturated and trans fats, as they can contribute to high blood sugar levels and increase the risk of heart disease'
  ];

  List<String> _MeaslesDiet = [
    'Eating a well-balanced diet that includes a variety of fruits, vegetables, whole grains, lean protein, and healthy fats to support overall health and immune function',
    'Drinking plenty of fluids, such as water, herbal tea, and soups, to prevent dehydration and support immune function',
    'Foods containing vitamin A, such as sweet potatoes, carrots, spinach, and liver, as vitamin A can help reduce the severity of measles symptoms and complications',
    'Foods containing vitamin C, such as citrus fruits, berries, and bell peppers, as they can help boost the immune system and fight off infections',
    'Foods containing zinc, such as shellfish, lean meat, beans, and nuts, as zinc is important for maintaining a healthy immune system and can help reduce the duration of measles symptoms'
  ];

  List<String> _TyphoidFeverDiet = [
    'Foods rich in fluids, such as soups, broths, and coconut water, to prevent dehydration and support overall health',
    'Foods containing lean protein, such as chicken, fish, tofu, and legumes, as they can help repair and rebuild tissues damaged by infection',
    'Foods containing vitamin C, such as citrus fruits, berries, and bell peppers, as they can help boost the immune system and fight off infections',
    'Foods containing zinc, such as shellfish, lean meat, beans, and nuts, as zinc is important for maintaining a healthy immune system and can help reduce the duration of typhoid fever symptoms',
    'Avoiding raw or undercooked meat, eggs, and dairy products, as they can increase the risk of infection with Salmonella typhi bacteria'
  ];

  List<String> _PneumoniaDiet = [
    'Foods containing lean protein, such as chicken, fish, tofu, and legumes, as they can help repair and rebuild tissues damaged by infection',
    'Foods containing vitamin A, such as sweet potatoes, carrots, spinach, and liver, as vitamin A can help strengthen the immune system and reduce the risk of complications',
    'Foods containing vitamin C, such as citrus fruits, berries, and bell peppers, as they can help boost the immune system and fight off infections',
    'Foods containing zinc, such as shellfish, lean meat, beans, and nuts, as zinc is important for maintaining a healthy immune system and can help reduce the duration of pneumonia symptoms',
    'Drinking plenty of fluids, such as water, herbal tea, and soups, to prevent dehydration and support overall health'
  ];

  List<String> _LeprosyDiet = [
    'Foods rich in vitamin C, such as citrus fruits, berries, and leafy green vegetables, as vitamin C can help boost the immune system and promote wound healing',
    'Foods containing antioxidants, such as berries, nuts, and leafy green vegetables, as they can help reduce inflammation and protect cells from damage caused by leprosy',
    'Foods containing zinc, such as shellfish, lean meat, beans, and nuts, as zinc is important for maintaining a healthy immune system and promoting wound healing',
    'Drinking plenty of fluids, such as water and herbal tea, to prevent dehydration and support overall health',
    'Limiting intake of processed and packaged foods, sugary beverages, and trans fats, as they can weaken the immune system and increase the risk of leprosy complications'
  ];

  List<String> _RabiesDiet = [
    'Eating a balanced diet rich in vitamins and minerals to support overall health and immune function',
    'Foods containing antioxidants, such as berries, nuts, and leafy green vegetables, as they can help reduce inflammation and protect cells from damage caused by rabies',
    'Foods containing zinc, such as shellfish, lean meat, beans, and nuts, as zinc is important for maintaining a healthy immune system and promoting wound healing',
    'Drinking plenty of fluids, such as water and herbal tea, to prevent dehydration and support overall health',
    'Avoiding raw or undercooked meat, as it may contain the rabies virus and increase the risk of infection'
  ];

  List<String> _MentalHealthDiet = [
    'Eating a balanced diet that includes a variety of fruits, vegetables, whole grains, lean protein sources, and healthy fats to support overall health and well-being',
    'Foods containing omega-3 fatty acids, such as fatty fish, flaxseed, chia seeds, and walnuts, as they have been shown to improve mood and reduce symptoms of depression',
    'Foods containing magnesium, such as leafy green vegetables, nuts, and whole grains, as magnesium is important for regulating mood and reducing symptoms of anxiety',
    'Drinking plenty of fluids, such as water and herbal tea, to support overall health and hydration',
    'Limiting intake of caffeine, sugary foods and beverages, and alcohol, as they can have negative effects on mental health and well-being'
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
                  'HEALTHY DIET PRACTICES',
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
                  'Disease related diet',
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
                    color: Colors.blue,
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
        exercises = _CancerDiet;
        break;
      case 'Diabetes':
        exercises = _DiabetesDiet;
        break;
      case 'Heart Disease':
        exercises = _HeartDiseaseDiet;
        break;
      case 'Mental Health':
        exercises = _MentalHealthDiet;
        break;
      case 'Hypertension':
        exercises = _HypertensionDiet;
        break;
      case 'Asthma':
        exercises = _AsthmaDiet;
        break;
      case 'Malaria':
        exercises = _MalariaDiet;
        break;
      case 'Tuberculosis':
        exercises = _TuberculosisDiet;
        break;
      case 'HIV/AIDS':
        exercises = _HIVAIDSDiet;
        break;
      case 'Sickle Cell Anemia':
        exercises = _SickleCellAnemiaDiet;
        break;
      case 'Yellow Fever':
        exercises = _YellowFeverDiet;
        break;
      case 'Cholera':
        exercises = _CholeraDiet;
        break;
      case 'Meningitis':
        exercises = _MeningitisDiet;
        break;
      case 'Ebola Virus Disease':
        exercises = _EbolaDiet;
        break;
      case 'Polio':
        exercises = _PolioDiet;
        break;
      case 'Measles':
        exercises = _MeaslesDiet;
        break;
      case 'Typhoid Fever':
        exercises = _TyphoidFeverDiet;
        break;
      case 'Pneumonia':
        exercises = _PneumoniaDiet;
        break;
      case 'Leprosy':
        exercises = _LeprosyDiet;
        break;
      case 'Rabies':
        exercises = _RabiesDiet;
        break;

      default:
        break;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Diet practices for $disease',
            style: TextStyle(
              fontSize: 18.0,
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
                          style: TextStyle(fontSize: 14.0),
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
                  fontSize: 18.0,
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

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'main.dart';

class HealthArticle {
  final String title;
  final String url;
  final String desc;

  HealthArticle({
    required this.title,
    required this.url,
    required this.desc,
  });
}

final List<HealthArticle> healthArticles = [
  HealthArticle(
    title: 'Cholera Fact Sheet',
    desc:
        'Cholera is an acute diarrhoeal infection caused by ingestion of food or water contaminated with the bacterium Vibrio cholerae.',
    url:
        'https://www.who.int/news-room/fact-sheets/detail/cholera?gclid=CjwKCAjw5dqgBhBNEiwA7PryaBHmCRPzaqyIb7mgDYmghHM9nul62vdZiBN2OKAwtWXRF8dWYtfxmBoC5WwQAvD_BwE',
  ),
  HealthArticle(
    title: 'The Importance of Hydration for Health',
    desc:
        'Water is crucial for many bodily functions, such as lubricating the joints, delivering oxygen throughout the body, preventing kidney damage, and more.',
    url:
        'https://www.medicalnewstoday.com/articles/290814#benefits-of-hydration',
  ),
  HealthArticle(
    title: 'How to Manage Stress',
    desc:
        'While it may seem like there\'s nothing you can do about stress at work and home, there are steps you can take to relieve the pressure and regain control.',
    url: 'https://www.helpguide.org/articles/stress/stress-management.htm',
  ),
  HealthArticle(
    title: '10 Tips for a Healthier Lifestyle',
    desc:
        'It\'s easy to get confused when it comes to health and nutrition. Even qualified experts often seem to hold opposing opinions, which can make it difficult to figure out what you should actually be doing to optimize your health.',
    url:
        'https://www.healthline.com/nutrition/27-health-and-nutrition-tips#1.-Don%27t-drink-sugar-calories',
  ),
  HealthArticle(
    title: 'The Benefits of Meditation',
    desc:
        'Meditation is the habitual process of training your mind to focus and redirect your thoughts.',
    url:
        'https://www.healthline.com/nutrition/12-benefits-of-meditation#1.-Reduces-Stress',
  ),
  HealthArticle(
    title: 'The Top 10 Benefits of Regular Exercise',
    desc:
        'Regular exercise has been shown to help boost energy levels and enhance your mood. It may also be associated with many other powerful health benefits, including a reduced risk of chronic disease.',
    url:
        'https://www.healthline.com/nutrition/10-benefits-of-exercise#1.-Exercise-Is-Good-for-Your-Brain',
  ),

  HealthArticle(
    title: 'How to Eat Healthy',
    desc:
        'Confused by all the conflicting nutrition advice out there? These simple tips can show you how to plan, enjoy, and stick to a healthy diet.',
    url: 'https://www.helpguide.org/articles/healthy-eating/healthy-eating.htm',
  ),
  HealthArticle(
    title: 'How to Stay Hygienic and Clean',
    desc:
        'Research shows that washing hands with soap and water could reduce deaths from diarrheal disease by up to 50%',
    url: 'https://www.cdc.gov/healthywater/hygiene/fast_facts.html',
  ),
  HealthArticle(
      title: 'The Benefits of Drinking Green Tea',
      desc:
          'Green tea comes from a plant called Camellia sinensis, commonly known as the "tea plant." It was originated in East Asia and has been used since ancient times to treat everything from headaches to depression.',
      url:
          'https://www.akshar.org/go-easy-green-tea.html?gad=1&gclid=CjwKCAjwov6hBhBsEiwAvrvN6IVTw02vl1J6TFEPCCHG6p6HuSfbK8yOwJazWukYa0h60trAWiqoZRoCvesQAvD_BwE'),

  HealthArticle(
    title: 'The Importance of Mental Health',
    desc:
        'Mental health is a state of mental well-being that enables people to cope with the stresses of life, realize their abilities, learn well and work well, and contribute to their community. It is an integral component of health and well-being that underpins our individual and collective abilities to make decisions, build relationships and shape the world we live in.',
    url:
        'https://www.who.int/news-room/fact-sheets/detail/mental-health-strengthening-our-response',
  ),
  HealthArticle(
    title: 'The Dangers of Substance Abuse',
    desc:
        'Many drugs can alter a person\'s thinking and judgment, and can lead to health risks, including addiction, drugged driving, infectious disease, and adverse effects on pregnancy. Information on commonly used drugs with the potential for misuse or addiction can be found here.',
    url:
        'https://www.drugabuse.gov/drug-topics/health-consequences-drug-misuse#:~:text=Drug%20use%20can%20also%20result,of%20drug%20use%20on%20society.',
  ),
  HealthArticle(
    title: 'How to Quit Smoking',
    desc:
        'Smoking tobacco is both a physical addiction and a psychological habit. The nicotine from cigarettes provides a temporary—and addictive—high. Eliminating that regular fix of nicotine causes your body to experience physical withdrawal symptoms and cravings.',
    url:
        'https://www.helpguide.org/articles/addictions/how-to-quit-smoking.htm',
  ),
  HealthArticle(
    title: 'The Importance of Dental Health',
    desc:
        'If you experience any of the following warning signs of dental health issues, you should make an appointment to see your dentist as soon as possible:',
    url: 'https://www.healthline.com/health/dental-and-oral-health',
  ),

  HealthArticle(
    title: 'The Health Benefits of Yoga',
    desc:
        'Compared to other forms of yoga you may have experienced, Iyengar yoga is notable for its emphasis on precise body alignment and the sequences in which asanas are practised. You hold postures for longer so that your muscles relax and lengthen, while your awareness is raised.',
    url: 'https://www.yogajournal.com/yoga-101/benefits-of-yoga',
  ),
  HealthArticle(
    title: 'The Benefits of Eating Fruits and Vegetables',
    desc:
        "They're an excellent source of dietary fibre, which can help to maintain a healthy gut and prevent constipation and other digestion problems. A diet high in fibre can also reduce your risk of bowel cancer.",
    url:
        'https://www.nhs.uk/live-well/eat-well/5-a-day/why-5-a-day/#:~:text=Fruit%20and%20vegetables%20are%20a,your%20risk%20of%20bowel%20cancer.',
  ),
  HealthArticle(
    title: 'Why Sleep Is Important for Your Health',
    desc:
        'Sleep deprivation can put your health and safety at risk, which is why it\'s essential that you prioritize and protect your sleep on a daily basis.',
    url:
        'https://www.healthline.com/nutrition/10-reasons-why-good-sleep-is-important#2.-Poor-Sleep-Is-Linked-to-Higher-Body-Weight',
  ),

  HealthArticle(
    title: '10 Tips for a Healthy Heart',
    desc:
        'When people talk about heart disease, they\'re usually talking about coronary heart disease (CHD). It\'s also sometimes called coronary artery disease (CAD). This is the most common type of heart disease. ',
    url:
        'https://health.gov/myhealthfinder/health-conditions/heart-health/keep-your-heart-healthy',
  ),

  HealthArticle(
    title: "Mental Health: What's Normal, What's Not",
    desc:
        'Adopting mindfulness CBT for depression would improve outcomes and save money compared with standard CBT, say the researchers, led by Clara Strauss, DPhil, with the University of Sussex School of Psychology.',
    url: 'https://www.webmd.com/mental-health/mental-health-normal',
  ),
  HealthArticle(
    title: 'How to Eat Healthy',
    desc:
        'Eating a healthy diet is not about strict limitations, staying unrealistically thin, or depriving yourself of the foods you love. Rather, it’s about feeling great, having more energy, improving your health, and boosting your mood.',
    url: 'https://www.helpguide.org/articles/healthy-eating/healthy-eating.htm',
  ),
  HealthArticle(
    title: 'Why Sleep Is Important for Your Health',
    desc:
        'Getting a good night’s sleep is incredibly important for your health. In fact, it’s just as important as eating a balanced, nutritious diet and exercising.',
    url:
        'https://www.healthline.com/nutrition/10-reasons-why-good-sleep-is-important#2.-Poor-Sleep-Is-Linked-to-Higher-Body-Weight',
  ),

// Add more articles here
];

class HealthArticlesScreen extends StatelessWidget {
  const HealthArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Health Articles'),
          backgroundColor: Colors.green, // change app bar background color
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: healthArticles.length,
            itemBuilder: (context, index) {
              final article = healthArticles[index];
              return InkWell(
                onTap: () async {
                  // Navigate to a new screen to show the article
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArticleScreen(url: article.url),
                    ),
                  );
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article.title,
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          article.desc,
                          style: const TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                            // textBaseline: TextBaseline.alphabetic
                            //textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GoogleSearchPage()),
            );
          },
          child: const Icon(Icons.search),
          backgroundColor: Colors.green, // change FAB background color
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GoogleSearchPage()),
                  );
                },
                child: Icon(Icons.home),
              ),
              label: 'Home',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
              backgroundColor: Colors.green,
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.settings),
            //   label: 'Settings',
            // ),
          ],
          selectedItemColor: Colors.green, // change selected item color
          unselectedItemColor: Colors.grey, // change unselected item color
        ),
      ),
    );
  }
}

class ArticleScreen extends StatelessWidget {
  final String url;

  const ArticleScreen({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Article'),
          backgroundColor: Colors.green, // change app bar background color
        ),
        body: WebView(
          initialUrl: url,
        ),
      ),
    );
  }
}

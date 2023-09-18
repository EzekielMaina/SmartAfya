import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'main.dart';

class HealthArticle {
  final String title;
  final String url;

  HealthArticle({
    required this.title,
    required this.url,
  });
}

final List<HealthArticle> healthArticles = [
  HealthArticle(
    title: 'Cholera Fact Sheet',
    url:
        'https://www.who.int/news-room/fact-sheets/detail/cholera?gclid=CjwKCAjw5dqgBhBNEiwA7PryaBHmCRPzaqyIb7mgDYmghHM9nul62vdZiBN2OKAwtWXRF8dWYtfxmBoC5WwQAvD_BwE',
  ),

  HealthArticle(
    title: 'The Top 10 Benefits of Regular Exercise',
    url:
        'https://www.healthline.com/nutrition/10-benefits-of-exercise#1.-Exercise-Is-Good-for-Your-Brain',
  ),
// Add more articles here
];

class HealthArticlesScreen extends StatelessWidget {
  const HealthArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        article.url,
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
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
          ),
        ],
        selectedItemColor: Colors.green, // change selected item color
        unselectedItemColor: Colors.grey, // change unselected item color
      ),
    );
  }
}

class ArticleScreen extends StatelessWidget {
  final String url;

  const ArticleScreen({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article'),
        backgroundColor: Colors.green, // change app bar background color
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}

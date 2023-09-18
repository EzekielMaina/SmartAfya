import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:smart_afya/supervisor.dart';
import 'package:url_launcher/url_launcher.dart';
import 'main.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  bool _isConclusionExpanded = true;
  bool _isprojecttwo = true;
  bool _isProfileExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GoogleSearchPage()),
            );
          },
          child: Text('About the Developer'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipOval(
              child: Container(
                height: 330,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://lh3.googleusercontent.com/a/AGNmyxbH-IsCgLjY4h-TqcGnI40oWJMEv2PSd7007JpFvA=s288'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text.rich(
                    TextSpan(
                      text: 'Name: ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Ezekiel Maina Waithera',
                          style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'E-Mail: ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'ezekielmaina.me@gmail.com',
                          style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Tel: ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '+254758291548 / +254700408205',
                          style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Adm No: ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'CCS/00255/019',
                          style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Introduction',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'I am an experienced software developer, database & network administrator, data scientist with a passion for creating elegant solutions to complex problems. With over 3 years of experience in the industry, I have worked on a wide range of projects, from large-scale enterprise systems to mobile apps.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Project Works',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Over the course of my career, I'
                    've had the privilege of contributing to a wide variety of projects spanning an array of domains. These domains include enterprise, academia, electronics, telecommunications, hardware, medicine, machine learning, data science, politics, agriculture, entertainment, and networking. Allow me to share with you a selection of some of the most noteworthy of these projects:',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16),
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down),
                    title: Text(
                      '1. Automated SAS',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _isConclusionExpanded = !_isConclusionExpanded;
                      });
                    },
                  ),
                  Visibility(
                    visible: _isConclusionExpanded,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 16),
                      child: Text.rich(
                        TextSpan(
                          text: 'Automated School Admission System: ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  'The automated school admission system is a game-changer for students, parents, and school administrators alike. Say goodbye to long lines and endless paperwork – the system streamlines the admission process by automating everything from financial aid and medical records to course registration and housing assignments. Parents can rest assured knowing that their child'
                                  's information is safe and secure, while school administrators can focus on providing a top-notch education to their students. Our system takes the hassle out of school admissions, allowing everyone involved to focus on what matters most: providing the best possible learning experience for students.',
                              style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down),
                    title: Text(
                      '2. Car hire system',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _isConclusionExpanded = !_isConclusionExpanded;
                      });
                    },
                  ),
                  Visibility(
                    visible: _isConclusionExpanded,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 16),
                      child: Text.rich(
                        TextSpan(
                          text: 'Maridadi Car Hire Management System: ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  'I developed a car hire management system for a local car rental company as a school project. The system allows customers to browse available cars, make reservations, and manage their bookings online. With the implementation of the system it was proven that a company would have a significant increase in bookings thus increase in earnings.',
                              style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down),
                    title: Text(
                      '3. Integrated SMS',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _isprojecttwo = !_isprojecttwo;
                      });
                    },
                  ),
                  Visibility(
                    visible: _isprojecttwo,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 16),
                      child: Text.rich(
                        TextSpan(
                          text: 'Intergrated School Management System: ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  'The integrated school management system is more than just a way to keep track of grades and attendance. It'
                                  's a tool that empowers students to express their concerns and make their voices heard. With our system, students can easily and securely communicate with school administrators about issues that matter to them. This creates a more collaborative and supportive learning environment that benefits everyone involved. So not only does our system help teachers and administrators manage day-to-day school operations, it also fosters a culture of inclusivity and open communication that helps students thrive.',
                              style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Other Works',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'I have also worked on a number of other networking, cctv installations, system security and server projects. I have worked with Heaalth IT Maseno University, USAID, KenyaEMR among others.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Conclusion',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'I am passionate about software development and am always looking for new and exciting challenges. If you are interested in working with me on a project, please don\'t hesitate to get in touch!',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Project Information',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'I'
                    'm thrilled to present my fourth-year undergraduate project, which I'
                    've developed in accordance with the rigorous standards set forth by the Department of Computer Science at Maseno University. Over the course of my studies, I'
                    've worked tirelessly to hone my skills and knowledge in computer science, and I'
                    'm proud to say that this project is a reflection of my hard work and dedication. With this project, I'
                    've had the opportunity to explore new technologies, push my limits, and contribute to the field of computer science in a meaningful way. I'
                    'm excited to share my project with my peers, industries, and the wider community, and I'
                    'm confident that it will be a valuable addition to the body of work being produced by Maseno University'
                    's computer science department.',
                    style: TextStyle(fontSize: 16),
                  ),
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down),
                    title: Text(
                      'Supervisor',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _isConclusionExpanded = !_isConclusionExpanded;
                      });
                    },
                  ),
                  Visibility(
                    visible: _isConclusionExpanded,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://sci.maseno.ac.ke/sites/default/files/2021-03/Henry.png',
                            width: 150,
                            height: 150,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 10),
                          Text.rich(
                            TextSpan(
                              text: 'Name: ',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Dr. Henry Okora Okoyo',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                TextSpan(
                                  text: '\nDepartment: ',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Computer Science',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                TextSpan(
                                  text: '\nSchool: ',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: 'School of computing and informatics',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down),
                    title: Text(
                      'Acknowledgement',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _isConclusionExpanded = !_isConclusionExpanded;
                      });
                    },
                  ),
                  Visibility(
                    visible: _isConclusionExpanded,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 16),
                      child: Text(
                        "I wanted to take a moment to express my heartfelt gratitude to you for being such an amazing project supervisor and attachment assesor. Your guidance, support, and encouragement have made a huge impact on me and have helped me grow both personally and professionally. \nThroughout this project, you have been an incredible source of inspiration for me. Your unwavering commitment to excellence and your passion for the work that we do has motivated me to push myself to new heights and strive for excellence in everything that I do.\n I am so grateful for the time and energy that you have invested in me, and I feel truly blessed to have had the opportunity to work with someone as talented and dedicated as you. Your insights, feedback, and guidance have been invaluable to me, and I know that I will carry the lessons that I have learned from you with me for the rest of my career.\n Thank you so much for all that you have done for me. You have truly made a difference in my life, and I will always be grateful to you for your kindness, your wisdom, and your unwavering support.\n With heartfelt thanks and warmest regards",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyWebPage()),
                      );
                    },
                    child: Text(
                      'Supervisor profile',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors
                            .blue, // Change text color to indicate it's clickable
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

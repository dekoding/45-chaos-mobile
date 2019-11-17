import 'package:flutter/material.dart';
import 'package:forty_five_chaos/shared/customwidgets.dart';
import 'package:forty_five_chaos/styling/fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class FaqsPage extends StatefulWidget {
  @override
  _FaqsPage createState() => _FaqsPage();
}

class _FaqsPage extends State<FaqsPage> {
  Widget linkTiles() {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        MaterialButton(
            child: ListTile(
              title: Text(
                  "Donald Trump is losing Cabinet officials at a record rate"),
            ),
            onPressed: () async {
              await launch(
                  'https://www.cnn.com/2018/11/14/politics/trump-cabinet-staff-turnover/index.html'
              );
            }
        ),
        MaterialButton(
            child: ListTile(
              title: Text(
                  "Trump White House sets turnover records, analysis shows"),
            ),
            onPressed: () async {
              await launch(
                  "https://www.nbcnews.com/politics/white-house/trump-white-house-sets-turnover-records-analysis-shows-n888396"
              );
            }
        ),
        MaterialButton(
            child: ListTile(
              title: Text(
                  "Why is Trump’s staff turnover higher than the 5 most recent presidents?"),
            ),
            onPressed: () async {
              await launch(
                  "https://www.brookings.edu/research/why-is-trumps-staff-turnover-higher-than-the-5-most-recent-presidents/"
              );
            }
        ),
        MaterialButton(
            child: ListTile(
              title: Text(
                  "Turnover In Trump's White House Vs. Obama's Is So Striking"),
            ),
            onPressed: () async {
              await launch(
                  "https://www.bustle.com/p/turnover-in-trumps-white-house-vs-obamas-is-so-striking-8389049"
              );
            }
        ),
        MaterialButton(
            child: ListTile(
              title: Text(
                  "Trump's Staff Turnover Is the Highest for Any Presidency in Decades"),
            ),
            onPressed: () async {
              await launch(
                  "http://fortune.com/2018/02/13/donald-trump-white-house-staff-turnover/"
              );
            }
        ),
      ],
    );
  }

  Widget entry({String title, String subtitle}) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
            elevation: 8,
            child: ListTile(
                title: Text(title),
                subtitle: Text(subtitle)
            )
        )
    );
  }

  Widget linkButton({ String title, String url }) {
    return MaterialButton(
        child: ListTile(
          title: Text(title),
          subtitle: Text(url, style: TextStyle(color: Colors.blue)),
        ),
        onPressed: () async {
          await launch(url);
        }
    );
  }

  Widget faqs() {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        entry(
            title: 'What does R-UP stand for?',
            subtitle: 'Resigned under pressure. This indicates the individual left because they were forced out, either by superiors or by investigations into their conduct.'
        ),
        entry(
            title: 'What is a mooch?',
            subtitle:
            'A mooch is the period of time between the hiring and firing of former Communications Director Anthony Scaramucci. Generally, the most used and accepted conversion is 1 mooch = 10 days. However, it can be argued that Scaramucci actually served 11 days. Due to the prevalence of the 10 day conversion, I decided to use it for this list.'
        ),
        Padding(padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 8,
              child: ListTile(
                  title: Text(
                      'Are there comparisons with past administrations?'),
                  subtitle: Column(
                      children: <Widget>[
                        Text(
                            'There have been many comparisons of the turnover in Trump’s administration with past administrations. However, most only look at a subset of the total departures. For instance, some compare only cabinet-level turnover.  I\'m working on making a page for the site that will make direct comparisons of sub-sections easier, but for now this is what exists:'),
                        linkButton(
                            title: "Donald Trump is losing Cabinet officials at a record rate",
                            url: "https://www.cnn.com/2018/11/14/politics/trump-cabinet-staff-turnover/index.html"
                        ),
                        linkButton(
                            title: "Trump White House sets turnover records, analysis shows",
                            url: "https://www.nbcnews.com/politics/white-house/trump-white-house-sets-turnover-records-analysis-shows-n888396"
                        ),
                        linkButton(
                            title: "Why is Trump’s staff turnover higher than the 5 most recent presidents?",
                            url: "https://www.brookings.edu/research/why-is-trumps-staff-turnover-higher-than-the-5-most-recent-presidents/"
                        ),
                        linkButton(
                            title: "Turnover In Trump's White House Vs. Obama's Is So Striking",
                            url: "https://www.bustle.com/p/turnover-in-trumps-white-house-vs-obamas-is-so-striking-8389049"
                        ),
                        linkButton(
                            title: "Trump's Staff Turnover Is the Highest for Any Presidency in Decades",
                            url: "http://fortune.com/2018/02/13/donald-trump-white-house-staff-turnover/"
                        ),
                      ]
                  )
              ),
            )
        ),
        entry(
          title: 'Who is included in the list?',
          subtitle: 'Anyone in a high-level position who gets paid federal money and influences government policy. There is some subjectivity involved. Additionally, there is an inherent sampling bias: only departures noticed by the media get included.',
        ),
        entry(
            title: 'How precise is the data?',
            subtitle: 'As precise as possible. In some instances, an exact date of departure could not be identified. In these situations, I either assigned the publishing date of the article announcing the staff change or I assigned the middle of the month, depending on which option seemed most appropriate in context.'
        ),
        Padding(padding: const EdgeInsets.all(8.0),
            child: Card(
                elevation: 8,
                child: ListTile(
                    title: Text(
                        'What if an individual held more than one position in the Trump administration?'),
                    subtitle:
                    Column(
                      children: <Widget>[
                        Text(
                            'Time spent in previous positions are not included; only the time spent in the most recent position is counted. This is because it would get too complicated to list time in multiple positions for a single individual.'),
                        Text(
                            'If an individual held two positions concurrently, the maximum time span is counted. For instance, Individual A held position 1 from March to December, as well as position 2 from June to December. Thus, Individual A’s time in position would be from March to December. The two concurrent roles would be listed in the “position” column.')
                      ],
                    )
                )
            )
        ),
        entry(
            title: 'Why are some departure dates in the future?',
            subtitle: 'Some individuals announced their resignation, effective at a future date. This date is listed as their departure date, even if they are still serving.'
        ),
        Padding(padding: const EdgeInsets.all(8.0),
            child: Card(
                elevation: 8,
                child: ListTile(
                    title: Text('Can I be notified when the list is updated?'),
                    subtitle: MaterialButton(
                        onPressed: () async {
                          await launch("https://www.reddit.com/r/45chaos/");
                        },
                        child: Text('All updates are posted to /r/45chaos')
                    )
                )
            )
        )

      ],
    );
  }

  Widget definitions() {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        entry(title: 'BIA', subtitle: 'Bureau of Indian Affairs'),
        entry(title: 'AAPI', subtitle: "President's Advisory Commission on Asian Americans and Pacific Islanders"),
        entry(title: 'PACHA', subtitle: "Presidential Advisory Council on HIV/AIDS"),
        entry(title: 'PCAH', subtitle: "President's Committee on the Arts & Humanities"),
        entry(title: "ITC", subtitle: "U.S. International Trade Commission"),
        entry(title: "Asst.", subtitle: "Assistant"),
        entry(title: "R-UP", subtitle: "Resigned under pressure"),
        entry(title: "Secy", subtitle: "Secretary"),
        entry(title: "NIAC", subtitle: "National Infrastructure Advisory Council"),
        entry(title: "VA", subtitle: "Veterans Affairs"),
        entry(title: "Total time (days)", subtitle: "Total time in their position, regardless of who was in charge"),
        entry(title: "AMC", subtitle: "American Manufacturing Council"),
        entry(title: "NDC", subtitle: "National Diverstiy Coalition"),
        entry(title: "Mooch", subtitle: "Unit of time Scaramucci was in his position (10 days)"),
        entry(title: "HUD", subtitle: "Department of Housing and Urban Development"),
        entry(title: "Comm", subtitle: "Communication"),
        entry(title: "Div", subtitle: "Division"),
        entry(title: "Atty", subtitle: "Attorney"),
        entry(title: "SPF", subtitle: "Strategic and Policy Forum"),
        entry(title: "CFPB", subtitle: "Consumer Financial Protection Bureau"),
        entry(title: "OPM", subtitle: "Office of Personnel Management"),
        entry(title: "Asso", subtitle: "Associate"),
        entry(title: "HSAC", subtitle: "Homeland Security Advisory Council"),
        entry(title: "NEH", subtitle: "Nat'l Endowment for the Humanities"),
        entry(title: "WH", subtitle: "White House"),
        entry(title: "NSC", subtitle: "National Security Council"),
        entry(title: "DHS", subtitle: "Department of Homeland Security"),
        entry(title: "CoS", subtitle: "Chief of Staff"),
        entry(title: "Time under Trump", subtitle: "The time they served in their position while Trump was in charge"),
        entry(title: "Dep.", subtitle: "Deputy"),
        entry(title: "*", subtitle: "not officially nominated"),
        entry(title: "DOE", subtitle: "Department of Energy"),
        entry(title: "HHS", subtitle: "Health and Human Services"),
        entry(title: "OSTP", subtitle: "Office of Science and Technology Policy"),
        entry(title: "CHMN", subtitle: "Chairman"),
        entry(title: "Dir.", subtitle: "Director"),
      ],
    );
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: <Widget>[
            ChaosHeader(
                primary: 'FAQs',
                secondary: 'Get smart answers about the dumbest of presidents'
            ),
            Expanded(
              child: index == 0 ? faqs() : definitions()
            )
          ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this.index,
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            title: Text("Q&A"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            title: Text("Definitions"),
          ),
        ]

      ),
    );
  }
}
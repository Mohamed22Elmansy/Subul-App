import 'package:flutter/material.dart';
import 'package:graduation/presentation/Widgets/CircleCard.dart';
import 'package:graduation/presentation/Widgets/ServiceCard.dart';
import 'package:graduation/presentation/Widgets/WhoWeCard.dart';
import 'package:readmore/readmore.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          'من نحن',
          style: TextStyle(
            fontFamily: "BlakaHollow",
            color: const Color.fromRGBO(145, 104, 58, 1),
            fontSize: width / 7.5,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        children: [
          SizedBox(
            height: height / 80,
          ),
          SizedBox(
            height: height / 3,
            child: Image.asset("assets/images/سبل.png"),
          ),
          SizedBox(
            height: height / 80,
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              "التعريف بمؤسسة سبل",
              style: TextStyle(
                color: const Color.fromRGBO(145, 104, 58, 1),
                fontSize: width / 15,
                fontFamily: "Cairo",
                fontWeight: FontWeight.bold,
              ),
              textDirection: TextDirection.rtl,
            ),
          ),
          const Whowecard(),
          SizedBox(
            height: height / 80,
          ),
          Center(
            child: Text(
              "احصائيات الموقع",
              style: TextStyle(
                color: const Color.fromRGBO(145, 104, 58, 1),
                fontSize: width / 12,
                fontFamily: "Cairo",
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: height / 80,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleCard(
                    number: "150",
                    title: "التبرعات",
                  ),
                  CircleCard(
                    number: "80",
                    title: "الاضاحي",
                  ),
                  CircleCard(
                    number: "120",
                    title: "الصدقات",
                  ),
                  CircleCard(
                    number: "200",
                    title: "المتبرعين",
                  ),
                  CircleCard(
                    number: "50",
                    title: "الحالات",
                  ),
                  CircleCard(
                    number: "350",
                    title: "الجمعيات",
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height / 80,
          ),
          Text(
            "خدمات الموقع",
            style: TextStyle(
              color: const Color.fromRGBO(145, 104, 58, 1),
              fontSize: width / 12,
              fontFamily: "Cairo",
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: height / 60,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ServiceCard(
                      headtitle: "اضاحي",
                      imagePath: "assets/images/اضاحي.jpg",
                      subtitle:
                          """الأضحية هي شعيرة عظيمة في الإسلام، تُذبح في أيام عيد الأضحى تقربًا إلى الله تعالى وامتثالاً لأمره. إليك نبذة عن فضل الأضحية:

سنة مؤكدة: الأضحية سنة مؤكدة عن النبي صلى الله عليه وسلم، وقد ضحى النبي صلى الله عليه وسلم بكبشين أملحين، ويحث المسلمين على الأضحية في كل عام لمن استطاع.

إحياء لسنة إبراهيم عليه السلام: تذكرنا الأضحية بقصة إبراهيم عليه السلام وابنه إسماعيل عليه السلام، وكيف فدى الله إسماعيل بكبش عظيم. وهي تذكير للمسلمين بالطاعة المطلقة لله والتضحية في سبيله."""),
                  ServiceCard(
                      headtitle: "صدقات",
                      imagePath: "assets/images/صدقات.jpeg",
                      subtitle:
                          """الصدقة هي أحد أعظم الأعمال في الإسلام، ولها فضل كبير وأثر عظيم على المتصدق في الدنيا والآخرة. إليك نبذة عن فضل الصدقات:

مضاعفة الأجر: قال الله تعالى: "مَنْ ذَا الَّذِي يُقْرِضُ اللَّهَ قَرْضًا حَسَنًا فَيُضَاعِفَهُ لَهُ أَضْعَافًا كَثِيرَةً" (البقرة: 245). الله سبحانه وتعالى يضاعف أجر الصدقة أضعافًا كثيرة، مما يجعلها استثمارًا عظيمًا للآخرة.

تكفير الذنوب: قال رسول الله صلى الله عليه وسلم: "الصدقة تطفئ الخطيئة كما يطفئ الماء النار" (رواه الترمذي). الصدقة تساعد في محو الذنوب والخطايا وتطهير النفس من الآثام.

حماية من المصائب: قال رسول الله صلى الله عليه وسلم: "صنائع المعروف تق"""),
                  ServiceCard(
                      headtitle: "كفارات",
                      imagePath: "assets/images/كفارات.jpeg",
                      subtitle:
                          """الكفارات هي واجبات شرعية فرضها الإسلام على المسلم كتعويض عن بعض الذنوب أو الأخطاء التي قد يرتكبها، وهي تعتبر وسيلة لتطهير النفس وتكفير الذنوب وإصلاح النفس. إليك نبذة عن ضرورة الكفارات وأهميتها:

تكفير الذنوب: الكفارات تُفرض لتكفير الذنوب والمعاصي التي قد يرتكبها المسلم، مثل كفارة الإفطار في رمضان بغير عذر شرعي، وكفارة القتل الخطأ، وكفارة اليمين الغموس. قال الله تعالى: "ذَٰلِكَ كَفَّارَةُ أَيْمَانِكُمْ إِذَا حَلَفْتُمْ" (المائدة: 89)."""),
                  ServiceCard(
                      headtitle: "زكاه",
                      imagePath: "assets/images/زكاه.jpeg",
                      subtitle:
                          """الزكاة تطهر المال من الشح والبخل، وتطهر النفس من الأنانية وحب الذات. قال الله تعالى: "خُذْ مِنْ أَمْوَالِهِمْ صَدَقَةً تُطَهِّرُهُمْ وَتُزَكِّيهِمْ بِهَا" (التوبة: 103). بالزكاة ينقي المسلم ماله ويزيده بركة."""),
                  ServiceCard(
                      headtitle: "تبرع بالدم",
                      imagePath: "assets/images/تبرع بالدم.jpg",
                      subtitle:
                          """التبرع بالدم يمكن أن ينقذ حياة الأشخاص الذين يعانون من حالات حرجة مثل فقدان الدم بسبب الحوادث، العمليات الجراحية الكبيرة، والولادات المعقدة. كما يحتاج مرضى السرطان، والمرضى الذين يخضعون لغسيل الكلى، والأطفال المولودين قبل الأوان إلى نقل الدم بشكل منتظم."""),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

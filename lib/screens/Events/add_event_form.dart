import 'package:flutter/material.dart';
import 'package:ikigai/services/event_services.dart';

import '../components/formfield.dart';

class EventFormScreen extends StatefulWidget {
  const EventFormScreen({Key? key}) : super(key: key);

  @override
  _EventFormScreenState createState() => _EventFormScreenState();
}

class _EventFormScreenState extends State<EventFormScreen> {
  final TextEditingController _title = TextEditingController();
  final _formKey3 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Event"),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                  key: _formKey3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InputField(
                        topicName: "Title",
                        hinttext: "Learn Ui/Ux Design",
                        size: size,
                        fieldController: _title,
                        validator: (v) {
                          if (v!.length == 0) {
                            return 'Enter title';
                          } else {
                            return null;
                          }
                        },
                        inputIcon: Icons.drive_file_rename_outline,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: size.width * 0.3,
                        height: 50,
                        child: ElevatedButton(
                          child: const Text("Add Event"),
                          style: ButtonStyle(),
                          onPressed: () async {
                            if (_formKey3.currentState!.validate()) {
                              saveForm();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveForm() async {
    // Project project = Project(
    //     clientRepresentatives: [],
    //     projectDescription: _projectDescription.text,
    //     projectCode: _projectCode.text,
    //     projectName: _projectName.text,
    //     id: widget.project.id,
    //     projectStartDate: _startDate.text,
    //     projectEndDate: _endDate.text);

    var eventDetails = {};
    eventDetails["title"] = _title.text;
    eventDetails["user_registered"] = ["test"];
    EventServices es = EventServices();
    es.addEventsToFirebase(eventDetails);
    // await ProjectNetwork().editProject(project).then((value) {
    //   print('Value $value');
    //   /*  Provider.of<ProgressValue>(context, listen: false).progressOff();*/
    //   if (value == 200 || value == 202) {
    //     showSnackBar('Project updated successfully', context, Colors.green);
    //     Future.delayed(Duration(seconds: 2)).then((_) {
    //       Navigator.of(context).pop();
    //       Navigator.of(context).pop();
    //     });
    //   } else {
    //     showSnackBar('Error! $value', context, Colors.red);
    //   }
    // });
  }
}

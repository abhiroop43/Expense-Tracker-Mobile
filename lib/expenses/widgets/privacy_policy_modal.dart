import 'package:fluent_ui/fluent_ui.dart';

class PrivacyPolicyModal extends StatefulWidget {
  const PrivacyPolicyModal({super.key});

  @override
  State<PrivacyPolicyModal> createState() => _PrivacyPolicyModalState();
}

class _PrivacyPolicyModalState extends State<PrivacyPolicyModal> {
  final TextEditingController _textController = TextEditingController(
    text: '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mattis ullamcorper mi, quis condimentum lacus aliquam id. Integer quis lacus nec mi consequat tincidunt eu ut arcu. Mauris ullamcorper rhoncus mollis. Maecenas elementum malesuada justo quis interdum. Aenean scelerisque arcu ligula. Mauris molestie maximus sagittis. Morbi erat ex, accumsan vitae elit sed, tincidunt interdum risus. Suspendisse et velit dolor. Cras at vehicula lorem. Proin ullamcorper eget ligula nec sollicitudin. Pellentesque quis odio neque. Donec ultrices dapibus magna quis blandit. Maecenas euismod lacus sed felis aliquam pulvinar.

In eu elit eleifend, hendrerit erat semper, bibendum dui. Curabitur ipsum nisi, scelerisque non ex in, ornare sodales mi. In vel scelerisque est. Nam sit amet mi sed ante tristique congue vel vel nulla. Suspendisse tristique commodo turpis id molestie. Vestibulum auctor sem vitae nunc auctor pulvinar. Aenean tincidunt mauris sed tempus cursus. Praesent fermentum ante id congue posuere. Integer lobortis, turpis pharetra efficitur sagittis, tortor eros aliquam mi, sit amet eleifend elit urna ac metus.

Vestibulum laoreet auctor libero molestie laoreet. Vivamus molestie metus in tempor tempus. In tincidunt ante a egestas hendrerit. Nunc non sem euismod, ornare tortor et, viverra eros. Vestibulum sit amet nisi leo. Aenean ut hendrerit diam. Praesent nisl dolor, accumsan ac ex a, convallis tincidunt nisl. Duis ultricies, dui nec lacinia faucibus, nibh felis condimentum ligula, eleifend aliquet velit sapien vitae justo. Etiam gravida mattis ipsum non blandit.

Duis laoreet, nisi at ornare ultricies, tortor lacus eleifend mauris, in blandit urna diam vel erat. Aliquam erat volutpat. Mauris ultricies massa sed consectetur efficitur. Cras tincidunt aliquet massa sit amet convallis. Praesent ornare scelerisque mollis. Pellentesque fringilla consequat tellus, a viverra urna sollicitudin vitae. Nulla vitae pharetra nisl. Cras ut arcu leo. Vestibulum placerat lobortis tortor, vitae pellentesque nisl tincidunt in. Quisque vitae pulvinar eros. Integer suscipit metus mauris, eget pulvinar lacus blandit quis. Nullam velit ex, rutrum eu efficitur a, eleifend molestie purus. Mauris suscipit nulla justo, a vestibulum ante convallis ac. Quisque nisl tellus, tristique in eros sit amet, porta mattis nulla. Vivamus sit amet massa at lectus ultrices scelerisque. Etiam eu sodales nulla.

Mauris at nisi justo. Nam vitae diam in sapien cursus dictum. Suspendisse et lorem erat. In blandit dolor dui, et auctor lectus imperdiet ac. Nunc congue, eros eget blandit efficitur, eros mauris venenatis lorem, ut viverra leo neque scelerisque est. Donec dolor justo, tempor sit amet lacus a, viverra lobortis neque. Fusce euismod nisi nunc, at pulvinar eros dictum sit amet. Sed scelerisque lacus vitae metus commodo facilisis. Ut volutpat venenatis molestie. Nam a vehicula diam. Donec malesuada tincidunt odio. Cras tristique nisl eget efficitur blandit. Curabitur semper sem elit, et fringilla dolor malesuada a. Vivamus porta ac dolor sit amet feugiat. Donec accumsan nunc libero. Etiam tellus odio, ultricies in ullamcorper non, maximus sed ante.
''',
  );
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Acrylic(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: screenHeight * 0.75,
              child: Container(
                margin: EdgeInsets.all(screenHeight * 0.02),
                child: TextBox(
                  maxLines: null,
                  readOnly: true,
                  controller: _textController,
                ),
              ),
            ),
            FilledButton(
              child: const Text('Close'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}

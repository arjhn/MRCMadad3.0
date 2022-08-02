import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mrc_madad_3/constants/text_styles/text_style_app_bar.dart';
import 'package:mrc_madad_3/constants/text_styles/text_style_app_preferences.dart';
import 'package:mrc_madad_3/constants/variables/constant_variable.dart';
import 'package:mrc_madad_3/providers/provider_locale.dart';
import 'package:mrc_madad_3/ui/reusable_components/drop_down_underline.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DialogBoxPreferences extends StatefulWidget {
  const DialogBoxPreferences({Key? key}) : super(key: key);

  @override
  _DialogBoxPreferencesState createState() => _DialogBoxPreferencesState();
}

class _DialogBoxPreferencesState extends State<DialogBoxPreferences> {

  late Size size;
  TextEditingController _dropDownController=TextEditingController();

  @override
  Widget build(BuildContext context) {

    size=MediaQuery.of(context).size;

    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      backgroundColor: Colors.transparent,
      child: buildPreferencesList(),
    );
  }

  Consumer buildPreferencesList() {
    return Consumer<ProviderLocale>(
      builder: (context, refOfProviderLocale,_) {
        return Center(
          child: Container(
            height: size.height*0.3,
            width: size.height*0.3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Text(AppLocalizations.of(context)?.preferencesLanguage ?? 'Language',
                style: TextStyleAppPreferences().styleOfAppPreferences[refOfProviderLocale.appLocale.toString()]),
                DropDownUnderLine(
                    dropField: ConstantVariables().languageList,
                    controllerDDT: _dropDownController,
                    labelTextString: 'Language',
                    dropDownVal:ConstantVariables().reverseValMap[refOfProviderLocale.appLocale.toString()] ?? 'English',
                    callOnChange: (String value){
                      refOfProviderLocale.setAppLocale(ConstantVariables().valMap[value] ?? 'en');
                    }
                ),
                ElevatedButton(
                    onPressed: (){
                        Navigator.of(context).pop();
                    },
                    child: Text('Save')
                )
              ],
            ),
          ),
        );
      }
    );
  }
}

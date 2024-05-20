Padding
(
padding: EdgeInsets.only(top: 30.0, left: 40),
child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
children: [
Expanded(
child: Padding(
padding: const EdgeInsets.all(8.0),
child: ReusableTextFieldWidget(
formkeyy: fnamekey,
name: 'First Name',
controller: fname,
keyboardtype: TextInputType.text,
validator: (nme) {
if (nme!.isEmpty) {
return "This field is required";
} else if (nme.length < 4) {
return "Atleast 3 characters required";
} else {
return null;
}
},
),
),
),
Expanded(
child: Padding(
padding: const EdgeInsets.all(8.0),
child: ReusableTextFieldWidget(
formkeyy: lnamekey,
name: 'Last Name',
controller: fname,
validator: (nme) {
if (nme!.isEmpty) {
return "This field is required";
} else if (nme.length < 4) {
return "Atleast 3 characters required";
} else {
return null;
}
},
),
),
)
],
),
)
,
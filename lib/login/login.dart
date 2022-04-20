import 'package:e_mahsul_flutter/home.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController txtEmail =  TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  // txtEmail , txtPassword;


  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 100.0),
          Text(
            "E - Mahsül",
            style: TextStyle(
              color: Colors.lightGreen,
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 100.0),
          Text(
            "Giriş yap",
            style: TextStyle(
                color: Color(0xFF499032),
                fontSize: 30.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 44.0),
          TextField(
            controller: txtEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "E-mail",
              prefixIcon: Icon(
                Icons.mail,
                color: Color(0xFF499032),
              ),
            ),
          ),
          SizedBox(height: 24.0),
          TextField(
            controller: txtPassword,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "şifre",
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xFF499032),
              ),
            ),
          ),
          SizedBox(height: 15.0),
          Text(
            "Şifreni mi unuttun?",
            style: TextStyle(color: Color(0xFF0E3468)),
          ),

          SizedBox(height: 25),


// ---------------------  Giriş Butonu----------------------- //
          Container(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              //width: double.infinity,
              children: [


                Expanded(
                  child : RawMaterialButton(

                    fillColor: Color(0xFF499032),
                    elevation: 0.0,
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    onPressed: (){

                      if(txtEmail.text == "serif" && txtPassword.text == "123")
                      {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
                        print(txtPassword.text);
                      }
                      else
                      {

                        Scaffold.of(context).showSnackBar(new SnackBar(
                          content: new Text("lütfen boş alan bırakmayınız!"),
                        ));


                      }

                    },
                    child: Text("Giriş",
                        style: TextStyle(color: Colors.white,
                          fontSize: 18.0,)),
                  ),
                ),

                SizedBox(width: 15),

                Expanded(
                  child: RawMaterialButton(
                    fillColor: Color(0xFF61B368),
                    elevation: 0.0,
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    onPressed: (){


                        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterPage()));
                        print("kayıt ol tıklandı");


                    },
                    child: Text("Kayıt Ol",
                        style: TextStyle(color: Colors.white,
                          fontSize: 18.0,)),
                  ),
                ),
              ],
            ),


          ),



        ],
      ),
    );
  }
}
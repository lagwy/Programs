package itesm.mx.apis_te;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class Registro extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_registro);

        // Declaración de variables de interfaz
        final EditText nombreET = (EditText) findViewById(R.id.nombreRegistroET);
        final EditText emailET = (EditText) findViewById(R.id.correoRegistroET);
        final EditText passwordET = (EditText) findViewById(R.id.passwordRegistroET);
        final EditText confirmaPwdET = (EditText) findViewById(R.id.confirmapwdRegistroET);
        final Button registraBtn = (Button) findViewById(R.id.registroBtn);
        final Button regresaBtn = (Button) findViewById(R.id.backRegistroBtn);

        View.OnClickListener buttonListener = new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (registraBtn.isPressed()){
                    String sNombreRegistro = nombreET.getText().toString();
                    String sEmailRegistro = emailET.getText().toString();
                    String sPasswordRegistro = passwordET.getText().toString();
                    String sConfirmaPwdRegistro = confirmaPwdET.getText().toString();
                    if (revisaVacio(sNombreRegistro) && revisaVacio(sEmailRegistro)
                            && revisaVacio(sPasswordRegistro) && revisaVacio(sConfirmaPwdRegistro)){
                        if (samePwd(sPasswordRegistro,sConfirmaPwdRegistro)){
                            Toast.makeText(getApplicationContext(), "Datos completos",
                                    Toast.LENGTH_SHORT).show();
                            // Aquí se llama el registro de la base de datos
                            new Insertar(Registro.this, sNombreRegistro, sEmailRegistro, sPasswordRegistro).execute();
                        } else {
                            Toast.makeText(getApplicationContext(), "Los campos de contraseña no" +
                                    "coinciden.",
                                    Toast.LENGTH_SHORT).show();
                        }

                    } else{
                        Toast.makeText(getApplicationContext(), "No están completos los campos",
                                Toast.LENGTH_SHORT).show();
                    }
                }
                if (regresaBtn.isPressed()){
                    finish();
                }
            }
        };

        registraBtn.setOnClickListener(buttonListener);
        regresaBtn.setOnClickListener(buttonListener);
    }

    Boolean revisaVacio(String string){
        if (string.trim().matches(""))
            return false;
        return true;
    }

    Boolean samePwd(String pwd, String confirm){
        if(pwd.matches(confirm))
            return true;
        return false;
    }

    private boolean inserta(String sNombre, String sEmail, String sPassword){
        HttpClient httpClient;
        List<NameValuePair> nameValuePairList;
        HttpPost httpPost;
        httpClient = new DefaultHttpClient();
        httpPost = new HttpPost("http://lagwy.com/teaville/inserta.php");
        // Añadir los datos
        nameValuePairList new ArrayList<NameValuePair>(3);
        nameValuePairList.add(new BasicNameValuePair("nombre",sNombre));
        nameValuePairList.add(new BasicNameValuePair("email",sEmail));
        nameValuePairList.add(new BasicNameValuePair("password", sPassword));

        try {
            httpPost.setEntity(new UrlEncodedFormEntity(nameValuePairList));
            httpClient.execute(httpPost);
            return true;
        } catch (UnsupportedEncodingException e){
            e.printStackTrace();
        } catch (ClientProtocolException e){
            e.printStackTrace();
        } catch (IOException e){
            e.printStackTrace();
        }
        return false;
    }

    class Insertar extends AsyncTask<String, String, String>{
        private Activity context;
        private String sNombre;
        private String sEmail;
        private String sPassword;

        Insertar(Activity context, String sNombre, String sEmail, String sPassword){
            this.context = context;
            this.sNombre = sNombre;
            this.sEmail = sEmail;
            this.sPassword = sPassword;
        }

        @Override
        protected String doInBackground(String... params){
            if(inserta(sNombre, sEmail, sPassword))
                context.runOnUiThread(new Runnable(){
                @Override
                    public void run(){
                    Toast.makeText(context, "Usuario agregado con éxito". Toast.LENGHT_SHORT).show();
                }
            });
            else
                context.runOnUiThread(new Runnable){
                @Override
                        public void run(){
                    Toast.makeText(context, "No fue posible insertar el usuario", Toast.LENGHT_SHORT).show();
                }
            });
        }
        return null;
    }
}

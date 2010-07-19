package edu.brandeis.cs.evulfson;

import edu.brandeis.cs.evulfson.R;
import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

/**
 * 
 * @author Eugene Wolfson
 * HW 17a, RandomDemo
 * Displays a random decimal number from 0 to 1,
 * 	shift by a user-provided amount.
 *
 */
public class RandomDemo extends Activity implements OnClickListener{
    // Declare variables which will hold UI elements.
    Button go;
    EditText base;
    TextView result;
	
    /**
     * @param savedInstanceState
     * Called when the activity is first created.
     * Sets the layout and assigns listeners to the go button.
     */
    @Override
	public void onCreate(Bundle savedInstanceState) {
	super.onCreate(savedInstanceState);
	setContentView(R.layout.main);

	//Assign variables  
	go = (Button) findViewById(R.id.go);
	base = (EditText) findViewById(R.id.base);
	result = (TextView) findViewById(R.id.result);
		
	// Set listener
	go.setOnClickListener(this);
		
    }

    /**
     * Calculates result: rand + base, 
     * 	where base is a floating number given by the user and rand is [0,1) 
     * If base isn't a number, catches the exception. 
     *  Currently doesn't report the error to the user, but it should.
     */
    public void onClick(View v) {
	try{
	    if(v.getId() == go.getId()){
		String rand = String.valueOf(
				Double.valueOf(base.getText().toString()) + Math.random());
		result.setText(rand);
	    }
	}
	catch (Exception e) {
	    //TODO:Display an alert that base needs to be a number.
	}
    }
}
package edu.brandeis.cs.evulfson;

import android.app.Activity;
import android.os.Bundle;

/**
 * Shows the about screen. Sets the content view to the about layout.
 */
public class About extends Activity {
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.about);
	}
}

package edu.brandeis.cs.evulfson;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.content.Intent;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;

/**
 * 
 * @author Eugene Wolfson HW 18b, Laser Tag For now, just a start screen with a
 *         menu
 * 
 */
public class LaserTag extends Activity implements OnClickListener {

	/**
	 * Called when the activity is first created. Sets the view for this
	 * activity to that in R.layout.main
	 */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);

		// Set up click listeners for buttons
		View newButton = findViewById(R.id.new_button);
		newButton.setOnClickListener(this);
		View aboutButton = findViewById(R.id.about_button);
		aboutButton.setOnClickListener(this);
		View exitButton = findViewById(R.id.exit_button);
		exitButton.setOnClickListener(this);

	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		super.onCreateOptionsMenu(menu);
		MenuInflater inflater = getMenuInflater();
		inflater.inflate(R.menu.menu, menu);
		return true;
	}

	/**
	 * Called when a user selects a menu item. 
	 */
	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
		case R.id.settings: 
			startActivity(new Intent(this, Prefs.class));
			return true;
			// More items go here (if any) ...
		}
		return false;
	}

	/**
	 * Resolves the click on a view v: about_button -> shows an about screen
	 * play_button -> shows the game screen
	 * 
	 * @param v
	 *            the view that was clicked on.
	 */
	public void onClick(View v) {
		// TODO Auto-generated method stub
		switch (v.getId()) {
		case R.id.new_button:
			startGame();
			break;
		case R.id.about_button:
			Intent i = new Intent(this, About.class);
			startActivity(i);
			break;
		case R.id.exit_button:
			finish();
			break;
		}
	}
	
	/**
	 * Starts a new game through an intent.
	 */
	private void startGame(){
		Intent intent = new Intent(LaserTag.this, Game.class);
		startActivity(intent);
	}
}

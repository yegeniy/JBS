package edu.brandeis.cs.evulfson;

import android.app.Activity;
import android.os.Bundle;


public class Game extends Activity{
	
	private GameView gameView;
	
	/**
	 * Set the view and focus to GameView.
	 */
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		
		gameView = new GameView(this);
		setContentView(gameView);
		gameView.requestFocus();
	}
}

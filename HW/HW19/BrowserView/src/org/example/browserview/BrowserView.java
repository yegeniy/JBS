/***
 * Excerpted from "Hello, Android! 2e",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/eband3 for more book information.
 ***/
package org.example.browserview;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnKeyListener;
import android.webkit.WebView;

import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;

import android.widget.Button;
import android.widget.EditText;

/**
 * @author Eugene Wolfson
 * HW 19a, Browser View with Bookmark list.
 * The browser view example from hello android with a modification:
 *  You can view a list of bookmarks saved in Android's browser through the menu
 * 
 */
public class BrowserView extends Activity {
    private EditText urlText;
    private Button goButton;
    private WebView webView;

    // ...

    /**
     * Sets layout to main.xml and prepares the go_button and url_field listeners
     */
    @Override
	public void onCreate(Bundle savedInstanceState) {
	// ...
	super.onCreate(savedInstanceState);
	setContentView(R.layout.main);

	// Get a handle to all user interface elements
	urlText = (EditText) findViewById(R.id.url_field);
	goButton = (Button) findViewById(R.id.go_button);
	webView = (WebView) findViewById(R.id.web_view);
	// ...

	// Setup event handlers
	goButton.setOnClickListener(new OnClickListener() {
		public void onClick(View view) {
		    openBrowser();
		}
	    });
	urlText.setOnKeyListener(new OnKeyListener() {
		public boolean onKey(View view, int keyCode, KeyEvent event) {
		    if (keyCode == KeyEvent.KEYCODE_ENTER) {
			openBrowser();
			return true;
		    }
		    return false;
		}
	    });
    }

    /**
     * Inflates the menu when menu button is clicked.
     */
    @Override
	public boolean onCreateOptionsMenu(Menu menu) {
	super.onCreateOptionsMenu(menu);
	MenuInflater inflater = getMenuInflater();
	inflater.inflate(R.menu.menu, menu);
	return true;
    }

    /**
     * Reacts to a user choosing an option from the menu.
     */
    @Override
	public boolean onOptionsItemSelected(MenuItem item) {
	switch (item.getItemId()) {
	case R.id.bookmarks:
	    startActivity(new Intent(this, Bookmarks.class));
	    return true;
	    // More items go here (if any) ...
	}
	return false;
    }

    /** 
     * Open a browser on the URL specified in the text box 
     */
    private void openBrowser() {
	webView.getSettings().setJavaScriptEnabled(true);
	webView.loadUrl(urlText.getText().toString());
    }
}

package org.example.browserview;

import android.app.ListActivity;
import android.database.Cursor;
import android.os.Bundle;
import android.provider.Browser;
import android.widget.SimpleCursorAdapter;

/**
 * A list of bookmarks stored in Android's browser.
 * Uses the tutorial at http://www.higherpass.com/Android/Tutorials/Creating-Lists-Using-The-Android-Listactivity/
 */
public class Bookmarks extends ListActivity {
    

    /**
     * Called when the activity is first created. Sets the layout to bookmarks
     * and populates the list with the Browser's bookmarks
     * Uses a simple_list_item_single_choice layout to limit the display size of bookmarks with long URLs/Titles
     * 
     * A string array called projection populated with Android SDK constants for the database columns that we want to retrieve. 
     * A string array called displayFields holds the fields that will be displayed in the view. 
     * 	The displayFields works with the displayViews integer array that will tell the view where to place the data from the cursor.
     * 	The order of the displayFields and displayViews arrays are important. 
     * 	The positions of each array relate what data gets placed into each view element. 
     * 	In this case the bookmark title goes into the text1 field and the URL goes into the text2 field. 
     */
    public void onCreate(Bundle savedInstanceState) {
	super.onCreate(savedInstanceState);
	setContentView(R.layout.bookmarks);

	String[] projection = new String[] { Browser.BookmarkColumns._ID,
					     Browser.BookmarkColumns.TITLE, Browser.BookmarkColumns.URL };

	String[] displayFields = new String[] { Browser.BookmarkColumns.TITLE,
						Browser.BookmarkColumns.URL };

	int[] displayViews = new int[] { android.R.id.text1, android.R.id.text2 };

	Cursor cur = managedQuery(android.provider.Browser.BOOKMARKS_URI,
				  projection, null, null, null);

	setListAdapter(new SimpleCursorAdapter(this,
					       android.R.layout.simple_list_item_single_choice, cur, displayFields,
					       displayViews));

    }
}

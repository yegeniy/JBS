package edu.brandeis.cs.evulfson;

import android.os.Bundle;
import android.preference.PreferenceActivity;
/**
 * Shows the settings screen. Currently just sets the preferences screen from the settings resource
 */
public class Prefs extends PreferenceActivity {
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		addPreferencesFromResource(R.xml.settings);
	}
}

package org.example.mymap;


import java.io.IOException;
import java.util.List;

import android.app.ListActivity;
import android.content.Context;
import android.database.Cursor;
import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.SimpleCursorAdapter;

import android.location.Address;
import android.location.Geocoder;

public class NearAddr extends ListActivity {
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		// setContentView(R.layout.main);
		setContentView(R.layout.near_addr);
		
		List<Address> nearbyAddresses = findNearbyAddresses(, );// FIXME: Pass in lat, and lng
		
		setListAdapter(new ArrayAdapter(this,
				android.R.layout.simple_list_item_1, nearbyAddresses));
	}
	
	final int maxResults = 5;

	private List<Address> findNearbyAddresses(double latitude, double longitude) {
		Geocoder g = new Geocoder(getApplicationContext());
		try {
			return g.getFromLocation(latitude, longitude, maxResults);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}

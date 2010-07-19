/***
 * Excerpted from "Hello, Android! 2e",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/eband3 for more book information.
 ***/
package org.example.mymap;

import android.content.Intent;
import android.os.Bundle;
import com.google.android.maps.MapActivity;
import com.google.android.maps.MapController;
import com.google.android.maps.MapView;
import com.google.android.maps.MyLocationOverlay;
import com.google.android.maps.GeoPoint;
import android.widget.Button;
import android.widget.TextView;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;

public class MyMap extends MapActivity implements OnClickListener {
	private MapView map;
	private MapController controller;
	private Button go;
	private TextView position;
	private MyLocationOverlay overlay;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
		initMapView();
		initMyLocation();
		go = (Button) findViewById(R.id.go);
		position = (TextView) findViewById(R.id.position);
		go.setOnClickListener(this);
	}

	public void onClick(View v) {
		switch (v.getId()) {
		case R.id.go:
			updatePosition();
			break;
		case R.id.near_addr:
			startNearAddr();
		default:
			Log.d("MyMap", "should not be here...");
		}
	}

	/**
	 * Starts the near_addr activity
	 */
	private void startNearAddr() {
		// TODO Auto-generated method stub
		Intent intent = new Intent(MyMap.this, NearAddr.class);
		
		latitude =  
		intent.putExtra();
		startActivity(intent);
	}

	/*
	 * look up the current position and write it on to the area
	 */
	private void updatePosition() {
		GeoPoint g = overlay.getMyLocation();
		position.setText("pos = " + g.toString());

	}

	/** Find and initialize the map view. */
	private void initMapView() {
		map = (MapView) findViewById(R.id.map);
		controller = map.getController();
		map.setSatellite(false);
		map.setBuiltInZoomControls(true);
	}

	/** Start tracking the position on the map. */
	private void initMyLocation() {
		overlay = new MyLocationOverlay(this, map);
		overlay.enableMyLocation();
		// overlay.enableCompass(); // does not work in emulator
		overlay.runOnFirstFix(new Runnable() {
			public void run() {
				// Zoom in to current location
				controller.setZoom(8);
				controller.animateTo(overlay.getMyLocation());
			}
		});
		map.getOverlays().add(overlay);
	}

	@Override
	protected boolean isRouteDisplayed() {
		// Required by MapActivity
		return false;
	}

	/**
	 * Inflate menu on click of the menu button
	 */
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		super.onCreateOptionsMenu(menu);
		MenuInflater inflater = getMenuInflater();
		inflater.inflate(R.menu.menu, menu);
		return true;
	}

	/**
	 * Respond to choice of a menu item
	 */
	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
		case R.id.near_addr:
			startActivity(new Intent(this, NearAddr.class));
			return true;
			// More items go here (if any) ...
		}
		return false;
	}

}

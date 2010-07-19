package edu.brandeis.cs.evulfson;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Path.Direction;
import android.view.View;

/**
 * Defines the view for a game of Laser Tag.
 * Draws a crosshair on the screen.
 */
public class GameView extends View{

	private final Game game;
	

	
	public GameView(Context context){
		super(context);
		this.game = (Game) context;
		setFocusable(true);
		setFocusableInTouchMode(true);
	}
	
	/**
	 * Set a background color.
	 * Draw a crosshair as an overlay
	 */
	@Override
	protected void onDraw(Canvas canvas) {
		setBackgroundColor(getResources().getColor(R.color.background));
		drawCrosshair(canvas);
		
	}
	

	/**
	 * Draw a crosshair on canvas by drawing
	 * 	one outer circle and then an inner one of background color to create a ring
	 * N.B.: We can just as easily use the Path() class with the addCircle method here, but it's easier to draw directly on the canvas
	 * @param canvas
	 */
	private void drawCrosshair(Canvas canvas) {
		int outerRadius = ( getWidth() <= getHeight() ) ? getWidth()/4 : getHeight()/4; // Radius of crosshair should be a quarter of the smallest dimension.
		int ringWidth = outerRadius/10;
		int innerRadius = outerRadius-ringWidth;
		
		int xCenter = getWidth()/2;
		int yCenter = getHeight()/2;
		
		//Draw outer circle
		Paint outerPaint = new Paint();
		outerPaint.setColor(getResources().getColor(R.color.crosshair));
		
		canvas.drawCircle(xCenter, yCenter, outerRadius, outerPaint);

		
		// Draw inner circle
		Paint innerPaint = new Paint();
		innerPaint.setColor(getResources().getColor(R.color.background));
		
		canvas.drawCircle(xCenter, yCenter, innerRadius, innerPaint);
		
	}
	
}

package root.magicword;

import java.util.List;

import root.magicword.speech.SpeechGatheringActivity;
import root.magicword.speech.TextSpeakerAndroid;
import android.os.Bundle;
import android.speech.tts.TextToSpeech.OnUtteranceCompletedListener;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class MagicWord extends SpeechGatheringActivity implements OnUtteranceCompletedListener
{
    private TextSpeakerAndroid speaker;
    
    private TextView result;
    
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) 
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        
        speaker = new TextSpeakerAndroid(this);
        
        Button speak = (Button)findViewById(R.id.bt_speak);
        speak.setOnClickListener(new View.OnClickListener()
        {
            //@Override
            public void onClick(View v)
            {
               gatherSpeech();
            }
        });
        
        result = (TextView)findViewById(R.id.tv_result);
    }
    
    //@Override
    public void onUtteranceCompleted(String utteranceId)
    {
        //done speaking, execute some ui updates on the UIthread
    }
    
    /**
     * Builds up a response base on if-else statements
     * @param lastThingsHeard is a list of strings holding the list of possible words that were heard. 
     */
    public void receiveWhatWasHeard(List<String> lastThingsHeard)
    {
    	String proximity = null;
    	String magicWord = this.getResources().getString(R.string.magicword);
    	String toSay = null;
        if (lastThingsHeard.size() == 0)
        {
            toSay+="Heard nothing";
        }
        else
        {
            String mostLikelyThingHeard = lastThingsHeard.get(0);
            
            if (mostLikelyThingHeard.equals(magicWord))
            {
                toSay+="You said the magic word!";
            }
            else
            {
                toSay+="It's not " + mostLikelyThingHeard + " try again";
            }
           
            // Announce if magicWord is on the list of latest things heard, but isn't at the top.
            if(lastThingsHeard.contains(magicWord)){
            	proximity = "But you are pretty close...";
            	toSay+="But you're pretty close...";
            }
        }
        speaker.say(toSay,this);
        result.setText("heard: " + lastThingsHeard); //+
        		//"\nThe magic word is: " + magicWord + proximity);
        //speaker.say("I'm done speaking", this);// TODO: What is "this"
    }

    
}
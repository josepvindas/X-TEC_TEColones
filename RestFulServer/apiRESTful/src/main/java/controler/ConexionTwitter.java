package controler;

import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;

import java.io.IOException;

public class ConexionTwitter {
    public ConexionTwitter() {
    }

    public static void twittear(String Material, String Usuario,String ck, String cs, String at, String ats, String tweet)  {
        try {
            String msg = tweet.replace("estudiante",Usuario);
            String twt= msg.replace("material",Material);
            Twitter twitter;
            ConfigurationBuilder cb = new ConfigurationBuilder();
            cb.setDebugEnabled(true)
                    .setOAuthConsumerKey(ck)
                    .setOAuthConsumerSecret(cs)
                    .setOAuthAccessToken(at)
                    .setOAuthAccessTokenSecret(ats);
            twitter = new TwitterFactory(cb.build()).getInstance();
            Status tweetEscrito = twitter.updateStatus(twt);
        }
        catch (TwitterException e){

        }


    }
}

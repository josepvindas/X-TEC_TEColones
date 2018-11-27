package controler;

import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;

public class conexionTwitterCompartir {
    public conexionTwitterCompartir(){}

    public static void twittear(String Usuario,String ck, String cs, String at, String ats, String tweet)  {
        try {
            String msg = tweet.replace("estudiante",Usuario);
            Twitter twitter;
            ConfigurationBuilder cb = new ConfigurationBuilder();
            cb.setDebugEnabled(true)
                    .setOAuthConsumerKey(ck)
                    .setOAuthConsumerSecret(cs)
                    .setOAuthAccessToken(at)
                    .setOAuthAccessTokenSecret(ats);
            twitter = new TwitterFactory(cb.build()).getInstance();
            Status tweetEscrito = twitter.updateStatus(msg);
        }
        catch (TwitterException e){

        }


    }
}


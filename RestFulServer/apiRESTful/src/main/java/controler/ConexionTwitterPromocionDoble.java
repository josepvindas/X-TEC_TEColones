package controler;

import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;

public class ConexionTwitterPromocionDoble {
    public ConexionTwitterPromocionDoble(){}
    public static void twittear(String pidpromocion,String material1,String material2, String ck, String cs, String at, String ats, String tweet, String bono, String cantidad1, String cantidad2, String fechainicio, String fechafinal)  {
        try {
            String msg = tweet.replace("cantidad1",cantidad1);
            String msg2 = msg.replace("material1",material1);
            String msg3 = msg2.replace("cantidad2",cantidad2);
            String msg4 = msg3.replace("material2",material2);
            String msg5= msg4.replace("bono",bono);
            String msg6 = msg5.replace("fechainicio",fechainicio);
            String twt = msg6.replace("fechafinal",fechafinal);
            String twti = twt.replace("pid",pidpromocion);
            Twitter twitter;
            ConfigurationBuilder cb = new ConfigurationBuilder();
            cb.setDebugEnabled(true)
                    .setOAuthConsumerKey(ck)
                    .setOAuthConsumerSecret(cs)
                    .setOAuthAccessToken(at)
                    .setOAuthAccessTokenSecret(ats);
            twitter = new TwitterFactory(cb.build()).getInstance();
            Status tweetEscrito = twitter.updateStatus(twti);
        }
        catch (TwitterException e){

        }


    }

}

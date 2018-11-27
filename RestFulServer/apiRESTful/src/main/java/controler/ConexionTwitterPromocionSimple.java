package controler;

import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;

public class ConexionTwitterPromocionSimple {
    public ConexionTwitterPromocionSimple(){}
    public static void twittear(String idpromocion,String material,String ck, String cs, String at, String ats, String tweet, String bono, String cantidad, String fechainicio, String fechafinal)  {
        try {
            String msg = tweet.replace("cantidad",cantidad);
            String msg2 = msg.replace("material",material);
            String msg3= msg2.replace("bono",bono);
            String msg4 = msg3.replace("fechainicio",fechainicio);
            String twt = msg4.replace("fechafinal",fechafinal);
            String twti = twt.replace("pid",idpromocion);
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

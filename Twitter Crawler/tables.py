create_profile_table = """                
        CREATE TABLE IF NOT EXISTS profile ( 
                    id INTEGER PRIMARY KEY NOT NULL, \
                    name VARCHAR(100),  \
                    screen_name VARCHAR(100), \
                    description TEXT, \
                    followers_count INTEGER, \
                    friends_count INTEGER, \
                    account_created_at TIMESTAMP, 
                    time_scraped TIMESTAMP);
        """
        

create_tweets_table = """
        CREATE TABLE IF NOT EXISTS tweets ( 
                        tweet_sending_time TIMESTAMP, \
                        tweet_id INTEGER, \
                        tweet_content TEXT, \
                        username TEXT, \
                        screen_name TEXT, \
                        location TEXT, \
                        description TEXT, \
                        follower_counts INTEGER, \
                        friends_count INTEGER, \
                        listed_count INTEGER, \
                        favourites_count INTEGER, \
                        twitter_account_created_at TIMESTAMP, \
                        user_id INTEGER,
                        time_scraped TIMESTAMP); 
        """

create_followers_table = """
        CREATE TABLE IF NOT EXISTS followers ( 
                        follower_id INTEGER NOT NULL, \
                        follower_name TEXT, \
                        follower_account_created_at TIMESTAMP, \
                        follower_description TEXT, \
                        user_screen_name TEXT, \
                        scrap_time TIMESTAMP); 
"""

create_friends_table = """
        CREATE TABLE IF NOT EXISTS friends ( 
                        follower_id INTEGER NOT NULL, \
                        follower_name TEXT, \
                        follower_account_created_at TIMESTAMP, \
                        follower_description TEXT, \
                        user_screen_name TEXT, \
                        scrap_time TIMESTAMP); 
"""


create_keyword_tweets_table = """
        CREATE TABLE IF NOT EXISTS keyword_tweets (
                       tweet_sending_time TIMESTAMP, \
                       tweet_id INTEGER, \
                       tweet_content INTEGER, \
                       retweet_count INTEGER, \
                       favorite_count INTEGER, \
                       hashtags TEXT, \
                       symbols TEXT, \
                       user_name TEXT, \
                       user_id INTEGER, \
                       screen_name TEXT, \
                       location TEXT, \
                       description TEXT, \
                       followers_count INTEGER, \
                       friends_count INTEGER, \
                       twitter_account_created_at TIMESTAMP, \
                       user_lang TEXT, \
                       time_scraped TIMESTAMP);
                       """
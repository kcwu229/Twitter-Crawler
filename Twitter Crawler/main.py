# Provide absolte on File path
import os
from pathlib import Path
import sys

# GUI setting
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal, QUrl

# Data Extraction
import tweepy 

# Data Trandsformation
import pandas as pd      
import json
import time              
import tables     
import json_attributes
import column_names
from datetime import timedelta, datetime

# Data Load
import sqlite3  

class MainWindows(QObject):
    """
    This program is designed to provide 3 dimensions to user to 
    1. Search for profile info. like name, id and number of followers
    2. Search tweet content of that person and it's popularity
    3. Filter the tweet content that meets with the keywords
    """
    
    def __init__(self):
        QObject.__init__(self)
        self.nextpage = False
        self.path = os.path.dirname(os.path.abspath(__file__))

    """ Setup 1: Data to backend """
    @Slot(str, str, str, str)
    def checkLogin(self, consumer_key, consumer_secret, access_token, access_token_secret):
        try:
            auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
            auth.set_access_token(access_token, access_token_secret)
            self.api = tweepy.API(auth)
            self.api.auth.get_authorization_url()
            self.signalLogin.emit(True)

        except:
            self.signalLogin.emit(False)

    """ Setup 2: Back to frontend: Text results """
    # Signal Set Name
    setName = Signal(str)
    setName2 = Signal(str)
    setName3 = Signal(str)
    signalLogin = Signal(bool)

    setPageNumber = Signal(int)

    # Signal Visible
    isVisible = Signal(bool)

    # Open File To Text Edit
    readText = Signal(str)

    # Text String
    textField = ""

    """ Read data from frontend: Query input """
    @Slot(str)
    def openFile(self, filePath):
        file = open(QUrl(filePath).toLocalFile(), encoding="utf-8")
        text = file.read()
        file.close()
        self.readText.emit(str(text))

    # Read Text
    @Slot(str)
    def getTextField(self, text):
        self.textField = text

    @Slot(str)
    def getTextField2(self, text):
        self.textField2 = text

    @Slot(str)
    def getTextField3(self, text):
        self.textField3 = text

    # Show / Hide Rectangle
    @Slot(bool)
    def showHideRectangle(self, isChecked):
        self.isVisible.emit(isChecked)

    # Function Set Name To Label
    @Slot(str)
    def replyText(self, name):
        self.setName.emit(f"Recent search:\t{name}\t{self.scrap_info(name)}")

    @Slot(str)
    def replyText2(self, name_and_page):
        self.setName2.emit(f"Recent search:\t{name_and_page} \t{self.search_user_past_tweets(name_and_page)}")
        self.setName2.emit(self.followers_list())
        self.setName2.emit(self.friends_list())

    @Slot(str)
    def replyText3(self, keywords):
        self.setName3.emit(f"Recent search:\t{keywords} \t{self.keywords_search(keywords)}")


    """ Setup 2: Setting command:  Tasks in project"""

    # task 1: user's profile
    def scrap_info(self, name):
        """To make a nest list to record every user's profile data by looping, and
            \nterminate this loop and transform them into dataframe to SQL\n\n
            First, there is a instruction to ask you to enter the username you want to query or to quit if you finish the\n
            checking\n\n
            1) type the user name you want to search
            2) Click the search button and wait for execution\n
            Then your data is recorded in a database !!!!"""
        
        # Check whether the program who run safety 
        try:
            user = self.api.get_user(screen_name=name, tweet_mode="extended")       # profile data extraction
            list_to_dataframe = []
            self.setName3.emit("Now processing... Please wait")

            json_string = json.dumps(user._json)             # Json to String
            json_to_dictionary = json.loads(json_string)     # String to Dict -> get values easily

            for element in json_attributes.task1_lists:
                if element == "scrap_time":
                    list_to_dataframe.append(time.strftime("%Y-%m-%d %H:%M:%S"))

                elif element == "created_at":
                    time_slot = json_to_dictionary[element].split("+0000")
                    a, b = (time_slot[0]).strip(), (time_slot[-1]).strip()
                    time_string = a + " " + b
                    utc_time = datetime.strptime(time_string, "%a %b %d %H:%M:%S %Y")
                    hk_time = utc_time + timedelta(hours=8)
                    list_to_dataframe.append(hk_time)

                else:
                    list_to_dataframe.append(json_to_dictionary[element])  # extract dict value and to list

            conn = sqlite3.connect(f"{self.path}\\DataBase\\database.db")            # connect sqlite server and create database
            cursor = conn.cursor()                                         # execute query 

            cursor.execute(tables.create_profile_table)

            df = pd.DataFrame([list_to_dataframe], columns=column_names.task1_columns)
            df.to_sql("profile", conn, if_exists='append', index=False)    # DataFrame to SQLite (when open program next time append data in an existed instead of overwrite)
            conn.commit()
            return "\nFinish ! Please go to check your database file."


        # Avoid the program to crash
        except tweepy.errors.NotFound:            # username not found
            return "User not found !!!"

        except tweepy.errors.Forbidden:
            return "User has been suspended ! "   # suspend username 

        except sqlite3.IntegrityError:            # data already exist (primary constriant)
            return "\nData already existed in profile table\n"

        except AttributeError:                    # call tweepy function without aurthorization
            return "You have not yet activate API !!!"


    # task2: tweets
    def search_user_past_tweets(self, name_and_page):
        """To make a nest list to record every user's tweet content and other user info. by looping, and
            \nterminate this loop and transform them into dataframe to SQL\n\n
            First, there is a instruction to ask you to enter the username you want to query or to quit if you finish the\n
            checking\n\n
            1) type one name in each ask \n
            2) type the number of page (1 pages contains 20 tweets), you can set for 20-30 pages for 2 years ago and up to now
            3) Or type finish to call profile data execution\n
            Then your data is recorded in a database !!!!"""

        # what user send
        # what user send
        list_to_dataframe1 = []
        try:
            list_ = name_and_page.split(",")
            self.name = list_[0].strip()
            page = int(list_[1].strip())

            for pages in tweepy.Cursor(self.api.user_timeline, screen_name=self.name, tweet_mode="extended").pages(int(page)):
                for page in pages:
                    each_tweet = []
                    json_string = json.dumps(page._json)
                    json_to_dictionary = json.loads(json_string)
                    flatten_json = pd.json_normalize(json_to_dictionary)     # make searching in json become more sufficient


                    for element in json_attributes.task2_lists:
                        if element == "scrap_time":
                            each_tweet.append(time.strftime("%Y-%m-%d %H:%M:%S"))

                        elif element == "created_at" or element == "user.created_at":
                            time_slot = (flatten_json[element][0].split("+0000"))
                            a, b = (time_slot[0]).strip(), (time_slot[-1]).strip()
                            time_string = a + " " + b
                            utc_time = datetime.strptime(time_string, "%a %b %d %H:%M:%S %Y")
                            hk_time = utc_time + timedelta(hours=8)
                            each_tweet.append(hk_time)

                        else:
                            element = str(flatten_json[element][0])
                            each_tweet.append(element)
                            
                    list_to_dataframe1.append(each_tweet)

            conn = sqlite3.connect(f"{self.path}\\DataBase\\database.db")
            cursor = conn.cursor()  

            cursor.execute(tables.create_tweets_table)
            df = pd.DataFrame(list_to_dataframe1, columns=column_names.task2_columns)
            df.to_sql("tweets", conn, if_exists="append", index=False)  
            conn.commit() 
            return "\nFinish part 1"

        except TypeError:                     
            return "\nPlease enter the answer in a correct type: number !!!!"

        except tweepy.errors.NotFound:             
            return "User not found !!!"

        except tweepy.errors.Forbidden:           
            return "User has been suspended ! "  

        except sqlite3.OperationalError:     
            pass

        except AttributeError:                
            return "You have not yet activate API !!!"

        except tweepy.errors.Unauthorized:
            return "401 Unauthorized"
        
        except IndexError:                    # incorrect typing format
            return "Please write in correct format !!!"
   
    def followers_list(self):
        """To make a nest list to record user's followers (20, to prvent excceding the rate limit) and other user info. by looping, and
            #\nterminate this loop and transform them into dataframe to SQL\n\n"""
        list_to_dataframe2 = []

        try:
            for follower in self.api.get_followers(screen_name=self.name, count=2000):
                each_tweet = []
                json_string = json.dumps(follower._json)             # Json to String
                json_to_dictionary = json.loads(json_string)

                for element in json_attributes.task2_followers_list:
                    if element == "follower_screen_name":
                        each_tweet.append(self.name)

                    elif element == "scrap_time":
                        each_tweet.append(time.strftime("%Y-%m-%d %H:%M:%S"))

                    elif element == "created_at":
                        time_slot = json_to_dictionary[element].split("+0000")
                        a, b = (time_slot[0]).strip(), (time_slot[-1]).strip()
                        time_string = a + " " + b
                        utc_time = datetime.strptime(time_string, "%a %b %d %H:%M:%S %Y")
                        hk_time = utc_time + timedelta(hours=8)
                        each_tweet.append(hk_time)

                    else:
                        each_tweet.append(json_to_dictionary[element])

                list_to_dataframe2.append(each_tweet)

            conn = sqlite3.connect(f"{self.path}\\DataBase\\database.db")
            cursor = conn.cursor() 
            cursor.execute(tables.create_followers_table)
            df = pd.DataFrame(list_to_dataframe2, columns=column_names.task2_followers_columns)
            df.to_sql("followers", conn, if_exists="append", index=False)  
            conn.commit() 
            return "\nFinish part 2"
        
        except TypeError:                     
            return "\nPlease enter the answer in a correct type: number !!!!"

        except tweepy.errors.NotFound:             
            return "User not found !!!"

        except tweepy.errors.Forbidden:           
            return "User has been suspended ! "  

        except sqlite3.OperationalError:     
            pass

        except AttributeError:                
            return "You have not yet activate API !!!"

        except tweepy.errors.Unauthorized:
            return "401 Unauthorized"
        
        except IndexError:                    # incorrect typing format
            return "Please write in correct format !!!"

    def friends_list(self):
        # function document
        """To make a nest list to record user's friends (20, to prvent excceding the rate limit) and other user info. by looping, and
            \nterminate this loop and transform them into dataframe to SQL\n\n"""
        """friend_list = []
        for friend in tweepy.Cursor(self.api.get_friends, screen_name=self.name).items(20):
            friend_list.append(friend)
        info = []
        info.extend(self.api.lookup_users(user_id=friend_list))
        json_string = json.dumps(info._json)             # Json to String
        json_to_dictionary = json.loads(json_string)
        print(json_to_dictionary["id"])"""
        list_to_dataframe3=[]
        try:
            for friend in self.api.get_friends(screen_name=self.name,count=48):
                each_fd = []
                json_string = json.dumps(friend._json)             
                json_to_dictionary = json.loads(json_string)

                for element in json_attributes.task2_friends_list:
                    if element == "friend_screen_name":
                        each_fd.append(self.name)

                    elif element == "scrap_time":
                        each_fd.append(time.strftime("%Y-%m-%d %H:%M:%S"))

                    elif element == "created_at":
                        time_slot = json_to_dictionary[element].split("+0000")
                        a, b = (time_slot[0]).strip(), (time_slot[-1]).strip()
                        time_string = a + " " + b
                        utc_time = datetime.strptime(time_string, "%a %b %d %H:%M:%S %Y")
                        hk_time = utc_time + timedelta(hours=8)
                        each_fd.append(hk_time)

                    else:
                        each_fd.append(json_to_dictionary[element])

                list_to_dataframe3.append(each_fd)

            conn = sqlite3.connect(f"{self.path}\\DataBase\\database.db")
            cursor = conn.cursor() 
            cursor.execute(tables.create_friends_table)
            df = pd.DataFrame(list_to_dataframe3, columns=column_names.task2_friends_columns)
            df.to_sql("friends", conn, if_exists="append", index=False)  
            conn.commit() 
            return "\nFinish ! Please go to check your database file."

        except TypeError:                     
            return "\nPlease enter the answer in a correct type: number !!!!"

        except tweepy.errors.NotFound:             
            return "User not found !!!"

        except tweepy.errors.Forbidden:           
            return "User has been suspended ! "  

        except sqlite3.OperationalError:     
            pass

        except AttributeError:                
            return "You have not yet activate API !!!"

        except tweepy.errors.Unauthorized:
            return "401 Unauthorized"
        
        except IndexError:                    # incorrect typing format
            return "Please write in correct format !!!"

    # task 3: search keywords
    def keywords_search(self, keywords):
    # function document
        """To make a nest list to record every user's tweet content and other user info. by looping, and
            \nterminate this loop and transform them into dataframe to SQL\n\n
            First, there is a instruction to ask you to enter the username you want to query or to quit if you finish the\n
            checking\n\n
            1) type one name in each ask \n
            2) type the number of page (1 pages contains 20 tweets), you can set for 20-30 pages for 2 years ago and up to now
            3) Or type finish to call profile data execution\n
            Then your data is recorded in a database !!!!"""
        try:
            list_to_dataframe4 = []
            keyword_list = keywords.split(",")
            for i, keyword in enumerate(keyword_list):
                keyword_list[i] = keyword.strip()
                for pages in tweepy.Cursor(self.api.search_tweets, q=keyword, tweet_mode="extended").pages(20):
                            for page in pages:
                                each_tweet = []
                                json_string = json.dumps(page._json)
                                json_to_dictionary = json.loads(json_string)
                                flatten_json = pd.json_normalize(json_to_dictionary)

                                for element in json_attributes.task3_lists:
                                    if element == "scrap_time":
                                        each_tweet.append(time.strftime("%a %b %d %Y %H:%M:%S"))

                                    elif element == "created_at" or element == "user.created_at":
                                        time_slot = (flatten_json[element][0].split("+0000"))
                                        a, b = (time_slot[0]).strip(), (time_slot[-1]).strip()
                                        time_string = a + " " + b
                                        utc_time = datetime.strptime(time_string, "%a %b %d %H:%M:%S %Y")
                                        hk_time = utc_time + timedelta(hours=8)
                                        each_tweet.append(hk_time)
                                    
                                    else:
                                        element = str(flatten_json[element][0])
                                        each_tweet.append(element)
                                list_to_dataframe4.append(each_tweet)
        

            conn = sqlite3.connect(f"{self.path}\\DataBase\\database.db")
            cursor = conn.cursor()                

            cursor.execute(tables.create_keyword_tweets_table)
            df = pd.DataFrame(list_to_dataframe4, columns=column_names.task3_columns)
            df.to_sql("keyword_tweets", conn, if_exists="append", index=False)
            conn.commit()  # update data
            return "\nFinish !!!!  Please go to check your database file."

        except TypeError:
            return "\nPlease enter in a correct type"

        except tweepy.errors.NotFound:  
            return "User not found !!!"

        except tweepy.errors.Forbidden:
            return "User has been suspended ! "
        
        except tweepy.errors.Unauthorized:
            return "401 Unauthorized"
            

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    main = MainWindows()
    engine.rootContext().setContextProperty("backend", main)

    engine.load(os.fspath(Path(__file__).resolve().parent / "qml/main.qml"))

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
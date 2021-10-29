import json
import tweepy
import sqlite3
import pandas as pd

consumer_key = "M7NS5nExt5tyfFA0dGL65KHyU"
consumer_secret = "CmGwDXv6WvM79dkKIx1UZwE15YJI532ktCBXq3zMX1Azfe7JFj"

access_token = "3039143238-K3GIEUOMM13dC1vjdvXJMSgz9289ncF3mgDapZb"
access_token_secret = "mwXNcK8OUX4Uxx5aNRqGEk28A1P5OjExvHOuoxApGohsF"

BEAR_TOKEN ="AAAAAAAAAAAAAAAAAAAAAJJOUgEAAAAAhoFc8pc2lrrM5MXowXeW%2BmTKht0%3D5gbSSX0MB3fuGQ18FSiREkfKGyOvwVVHzgqCFdAwWjypLXHbyK"

auth = tweepy.OAuthHandler(consumer_key,  consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)

for friend in api.get_friends(screen_name='joebiden',count=48):
    print (friend.screen_name)
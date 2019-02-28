import got3 as got
import os
from datetime import datetime

if __name__ == '__main__':
    today = datetime.now().strftime('%Y-%m-%d')

    q = os.environ['GOT_QUERY']\
            if os.environ.get('GOT_QUERY') is not None else 'DUMMY'
    since = os.environ['GOT_SINCE'] \
            if os.environ.get('GOT_SINCE') is not None else today
    until = os.environ['GOT_UNTIL'] \
            if os.environ.get('GOT_UNTIL') is not None else today
    max_tweets = int(os.environ['GOT_MAX_TWEETS']) \
            if os.environ.get('GOT_MAX_TWEETS') is not None else 100

    tweetCriteria = got.manager.TweetCriteria().setQuerySearch(q).setSince(since).setUntil(until).setMaxTweets(max_tweets)
    tweets = got.manager.TweetManager.getTweets(tweetCriteria)
    for tweet in tweets:
        print(str(tweet.date) + '::::' + tweet.text)

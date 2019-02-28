# GetOldTweets-docker

## Build

```
$ docker build -t got ./
```

## Run

```
$ docker run --name got_container -d got tail -f /dev/null
```

## Get old tweets

```
$ docker exec -e GOT_QUERY=ドラえもん -e GOT_SINCE=2019-02-01 -e GOT_UNTIL=2019-02-28
 -e GOT_MAX_TWEETS=100 -it got_container /root/run.sh | head -3
2019-02-27 23:42:31::::裏番組にドラえもんが来る日にエスパー魔美アクセント問題でひと盛り上がり # nhk_suppin
2019-02-27 23:42:07::::ドラえもん発売からもう1年かぁ
2019-02-27 23:42:07::::〈噂話〉ドラえもんの正体 ある日ドラえもんが故障してしまう。のび太はそれを修理しようと必死にロボット工学を
学ぶ。そして自らドラえもんを作りあげた。そう、ドラえもんを発明したのはのび太自身だったのだ。
```

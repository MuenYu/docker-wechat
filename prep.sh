PinyinInput="sogou-pinyin.deb"
ImageName="parasomnia/docker-wechat"
ImageTag="latest"

set -e

# download sougou pinyin input deb
if [ -f $PinyinInput ]; then
    echo "Pinyin input is downloaded"
else
    curl -o $PinyinInput https://ime-sec.gtimg.com/202510012126/4a16df144559d5df52a57e327066ff91/pc/dl/gzindex/1680521603/sogoupinyin_4.2.1.145_amd64.deb
fi

# build image
docker buildx build --platform linux/amd64 -t $ImageName:$ImageTag .

# push to dockerhub
docker push $ImageName:$ImageTag

# バージョン
FROM ubuntu

# パッケージインストール
RUN apt update \
RUN apt install -y \
	build-essential \
	lib32stdc++6 \
	lib32z1

# タイムゾーン設定
ENV TZ Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# ファイルコピー
ADD toolchain.tgz /home/user/toolchain/

# 起動毎に実行
WORKDIR /home/user
CMD make

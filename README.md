# Laurent's Read Me

Codes to run in terminal:

To listen to files added in directory to change name in case it contains None to avoid overwriting:
chmod +x scripts/file_watcher.sh
./scripts/file_watcher.sh

Leave this running in a tab then open a new tab to run the following:
docker build --no-cache --platform linux/amd64 -t nsfw_data_scraper:custom .
gallery-dl --clear-cache reddit
docker run -it --rm --platform linux/amd64 -v "$(pwd):/root/nsfw_data_scraper" nsfw_data_scraper:custom /bin/bash

service tor restart

bash /root/nsfw_data_scraper/scripts/runall.sh





Launch the vpn to avoid ip address block if needed such as with Norton Security VPN or such. How to check current IP in terminal:
curl ifconfig.me
To know your local machine ip address for file sharing:
ipconfig getifaddr en0
To transfer dataset to desktop to train model afterword, make sure on mac file sharing is on in settings, that in options things are configured and the folder is in shared
To check gpu and memory usage:
watch -n 1 nvidia-smi
To delete all .Identifier file in a folder:
find . -name "*.Identifier" -type f -delete
Download the right Cuda here:
https://developer.nvidia.com/cuda-11-8-0-download-archive?target_os=Linux&target_arch=x86_64&Distribution=WSL-Ubuntu&target_version=2.0&target_type=deb_network
For my set up, select: Linux, x86_64 WSL-Ubuntu 2.0 deb(network)


.config/gallery-dl/config.json
Should look like this (get the data from reddit api developer for installed app key):
Current Redirect URL: https://localhost:6414
Have to create an installed app in reddit developer to get credentials
Get the refresh token with gallery-dl oauth:reddit

{
  "extractor": {
    "reddit": {
      "username": "",
      "password": "",
      "client-id": "",
      "refresh-token": "",
      "user-agent": "Python:gallery-dl:v1.0 (by /u/username)",
      "filter": "nsfw:true"
    }
  },
  "http": {
    "proxy": "socks5://127.0.0.1:9050"
  }
}


Needed to run this in terminal:
brew install yt-dlp
brew install bc
brew install telnet
brew install nmap
brew install fswatch

At the location of the directory when doing: head -n 1 "$(which gallery-dl)"
Do the following depending on directory gotten above: /usr/local/Cellar/gallery-dl/1.27.7/libexec/bin/python -m pip install yt-dlp
brew install ffmpeg

brew install selenium
sudo rm -rf /Applications/Firefox.app
brew install --cask firefox
brew install geckodriver
brew install tor
brew services start tor
brew install torsocks


Create the python script for selenium: fallback_selenium.py



Dockerfile 
Should look like this for mac OS with M1 Chip:

FROM --platform=linux/amd64 ubuntu:18.04

RUN apt-get update && apt-get install -y \
    wget \
    rsync \
    imagemagick \
    default-jre \
    python3 \
    python3-pip \
    bash \
    qemu-user-static \
    locales \
    ffmpeg \
    bc \
    curl \
    tor \
    firefox \
    xvfb \
    && rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

RUN update-binfmts --enable qemu-x86_64

RUN pip3 install --upgrade gallery-dl yt-dlp selenium requests beautifulsoup4

RUN wget -q "https://github.com/mozilla/geckodriver/releases/latest/download/geckodriver-v0.33.0-linux64.tar.gz" -O geckodriver.tar.gz \
    && tar -xzf geckodriver.tar.gz -C /usr/local/bin \
    && rm geckodriver.tar.gz

RUN echo "SOCKSPort 9050" >> /etc/tor/torrc && \
    echo "Log notice stdout" >> /etc/tor/torrc

WORKDIR /root/nsfw_data_scraper

COPY ./ /root/nsfw_data_scraper

COPY .config/gallery-dl/config.json /root/.config/gallery-dl/config.json

RUN chmod 644 /root/.config/gallery-dl/config.json

RUN chmod +x /root/nsfw_data_scraper/scripts/*.sh

CMD service tor start && /bin/bash



Other useful commands:
killall -9 tor
lsof -i :9050
ps aux | grep tor
kill -9 <PID>
tor &

brew services restart tor


COOKIE=$(cat /usr/local/var/lib/tor/control_auth_cookie | xxd -p -c 64 | tr -d '\n')
echo -e "AUTHENTICATE $COOKIE\nSIGNAL NEWNYM\nQUIT" | nc 127.0.0.1 9051

To initialize the python environment to try out a script:
python3 -m venv venv
source venv/bin/activate
pip install selenium requests beautifulsoup4
pip install pysocks
pip install --upgrade pip
pip install -U gallery-dl

To try it out after having already run the venv with pip before:
python3 -m venv venv
source venv/bin/activate
python3 fallback_selenium.py "url" "./output"

Other useful tor commands:
stat --printf="%s\n" /usr/local/var/lib/tor/control_auth_cookie
xxd -ps /usr/local/var/lib/tor/control_auth_cookie | wc -c
COOKIE=$(xxd -ps /usr/local/var/lib/tor/control_auth_cookie)
echo "Cookie length: ${#COOKIE}"
python3 -c "print(len(open('/usr/local/var/lib/tor/control_auth_cookie', 'rb').read()))"
ls -l /usr/local/var/lib/tor/control_auth_cookie
service tor restart


Useful AI commands:
pip show tensorflow
lsb_release -a
uname -m
cat /proc/version
wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-keyring_1.0-1_all.deb
sudo dpkg -i cuda-keyring_1.0-1_all.deb
sudo apt-get update
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo apt-get update
sudo apt-get -y install cuda
To clear cache after running the model if the memory is through the roof:
sudo sync && sudo sysctl -w vm.drop_caches=3
pip install numba
pip install matplotlib
nmap -sP [IP]
ping [IP]
nmap -p 22 [IP]
nmap -p- [IP]
nmap -sV [IP]
nmap -T4 -p- [IP]






# READ ME FROM NSFW Data Scraper

## Note: use with caution - the dataset is noisy

## Description

This is a set of scripts that allows for an automatic collection of _tens of thousands_ of images for the following (loosely defined) categories to be later used for training an image classifier:
- `porn` - pornography images
- `hentai` - hentai images, but also includes pornographic drawings
- `sexy` - sexually explicit images, but not pornography. Think nude photos, playboy, bikini, etc.
- `neutral` - safe for work neutral images of everyday things and people
- `drawings` - safe for work drawings (including anime)

Here is what each script (located under `scripts` directory) does:
- `1_get_urls_.sh` - iterates through text files under `scripts/source_urls` downloading URLs of images for each of the 5 categories above. The `ripme` application performs all the heavy lifting. The source URLs are mostly links to various subreddits, but could be any website that Ripme supports.
*Note*: I already ran this script for you, and its outputs are located in `raw_data` directory. No need to rerun unless you edit files under `scripts/source_urls`.
- `2_download_from_urls_.sh` - downloads actual images for urls found in text files in `raw_data` directory.
- `3_optional_download_drawings_.sh` - (optional) script that downloads SFW anime images from the [Danbooru2018](https://www.gwern.net/Danbooru2018) database.
- `4_optional_download_neutral_.sh` - (optional) script that downloads SFW neutral images from the [Caltech256](http://www.vision.caltech.edu/Image_Datasets/Caltech256/) dataset
- `5_create_train_.sh` - creates `data/train` directory and copy all `*.jpg` and `*.jpeg` files into it from `raw_data`. Also removes corrupted images.
- `6_create_test_.sh` - creates `data/test` directory and moves `N=2000` random files for each class from `data/train` to `data/test` (change this number inside the script if you need a different train/test split). Alternatively, you can run it multiple times, each time it will move `N` images for each class from `data/train` to `data/test`.

## Prerequisites

- Docker

## How to collect data

```bash
$ docker build . -t docker_nsfw_data_scraper
Sending build context to Docker daemon  426.3MB
Step 1/3 : FROM ubuntu:18.04
 ---> 775349758637
Step 2/3 : RUN apt update  && apt upgrade -y  && apt install wget rsync imagemagick default-jre -y
 ---> Using cache
 ---> b2129908e7e2
Step 3/3 : ENTRYPOINT ["/bin/bash"]
 ---> Using cache
 ---> d32c5ae5235b
Successfully built d32c5ae5235b
Successfully tagged docker_nsfw_data_scraper:latest
$ # Next command might run for several hours. It is recommended to leave it overnight
$ docker run -v $(pwd):/root/nsfw_data_scraper docker_nsfw_data_scraper scripts/runall.sh
Getting images for class: neutral
...
...
$ ls data
test  train
$ ls data/train/
drawings  hentai  neutral  porn  sexy
$ ls data/test/
drawings  hentai  neutral  porn  sexy
```

## How to train a CNN model
- Install [fastai](https://github.com/fastai/fastai): `conda install -c pytorch -c fastai fastai`
- Run `train_model.ipynb` top to bottom

## Results

I was able to train a CNN classifier to 91% accuracy with the following confusion matrix:

![alt text](confusion_matrix.png)

As expected,  `drawings` and `hentai` are confused with each other more frequently than with other classes.

Same with `porn` and `sexy` categories.


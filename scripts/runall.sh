#for f in $(ls /root/nsfw_data_scraper/scripts/*_*_.sh)
#do
#	bash $f
#done


for f in $(ls /root/nsfw_data_scraper/scripts/1_*_.sh /root/nsfw_data_scraper/scripts/2_*_.sh /root/nsfw_data_scraper/scripts/3_*_.sh /root/nsfw_data_scraper/scripts/4_*_.sh /root/nsfw_data_scraper/scripts/5_*_.sh /root/nsfw_data_scraper/scripts/6_*_.sh)
do
    bash $f
done

#for f in $(ls /root/nsfw_data_scraper/scripts/1_*_.sh)
#do
#    bash $f
#done

#for f in $(ls
#    /root/nsfw_data_scraper/scripts/1_*_.sh
#    /root/nsfw_data_scraper/scripts/2_*_.sh
##    /root/nsfw_data_scraper/scripts/3_*_.sh
##    /root/nsfw_data_scraper/scripts/4_*_.sh
#    /root/nsfw_data_scraper/scripts/5_*_.sh
#    /root/nsfw_data_scraper/scripts/6_*_.sh
#)
#do
#    bash $f
#done

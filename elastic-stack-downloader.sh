# !/bin/bash

### SCRIPT BY XYPERIA ###
echo "Elastic Stack Downloader. By XYPERIA :)"
echo "Enter ELK Version : "
read version

echo "1=RPM, 2=DEB, 3=MacOS"
read type

case $type in
1)extension="x86_64.rpm"
;;
2)extension="amd64.deb"
;;
3)extension="darwin-x86_64.tar.gz"
;;
*)
echo "Invalid Options!"
exit
;;
esac

read -p "Download all Elastic Beat? [y/n] " beatanswer

user=`whoami`
dldir="/home/$user/Downloads/"$version"/"
mkdir -p $dldir

elasticsearchurl="https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-"$version"-"$extension
kibanaurl="https://artifacts.elastic.co/downloads/kibana/kibana-"$version"-"$extension
logstashurl="https://artifacts.elastic.co/downloads/logstash/logstash-"$version"-"$extension
linuxagenturl="https://artifacts.elastic.co/downloads/beats/elastic-agent/elastic-agent-"$version"-linux-x86_64.tar.gz"
windowsagenturl="https://artifacts.elastic.co/downloads/beats/elastic-agent/elastic-agent-"$version"-windows-x86_64.zip"

clear
echo "Downloading Elasticsearch (1 of 5)"
curl -# -o $dldir/elasticsearch-$version-$extension $elasticsearchurl

clear
echo "Downloading Kibana (2 of 5)"
curl -# -o $dldir/kibana-$version-$extension $kibanaurl

clear
echo "Downloading Logstash (3 of 5)"
curl -# -o $dldir/logstash-$version-$extension $logstashurl

clear
echo "Downloading Elastic Agent Linux (4 of 5)"
curl -# -o $dldir/elastic-agent-linux-$version-$extension $linuxagenturl

clear
echo "Downloading Elastic Agent Windows (5 of 5)"
curl -# -o $dldir/elastic-agent-windows-$version-$extension $windowsagenturl

if [[ $beatanswer = y ]] ; then
    filebeaturl="https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-"$version"-"$extension
    metricbeaturl="https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-"$version"-"$extension
    packetbeaturl="https://artifacts.elastic.co/downloads/beats/packetbeat/packetbeat-"$version"-"$extension
    auditbeaturl="https://artifacts.elastic.co/downloads/beats/auditbeat/auditbeat-"$version"-"$extension
    heartbeaturl="https://artifacts.elastic.co/downloads/beats/heartbeat/heartbeat-"$version"-"$extension
    winlogbeaturl="https://artifacts.elastic.co/downloads/beats/winlogbeat/winlogbeat-"$version"-windows-x86_64.zip"

    clear
    echo "Downloading Filebeat (1 of 6)"
    curl -# -o $dldir/filebeat-$version-$extension $filebeaturl

    clear
    echo "Downloading Metricbeat (2 of 6)"
    curl -# -o $dldir/metribeat-$version-$extension $metricbeaturl

    clear
    echo "Downloading Packetbeat (3 of 6)"
    curl -# -o $dldir/packetbeat-$version-$extension $packetbeaturl

    clear
    echo "Downloading Auditbeat (4 of 6)"
    curl -# -o $dldir/auditbeat-$version-$extension $auditbeaturl

    clear
    echo "Downloading Heartbeat (5 of 6)"
    curl -# -o $dldir/heartbeat-$version-$extension $heartbeaturl

    clear
    echo "Downloading Winlogbeat (6 of 6)"
    curl -# -o $dldir/winlogbeat-$version-$extension $winlogbeaturl
fi

clear
echo "Download Completed!"
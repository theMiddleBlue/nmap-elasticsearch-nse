# Nmap Elasticsearch NSE
Nmap NSE script for enumerating indices, plugins and cluster nodes on an elasticsearch target

### Install
```bash
$ # clone repo from github 
$ git clone https://github.com/theMiddleBlue/nmap-elasticsearch-nse.git

$ # copy elasticsearch.nse script on nmap/script directory
$ cp nmap-elasticsearch-nse/elasticsearch.nse /usr/share/nmap/scripts/
```


### Usage
```bash
$ nmap --script=elasticsearch <target>
```

### Output
```bash
$ nmap -p9200 --script=elasticsearch 10.0.1.11

Starting Nmap 7.01 ( https://nmap.org ) at 2018-06-17 16:42 CEST
Nmap scan report for 10.0.1.11
Host is up (0.00086s latency).
PORT     STATE SERVICE
9200/tcp open  wap-wsp
| elasticsearch: by theMiddle (Twitter: @Menin_TheMiddle)
| 
| found RESTful API
| version: 6.2.4
| cluster name: mycluster
| 
| Indices found in /_cat/indices:
| health index                       docs.count
| green  logstash-2018.06.10               4151
| green  logstash-2018.06.14               3329
| green  logstash-2018.06.09               3545
| green  logstash-2018.06.16               1648
| green  logstash-2018.06.17               1665
| green  logstash-2018.06.11              10993
| green  logstash-2018.06.12               4611
| green  .kibana                             37
| green  logstash-2018.06.13               4282
| green  logstash-2018.06.08               1175
| green  logstash-2018.06.15               2867
| 
| Plugins found in /_cat/plugins:
| es2-asm3 ingest-geoip      6.2.4
| es2-asm3 ingest-user-agent 6.2.4
| es1-asm3 ingest-geoip      6.2.4
| es1-asm3 ingest-user-agent 6.2.4
| es1-fra1 ingest-geoip      6.2.4
| es1-fra1 ingest-user-agent 6.2.4
| es2-fra1 ingest-geoip      6.2.4
| es2-fra1 ingest-user-agent 6.2.4
| 
| Nodes found in /_cat/nodes:
| 10.0.1.10 59 91  9 0.12 0.13 0.12 mdi - es2-asm3
| 10.0.1.10 79 91  9 0.12 0.13 0.12 mdi - es1-asm3
| 10.0.1.11  69 94 23 0.72 0.57 0.55 mdi * es1-fra1
| 10.0.1.11  69 94 23 0.72 0.57 0.55 mdi - es2-fra1
| 
| Nodes process:
|  - Name: es2-fra1
|  - Transport Address: 10.0.1.11:9301
|  - Host: 10.0.1.11
|  - IP: 10.0.1.11
|  - Version: 6.2.4
| 
|  - Name: es1-asm3
|  - Transport Address: 10.0.1.10:9300
|  - Host: 10.0.1.10
|  - IP: 10.0.1.10
|  - Version: 6.2.4
| 
|  - Name: es1-fra1
|  - Transport Address: 10.0.1.11:9300
|  - Host: 10.0.1.11
|  - IP: 10.0.1.11
|  - Version: 6.2.4
| 
|  - Name: es2-asm3
|  - Transport Address: 10.0.1.10:9301
|  - Host: 10.0.1.10
|  - IP: 10.0.1.10
|  - Version: 6.2.4
|_

Nmap done: 1 IP address (1 host up) scanned in 3.44 seconds
```

### Author
**theMiddle**<br>
**Twitter**: [https://twitter.com/Menin_TheMiddle](https://twitter.com/Menin_TheMiddle)<br>
**Blog**: [https://medium.com/@themiddleblue](https://medium.com/@themiddleblue)<br>



1.第一行修改为:

server_name: "域名"
public_baseurl: "https://matrix.域名"
serve_server_wellknown: true

2.数据库修改为:

database:
  name: psycopg2
  txn_limit: 10000
  args:
    user: synapse_user
    password: hello
    database: synapse
    host: postgres
    port: 5432
    cp_min: 5
    cp_max: 10
    
    
3.本行:media_store_path: /data/media_store 后加

uploads_path: /data/uploads


4.本行修改为:report_stats: false  true

5.最后加

url_preview_enabled: true
url_preview_ip_range_blacklist:
  - '127.0.0.0/8'
  - '10.0.0.0/8'
  - '172.16.0.0/12'
  - '192.168.0.0/16'
  - '100.64.0.0/10'
  - '192.0.0.0/24'
  - '169.254.0.0/16'
  - '192.88.99.0/24'
  - '198.18.0.0/15'
  - '192.0.2.0/24'
  - '198.51.100.0/24'
  - '203.0.113.0/24'
  - '224.0.0.0/4'
  - '::1/128'
  - 'fe80::/10'
  - 'fc00::/7'
  - '2001:db8::/32'
  - 'ff00::/8'
  - 'fec0::/10'

url_preview_url_blacklist:
  - scheme: 'http'
  - netloc: '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$'

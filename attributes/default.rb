default['apache']['ServerTokens'] =  'Prod'
default['apache']['ServerRoot'] =  '/etc/httpd'
default['apache']['PidFile'] =  'run/httpd.pid'
default['apache']['Timeout'] = 60
default['apache']['KeepAlive'] =  'Off'
default['apache']['MaxKeepAliveRequests'] = 100
default['apache']['KeepAliveTimeout'] = 15

#Apache Server Tuning Variables
default['apache']['StartServers'] = 8
default['apache']['MinSpareServers'] = 5
default['apache']['MaxSpareServers'] = 20
default['apache']['ServerLimit'] = 256
default['apache']['MaxClients'] = 256
default['apache']['MaxRequestsPerChild'] = 4000

#Apache Server Tuning Variables
default['apache']['WorkerStartServers'] = 4
default['apache']['WorkerMaxClients'] = 300
default['apache']['MinSpareThreads'] = 25
default['apache']['MaxSpareThreads'] = 75
default['apache']['ThreadsPerChild'] = 25
default['apache']['WorkerMaxRequestsPerChild'] = 0

default['apache']['port'] = 80
default['apache']['Include'] =  'conf.d/*.conf'
default['apache']['user'] =  'apache'
default['apache']['group'] =  'apache'

default['apache']['ServerAdmin'] =  'root@localhost'

default['apache']['UseCanonicalName'] =  'Off'

default['apache']['DocumentRoot'] =  '/var/www/html'

default['apache']['RootDirectory'] =  '/'
default['apache']['IconsDirectory'] =  '/var/www/icons/'
default['apache']['ScriptsDirectory'] =  '/var/www/cgi-bin/'
default['apache']['ErrorDirectory'] =  '/var/www/error/'

default['apache']['OptionFollowSymlinks'] =  'FollowSymLinks'
default['apache']['OptionAllowOverride'] =  'None'
default['apache']['OptionIndexes'] =  '-Indexes'
default['apache']['OptionMultiViews'] =  'MultiViews'
default['apache']['OptionNone'] =  'None'

default['apache']['Order'] =  'allow,deny'
default['apache']['Allow'] =  'from all'
default['apache']['Deny'] =  'from all'
default['apache']['Satisfy'] =  'All'

default['apache']['UserDir'] =  'disabled'

default['apache']['DirectoryIndex'] =  'index.html'
default['apache']['AccessFileName'] =  '.htaccess'

default['apache']['TypesConfig'] =  '/etc/mime.types'
default['apache']['DefaultType'] =  'text/plain'

default['apache']['MIMEMagicFile'] =  'conf/magic'

default['apache']['HostnameLookups'] =  'Off'

default['apache']['ErrorLog'] =  'logs/error_log'

default['apache']['LogLevel'] =  'warn'

default['apache']['LogLocation'] =  'logs/access_log'
default['apache']['LogType'] =  'combined'

default['apache']['ServerSignature'] =  'Off'

default['apache']['DAVLockDB'] =  '/var/lib/dav/lockdb'
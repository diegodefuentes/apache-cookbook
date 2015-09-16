### Section 1: Global Environment
#
# The directives in this section affect the overall operation of Apache,
# such as the number of concurrent requests it can handle or where it
# can find its configuration files.
#

#
# Don't give away too much information about all the subcomponents
# we are running.  Comment out this line if you don't mind remote sites
# finding out what major optional modules you are running
default['apache']['ServerTokens'] =  'Prod'
#
# ServerRoot: The top of the directory tree under which the server's
# configuration, error, and log files are kept.
#
# NOTE!  If you intend to place this on an NFS (or otherwise network)
# mounted filesystem then please read the LockFile documentation
# (available at <URL:http://httpd.apache.org/docs/2.2/mod/mpm_common.html#lockfile>);
# you will save yourself a lot of trouble.
#
# Do NOT add a slash at the end of the directory path.
#
default['apache']['ServerRoot'] =  '/etc/httpd'

#
# PidFile: The file in which the server should record its process
# identification number when it starts.  Note the PIDFILE variable in
# /etc/sysconfig/httpd must be set appropriately if this location is
# changed.
#
default['apache']['PidFile'] =  'run/httpd.pid'

#
# Timeout: The number of seconds before receives and sends time out.
#
default['apache']['Timeout'] = 60

#                                                                                 
# KeepAlive: Whether or not to allow persistent connections (more than            
# one request per connection). Set to "Off" to deactivate.                        
#                                                                                 
default['apache']['KeepAlive'] =  'Off'

#
# MaxKeepAliveRequests: The maximum number of requests to allow
# during a persistent connection. Set to 0 to allow an unlimited amount.
# We recommend you leave this number high, for maximum performance.
#
default['apache']['MaxKeepAliveRequests'] = 100

#
# KeepAliveTimeout: Number of seconds to wait for the next request from the
# same client on the same connection.
#
default['apache']['KeepAliveTimeout'] = 15

# prefork MPM
# StartServers: number of server processes to start
# MinSpareServers: minimum number of server processes which are kept spare
# MaxSpareServers: maximum number of server processes which are kept spare
# ServerLimit: maximum value for MaxClients for the lifetime of the server
# MaxClients: maximum number of server processes allowed to start
# MaxRequestsPerChild: maximum number of requests a server process serves
default['apache']['StartServers'] = 8
default['apache']['MinSpareServers'] = 5
default['apache']['MaxSpareServers'] = 20
default['apache']['ServerLimit'] = 256
default['apache']['MaxClients'] = 256
default['apache']['MaxRequestsPerChild'] = 4000

# worker MPM
# StartServers: initial number of server processes to start
# MaxClients: maximum number of simultaneous client connections
# MinSpareThreads: minimum number of worker threads which are kept spare
# MaxSpareThreads: maximum number of worker threads which are kept spare
# ThreadsPerChild: constant number of worker threads in each server process
# MaxRequestsPerChild: maximum number of requests a server process serves
default['apache']['WorkerStartServers'] = 4
default['apache']['WorkerMaxClients'] = 300
default['apache']['MinSpareThreads'] = 25
default['apache']['MaxSpareThreads'] = 75
default['apache']['ThreadsPerChild'] = 25
default['apache']['WorkerMaxRequestsPerChild'] = 0

#
# Listen: Allows you to bind Apache to specific IP addresses and/or
# ports, in addition to the default. See also the <VirtualHost>
# directive.
#
# Change this to Listen on specific IP addresses as shown below to
# prevent Apache from glomming onto all bound IP addresses (0.0.0.0)
#
#Listen 12.34.56.78:80
default['apache']['port'] = 80
                                                                                                                                                              

#
# Load config files from the config directory "/etc/httpd/conf.d".
#
default['apache']['Include'] =  'conf.d/*.conf'

#
# ExtendedStatus controls whether Apache will generate "full" status
# information (ExtendedStatus On) or just basic information (ExtendedStatus
# Off) when the "server-status" handler is called. The default is Off.
#
default['apache']['ExtendedStatus'] =  'On'

#
# If you wish httpd to run as a different user or group, you must run
# httpd as root initially and it will switch.
#
# User/Group: The name (or #number) of the user/group to run httpd as.
#  . On SCO (ODT 3) use "User nouser" and "Group nogroup".
#  . On HPUX you may not be able to use shared memory as nobody, and the
#    suggested workaround is to create a user www and use that user.
#  NOTE that some kernels refuse to setgid(Group) or semctl(IPC_SET)
#  when the value of (unsigned)Group is above 60000;
#  don't use Group #-1 on these systems!
#
default['apache']['user'] =  'apache'
default['apache']['group'] =  'apache'


#                                                                                 
# ServerAdmin: Your address, where problems with the server should be             
# e-mailed.  This address appears on some server-generated pages, such            
# as error documents.  e.g. admin@your-domain.com                                 
#                                                                                 
default['apache']['ServerAdmin'] =  'root@localhost'

#
# ServerName gives the name and port that the server uses to identify itself.
# This can often be determined automatically, but we recommend you specify
# it explicitly to prevent problems during startup.
#
# If this is not set to valid DNS name for your host, server-generated
# redirections will not work.  See also the UseCanonicalName directive.
#
# If your host doesn't have a registered DNS name, enter its IP address here.
# You will have to access it by its address anyway, and this will make
# redirections work in a sensible way.
#
default['apache']['ServerName'] =  'www.example.com'

#
# UseCanonicalName: Determines how Apache constructs self-referencing
# URLs and the SERVER_NAME and SERVER_PORT variables.
# When set "Off", Apache will use the Hostname and Port supplied
# by the client.  When set "On", Apache will use the value of the
# ServerName directive.
#
default['apache']['UseCanonicalName'] =  'Off'

#
# DocumentRoot: The directory out of which you will serve your
# documents. By default, all requests are taken from this directory, but
# symbolic links and aliases may be used to point to other locations.
#
default['apache']['DocumentRoot'] =  '/var/www/html'

#
# Each directory to which Apache has access can be configured with respect
# to which services and features are allowed and/or disabled in that
# directory (and its subdirectories).
#
#
# First, we configure the "default" to be a very restrictive set of
# features.
#
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
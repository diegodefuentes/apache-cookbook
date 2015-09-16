
#
# When we also provide SSL we have to listen to the
# the HTTPS port in addition.
#
default['apache']['SSLport'] = 443

default['apache']['Builtin'] = 'builtin'

#   Inter-Process Session Cache:
#   Configure the SSL Session Cache: First the mechanism
#   to use and second the expiring timeout (in seconds).
default['apache']['SSLSessionCacheTimeout'] = 300

#   Semaphore:
#   Configure the path to the mutual exclusion semaphore the
#   SSL engine uses internally for inter-process synchronization.
default['apache']['SSLMutex'] = 'file:/var/log/httpd/ssl_mutex'

# Use separate log files for the SSL virtual host; note that LogLevel
# is not inherited from httpd.conf.
default['apache']['SSLErrorLog'] =  'logs/ssl_error_log'
default['apache']['SSLAccessLog'] =  'logs/ssl_access_log'
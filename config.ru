require './config/environment'


use Rack::MethodOverride
use BlogController
use UserController
run ApplicationController

require 'json'
require 'time'
require './planner'
require './rental'
require './car'

#
# Read data/input.json and generate relevant output file
#
Planner.new.generate_output

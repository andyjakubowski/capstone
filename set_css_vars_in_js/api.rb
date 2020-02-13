require 'sinatra'
require 'json'
require 'pry'

NAMES = ['Marcin', 'Danuta', 'Krystyna', 'Magda', 'Maria', 'Kasia']
nameHash = NAMES.map { |name| { name: name } }

colors = {
  'text-primary' => '#071421',
  'text-secondary' => '#49515A',
  'text-tertiary' => '#AFB3B8',
  'surface' => '#FFFFFF',
  'accent-primary' => '#D92FC1',
  'accent-secondary' => '#FFB638'
}

colorsArray = colors.keys.map { |key| { name: key, value: colors[key] } }

get '/' do
  headers({ 'Access-Control-Allow-Origin' => '*' })
  JSON.generate(colorsArray)
end

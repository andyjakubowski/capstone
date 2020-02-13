require 'sinatra'
require 'json'
require 'pry'

NAMES = ['Marcin', 'Danuta', 'Krystyna', 'Magda', 'Maria', 'Kasia']
nameHash = NAMES.map { |name| { name: name } }

colors = {
  text_primary: '#071421',
  text_secondary: '#49515A',
  text_tertiary: '#AFB3B8',
  surface: '#FFFFFF',
  accentPrimary: '#D92FC1',
  accentSecondary: '#FFB638'
}

colorsArray = colors.keys.map { |key| { key => colors[key] } }

get '/' do
  headers({ 'Access-Control-Allow-Origin' => '*' })
  JSON.generate(colorsArray)
end

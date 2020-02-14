require 'sinatra'
require 'json'
require 'pry'
require 'easydb_io'

colors = {
  'text-primary' => '#071421',
  'text-secondary' => '#49515A',
  'text-tertiary' => '#AFB3B8',
  'surface' => '#FFFFFF',
  'accent-primary' => '#D92FC1',
  'accent-secondary' => '#FFB638'
}

colorsArray = colors.keys.map { |key| { name: key, value: colors[key] } }

db = EasydbIo::EasyDB.new(
  'f7fca69b-f067-48e8-b7a4-fc192c207fc0',
  '164c6159-812e-424e-881f-acbfab85fa27'
)

get '/' do
  headers({ 'Access-Control-Allow-Origin' => '*' })
  JSON.generate(colorsArray)
end

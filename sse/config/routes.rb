Rails.application.routes.draw do
  get 'sse', to: 'streams#sse'
  root 'streams#stream'
end

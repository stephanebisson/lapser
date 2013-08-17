example ?= {}
example.converter ?= {}

example.converter.apiEndpoint = "http://rate-exchange.appspot.com" if _.isUndefined(example.converter.apiEndpoint)

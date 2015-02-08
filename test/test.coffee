should = require 'should'
Zombie = require 'zombie'
path   = require 'path'

browser = new Zombie()
test_page_path = "file://#{path.join(process.cwd(), 'index.html')}"

describe 'basic functionality', ->

  $ = null

  before (done) ->
    browser
      .visit(test_page_path)
      .then(browser.wait.bind(browser))
      .then -> done()

  it 'should open when clicked', (done) ->
    # $('.social').css('opacity').should.equal '0'
    # $('.social').css('opacity').should.equal '1'
    browser.fire '.share-button label', 'click', (e, browser) ->
      res = browser.query('.social')
      console.log(res)
      done()

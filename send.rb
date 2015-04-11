#!/usr/bin/env ruby
# encoding: utf-8

require "bunny"

conn = Bunny.new(:automatically_recover => false)
conn.start

ch   = conn.create_channel
msg=gets.chomp
puts msg
q    = ch.queue("test_queue")
ch.default_exchange.publish(String(msg), :routing_key => q.name)
puts " [x] Sent 'Hello World!'"

conn.close

# Copyright (c) 2012 FTSY
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

define ["cs!filesafr/core"], (h) ->
  module "Core Helpers"

  test "mix one object into another", ->
    obj = {a: 1, b: 2}
    module = {c: 2, d: 3}
    other = {b: 5, c: 3}

    h.mix(obj, module, other)

    deepEqual({a: 1, b: 5, c: 3, d: 3}, obj)

  test "extract key from a hash", ->
    options = {a: 1, b: 2, c: 3}

    val = h.extractOption(options, "b")

    equal(2, val)
    deepEqual({a: 1, c: 3}, options)
    equal(null, options.b)

  test "extract inexistent option", ->
    options = {a: 1, b: 2, c: 3}

    val = h.extractOption(options, "d")
    equal(null, val)
    deepEqual({a: 1, b: 2, c: 3}, options)

  test "parse url domain with protocol", ->
    equal("http://www.google.com", h.parseUrlBase("http://www.google.com/search/something"))
    equal("https://www.google.com", h.parseUrlBase("https://www.google.com/search/something?andmore"))
    equal("http://mysite.de", h.parseUrlBase("http://mysite.de/upload"))
    equal("http://example.com", h.parseUrlBase("http://example.com"))
    equal("http://example.com", h.parseUrlBase("http://example.com/"))
    equal("null", h.parseUrlBase(null))

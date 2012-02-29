define ["cs!filesafr/servers/base", "cs!filesafr/basic_file"], (Server, BasicFile) ->
  class Anonfiles extends Server
    uploadUrl: -> "https://anonfiles.com/en/upload"

    createFormData: (file, options) ->
      fd = new FormData()
      fd.append("input_file", file, options.filename)
      fd.append("upl", "Upload")
      fd

    parseSuccess: (e) ->
      xhr = e.target
      url = e.target.responseText.match(/http:\/\/cdn\.anonfiles\.com\/[^"]+/)[0]
      new BasicFile(url)

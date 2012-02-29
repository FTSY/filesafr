define ["cs!filesafr/servers/base", "cs!filesafr/basic_file"], (Server, BasicFile) ->
  class ZHost extends Server
    uploadUrl: -> "http://zhost.tk/"

    createFormData: (file, options) ->
      fd = new FormData()
      fd.append "file", file, options.filename
      fd.append "submit", "Upload file"
      fd

    parseSuccess: (e) ->
      xhr = e.target
      match = xhr.responseText.match(/value="(http:\/\/zhost\.tk\/.+?\.png)"/)

      if match
        console.log("got result url", match[1])
        new BasicFile(match[1])
      else
        console.log("can't match url on result", e)
        null

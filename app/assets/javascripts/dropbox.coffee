$ ->
  $("a[data-dropbox-user-id]").click (e) ->
    e.preventDefault()
    Dropbox.choose(
      success: (files) ->
        
        console.log("filename = " + files[0].name)
        return

      linkType: "direct"
    )

    userId = $(this).data("dropbox-user-id")
    console.log("userId = " + userId)
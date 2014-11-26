$ ->
  $("a[data-dropbox-user-id]").click (e) ->
    e.preventDefault()
    userId = $(this).data("dropbox-user-id")
    Dropbox.choose(
      success: (files) ->
        
        console.log("filename = " + files[0].name)

        $.ajax
          dataType: "script"
          type: 'post'
          url: "/file_messages"
          data:
            recipient_id: userId
            file_message: files[0]

          success: ->

          error: ->

        return

      linkType: "preview"
    )


    console.log("userId = " + userId)